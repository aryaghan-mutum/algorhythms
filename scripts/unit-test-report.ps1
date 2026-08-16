#!/usr/bin/env pwsh
# Unit-test + code-coverage report generator for Algorhythms.
#
# Usage:
#   .\scripts\unit-test-report.ps1 [-TestDir tests/] [-OutputFile reports/unit-test-report.html] [-SkipCoverage]
#
# Produces reports/unit-test-report.html with:
#   * Overall pass/fail badge, headline counters
#   * Pass/fail/error pie chart and per-file bar chart (Chart.js from CDN)
#   * Per-file drill-down of each test-case status (PASS/FAIL/ERROR + inline detail)
#   * Code-coverage summary card + link to the full raco-cover HTML tree
#     (written to reports/coverage/index.html)
#
# Requires:
#   raco (Racket 8.14+), raco cover (`raco pkg install cover` — one-time)

param(
    [string]$TestDir       = "tests/",
    [string]$OutputFile    = "reports/unit-test-report.html",
    [string]$CoverageDir   = "reports/coverage",
    [switch]$SkipCoverage
)

# Redirect racket's compiled/ cache out of the repo tree
$compiledCacheBase = if ($env:LOCALAPPDATA) { $env:LOCALAPPDATA } else { Join-Path $HOME ".cache" }
$env:PLTCOMPILEDROOTS = (Join-Path $compiledCacheBase "racket-compiled-cache") + '/@(version)/'

$outDir = Split-Path $OutputFile -Parent
if ($outDir -and -not (Test-Path $outDir)) {
    New-Item -ItemType Directory -Path $outDir -Force | Out-Null
}

function HtmlEscape([string]$s) {
    $s -replace '&','&amp;' -replace '<','&lt;' -replace '>','&gt;'
}

# =================================================================
# 1) Run raco test and parse output
# =================================================================

Write-Host "Running: raco test $TestDir ..." -ForegroundColor Cyan
$rawOutput = (& raco test $TestDir 2>&1) | ForEach-Object { $_.ToString() }
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

$suites         = [System.Collections.Generic.List[hashtable]]::new()
$currentFile    = "(unknown)"
$lastFileSeen   = "(unknown)"
$fileHasSummary = $false
$totalPass      = 0; $totalFail = 0; $totalError = 0

$failureBlocks  = [System.Collections.Generic.List[hashtable]]::new()
$inBlock        = $false
$blockLines     = [System.Collections.Generic.List[string]]::new()
$blockFile      = $currentFile

function Flush-File {
    if (-not $fileHasSummary -and $lastFileSeen -ne "(unknown)") {
        $script:suites.Add(@{ File = $lastFileSeen; Pass = "?"; Fail = 0; Error = 0 })
    }
}

foreach ($line in $rawOutput) {
    $text = "$line"

    if ($text -eq '--------------------') {
        if (-not $inBlock) {
            $inBlock = $true
            $blockLines.Clear()
            $blockFile = $currentFile
        }
        else {
            $inBlock = $false
            if ($blockLines.Count -gt 0) {
                $header       = $blockLines[0]
                $kind         = "FAILURE"
                $locationLine = $null
                $detailLines  = [System.Collections.Generic.List[string]]::new()
                for ($i = 1; $i -lt $blockLines.Count; $i++) {
                    $ln = $blockLines[$i]
                    if ($ln -match '^System\.Management\.Automation\.') { continue }
                    if ($ln -eq 'FAILURE' -or $ln -eq 'ERROR') { $kind = $ln; continue }
                    if ($ln -match '^location:\s+(.+):(\d+):(\d+)\s*$') {
                        $locationLine = [int]$Matches[2]
                    }
                    $detailLines.Add((HtmlEscape $ln))
                }
                $failureBlocks.Add(@{
                    File         = $blockFile
                    Header       = (HtmlEscape $header)
                    Kind         = $kind
                    LocationLine = $locationLine
                    Detail       = ($detailLines -join "`n")
                })
            }
        }
        continue
    }
    if ($inBlock) { $blockLines.Add($text); continue }

    if ($text -match 'raco test: \(file "(.+?)"\)') {
        Flush-File
        $currentFile    = ($Matches[1].Replace('\','/') -replace '^\./', '') -replace '//', '/'
        $lastFileSeen   = $currentFile
        $fileHasSummary = $false
    }
    elseif ($text -match '(\d+) success.es. (\d+) failure.s. (\d+) error.s.') {
        $p = [int]$Matches[1]; $f = [int]$Matches[2]; $e = [int]$Matches[3]
        $suites.Add(@{ File = $currentFile; Pass = $p; Fail = $f; Error = $e })
        $totalPass += $p; $totalFail += $f; $totalError += $e
        $fileHasSummary = $true
    }
}
Flush-File

# Static-scan each test file for individual test-case names + the exact
# function under test (parsed from the test-case body) and a plain-English
# description of what each case verifies.

# Skip these when heuristically picking the tested function out of a test-case
# body: rackunit primitives, Racket syntactic forms, and generic list combinators
# that are almost never the subject of a test-case.
$skipCallees = @(
    'test-case','test-suite',
    'check-equal?','check-true','check-false','check-within','check-=',
    'check-exn','check-eqv?','check-pred','check-not-equal?','check-not-eq?',
    'check-not-false','check-eq?','check-regexp-match','check-not-exn',
    'lambda','let','let*','letrec','letrec-values','let-values','define',
    'cond','if','case','when','unless','begin','quote','unquote','and','or',
    'not','set!','for','for/list','for/vector','for/hash','in-list','in-range',
    'in-vector','in-hash','string-append','error','apply','values',
    'delay','force')

function Extract-Method([string]$body) {
    # Strip double-quoted strings so identifiers appearing inside a test-case
    # name (e.g. "(memoized)") don't leak into the extraction result.
    $stripped = [regex]::Replace($body, '"[^"]*"', '""')
    foreach ($m in [regex]::Matches($stripped, '\(([a-zA-Z][a-zA-Z0-9\-\?\!<>*/=+_.]*)')) {
        $name = $m.Groups[1].Value
        if ($skipCallees -notcontains $name) { return $name }
    }
    return "-"
}

function Describe-Case([string]$name, [string]$method) {
    if ([string]::IsNullOrWhiteSpace($name)) { return "-" }
    $lower = $name.Substring(0,1).ToLower() + $name.Substring(1)
    if ($method -eq "-" -or [string]::IsNullOrWhiteSpace($method)) {
        return "Verifies that $lower."
    }
    return "Verifies '$method' - $lower."
}

$testCaseMap = @{}
foreach ($s in $suites) {
    $file = $s.File
    if ($testCaseMap.ContainsKey($file)) { continue }
    $fullPath = Join-Path (Get-Location) $file
    if (-not (Test-Path -LiteralPath $fullPath)) { continue }
    $entries = [System.Collections.Generic.List[hashtable]]::new()
    $allLines = @(Get-Content -LiteralPath $fullPath)
    for ($i = 0; $i -lt $allLines.Count; $i++) {
        $srcLine = "$($allLines[$i])"
        if ($srcLine -match '\(test-case\s+"([^"]*)"') {
            $name   = $Matches[1]
            $endIdx = [Math]::Min($i + 5, $allLines.Count - 1)
            $body   = ($allLines[$i..$endIdx] -join ' ')
            $method = Extract-Method $body
            $desc   = Describe-Case $name $method
            $entries.Add(@{
                Line        = $i + 1
                Name        = (HtmlEscape $name)
                Method      = (HtmlEscape $method)
                Description = (HtmlEscape $desc)
                Status      = "PASS"
                Detail      = $null
                Header      = $null
            })
        }
    }
    if ($entries.Count -gt 0) { $testCaseMap[$file] = $entries }
}

# Match FAILURE/ERROR blocks to test-case declarations
$unmatchedFailures = [System.Collections.Generic.List[hashtable]]::new()
foreach ($fb in $failureBlocks) {
    $entries = $testCaseMap[$fb.File]
    $owner   = $null
    if ($entries -and $null -ne $fb.LocationLine) {
        foreach ($e in $entries) {
            if ($e.Line -le $fb.LocationLine -and (-not $owner -or $e.Line -gt $owner.Line)) {
                $owner = $e
            }
        }
    }
    if ($owner) { $owner.Status = $fb.Kind; $owner.Detail = $fb.Detail; $owner.Header = $fb.Header }
    else       { $unmatchedFailures.Add($fb) }
}

# =================================================================
# 2) Run raco cover for code coverage (optional)
# =================================================================

$coveragePct       = $null
$coverageCovered   = 0
$coverageTotal     = 0
$coverageIndexLink = $null
$rawCoveragePath   = "reports/coverage-raw/coverage.rktl"

if (-not $SkipCoverage) {
    Write-Host "Running: raco cover -b -d $CoverageDir $TestDir ..." -ForegroundColor Cyan
    & raco cover -b -d $CoverageDir $TestDir 2>&1 | Out-Null

    Write-Host "Running: raco cover -f raw for aggregate metrics ..." -ForegroundColor Cyan
    if (-not (Test-Path "reports/coverage-raw")) {
        New-Item -ItemType Directory -Path "reports/coverage-raw" -Force | Out-Null
    }
    & raco cover -b -f raw -d "reports/coverage-raw" $TestDir 2>&1 | Out-Null

    if (Test-Path $rawCoveragePath) {
        # coverage.rktl is a #hash( "path" . ((#t/#f srcloc) ...) ...) form.
        # Count #t / #f tokens as a proxy for covered / uncovered expressions.
        $raw = Get-Content -Raw -LiteralPath $rawCoveragePath
        $covered   = ([regex]::Matches($raw, '\(#t\s+#\(struct:srcloc')).Count
        $uncovered = ([regex]::Matches($raw, '\(#f\s+#\(struct:srcloc')).Count
        $coverageCovered = $covered
        $coverageTotal   = $covered + $uncovered
        if ($coverageTotal -gt 0) {
            $coveragePct = [math]::Round(($covered / $coverageTotal) * 100, 1)
        }
    }
    if (Test-Path "$CoverageDir/index.html") {
        # Compute the coverage index path relative to the report's own directory,
        # so the link works from the report's on-disk location.
        $reportDir       = if ($outDir) { (Resolve-Path $outDir).Path } else { (Get-Location).Path }
        $coverageAbsPath = (Resolve-Path "$CoverageDir/index.html").Path
        $relUri = [System.Uri]::new($reportDir.TrimEnd('\','/') + [System.IO.Path]::DirectorySeparatorChar).MakeRelativeUri([System.Uri]::new($coverageAbsPath))
        $coverageIndexLink = $relUri.ToString()
    }
}

# =================================================================
# 3) Build the HTML
# =================================================================

$total        = $totalPass + $totalFail + $totalError
$overallClass = if ($totalFail -gt 0 -or $totalError -gt 0) { "badge-fail" } else { "badge-pass" }
$overallLabel = if ($totalFail -gt 0 -or $totalError -gt 0) { "FAILED" }     else { "ALL PASSED" }

$rows = ($suites | ForEach-Object {
    $rowClass = if ($_.Fail -gt 0 -or $_.Error -gt 0) { "row-fail" } else { "row-pass" }
    $icon     = if ($_.Fail -gt 0 -or $_.Error -gt 0) { "&#10007;" }  else { "&#10003;" }
    $passCell = if ($_.Pass -eq "?") { "<td class='num' title='custom output format'>?</td>" } else { "<td class='num'>$($_.Pass)</td>" }
    "<tr class='$rowClass'><td>$icon</td><td>$($_.File)</td>" +
    "$passCell<td class='num'>$($_.Fail)</td><td class='num'>$($_.Error)</td></tr>"
}) -join "`n"

$fileDetailSections = ($suites | ForEach-Object {
    $file = $_.File
    if (-not $testCaseMap.ContainsKey($file)) { return }
    $entries  = $testCaseMap[$file]
    $openAttr = if ($_.Fail -gt 0 -or $_.Error -gt 0) { " open" } else { "" }
    $caseRows = ($entries | ForEach-Object {
        $statusClass = switch ($_.Status) { "PASS" {"case-pass"} "FAILURE" {"case-fail"} "ERROR" {"case-error"} }
        $label       = switch ($_.Status) { "PASS" {"PASS"}     "FAILURE" {"FAIL"}       "ERROR" {"ERROR"} }
        $detailCell  = if ($_.Detail) { "<pre>$($_.Header)`n$($_.Detail)</pre>" } else { "" }
        $methodCell  = if ($_.Method -and $_.Method -ne "-") { "<code>$($_.Method)</code>" } else { "<span class='muted'>&mdash;</span>" }
        "<tr class='$statusClass'><td>$($_.Name)</td><td class='method'>$methodCell</td><td class='desc'>$($_.Description)</td><td class='status'>$label</td><td>$detailCell</td></tr>"
    }) -join "`n"
    @"
  <details class="file-detail"$openAttr>
    <summary>$file &nbsp;<span class="muted">($($entries.Count) test case$(if ($entries.Count -ne 1) { 's' }))</span></summary>
    <table class="case-table">
      <thead><tr><th>Test Case</th><th>Method Name</th><th>Description</th><th>Status</th><th>Detail</th></tr></thead>
      <tbody>
$caseRows
      </tbody>
    </table>
  </details>
"@
}) -join "`n"

$unmatchedSection = if ($unmatchedFailures.Count -gt 0) {
    $blocks = ($unmatchedFailures | ForEach-Object { "<pre>[$($_.File)] $($_.Header)`n$($_.Kind)`n$($_.Detail)</pre>" }) -join "`n"
    "<h2>Other Failure Details</h2><div class='failures'>$blocks</div>"
} else { "" }

# Chart data (JSON literals)
$chartLabels = ($suites | ForEach-Object { "`"$($_.File)`"" }) -join ", "
$chartPass   = ($suites | ForEach-Object { if ($_.Pass -eq "?") { "0" } else { "$($_.Pass)" } }) -join ", "
$chartFail   = ($suites | ForEach-Object { "$($_.Fail)" }) -join ", "
$chartError  = ($suites | ForEach-Object { "$($_.Error)" }) -join ", "

# Coverage card content
$coverageCard = if ($SkipCoverage) {
    "<div class='card'><div class='card-title'>Coverage</div><div class='card-value muted'>skipped</div><div class='card-sub muted'>--SkipCoverage was set</div></div>"
} elseif ($null -ne $coveragePct) {
    $link = if ($coverageIndexLink) { "<a href='$coverageIndexLink' class='card-link'>View full raco cover report &rarr;</a>" } else { "" }
    $color = if ($coveragePct -ge 80) { "var(--green)" } elseif ($coveragePct -ge 60) { "var(--amber)" } else { "var(--red)" }
    @"
<div class='card'>
  <div class='card-title'>Code Coverage</div>
  <div class='card-value' style='color:$color'>$coveragePct%</div>
  <div class='card-sub'>$coverageCovered / $coverageTotal expressions covered</div>
  $link
</div>
"@
} else {
    "<div class='card'><div class='card-title'>Coverage</div><div class='card-value muted'>n/a</div><div class='card-sub muted'>raco cover produced no data</div></div>"
}

$html = @"
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Algorhythms Unit Test Report</title>
  <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.1/dist/chart.umd.min.js"></script>
  <style>
    :root {
      --bg:#08090c; --bg-panel:#12141a; --bg-raised:#1a1d25; --border:#262a35;
      --text:#e6e8ee; --text-dim:#8b93a7; --accent:#6ea8fe;
      --green:#3ddc97; --green-bg:#113328;
      --red:#ff6b6b;   --red-bg:#3a1616;
      --amber:#ffb454; --amber-bg:#3a2a10;
    }
    *, *::before, *::after { box-sizing: border-box; }
    body { font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif;
           margin:2.5rem auto; max-width:1080px; color:var(--text); background:var(--bg);
           padding:0 1.25rem 4rem; }
    h1 { margin-bottom:.2rem; letter-spacing:-.02em; }
    h2 { margin-top:2.5rem; border-bottom:1px solid var(--border); padding-bottom:.4rem; }
    code { background:var(--bg-raised); padding:.1rem .4rem; border-radius:4px; color:var(--accent); }
    .meta { color:var(--text-dim); font-size:.88rem; margin-bottom:1.5rem; }
    .badge-pass, .badge-fail { display:inline-block; padding:.5rem 1.4rem; border-radius:6px;
      font-weight:700; font-size:1.05rem; letter-spacing:.03em; margin-bottom:1.75rem;
      border:1px solid transparent; }
    .badge-pass { background:var(--green-bg); color:var(--green); border-color:#1e5c46; }
    .badge-fail { background:var(--red-bg);   color:var(--red);   border-color:#6b2323; }
    .summary { display:flex; gap:1rem; margin-bottom:2rem; flex-wrap:wrap; }
    .stat { background:var(--bg-panel); border:1px solid var(--border); border-radius:8px;
            padding:.9rem 1.6rem; text-align:center; min-width:110px; }
    .stat .n { font-size:2.1rem; font-weight:700; line-height:1; }
    .stat .l { font-size:.72rem; color:var(--text-dim); text-transform:uppercase; letter-spacing:.06em; margin-top:.3rem; }

    .cards { display:grid; grid-template-columns:repeat(auto-fit,minmax(220px,1fr)); gap:1rem; margin:1.5rem 0; }
    .card { background:var(--bg-panel); border:1px solid var(--border); border-radius:8px; padding:1.2rem 1.4rem; }
    .card-title { color:var(--text-dim); font-size:.72rem; text-transform:uppercase; letter-spacing:.06em; margin-bottom:.4rem; }
    .card-value { font-size:2.2rem; font-weight:700; line-height:1; }
    .card-sub   { color:var(--text-dim); font-size:.82rem; margin-top:.4rem; }
    .card-link  { color:var(--accent); font-size:.82rem; text-decoration:none; display:inline-block; margin-top:.6rem; }
    .card-link:hover { text-decoration:underline; }

    .charts { display:grid; grid-template-columns: 320px 1fr; gap:1.5rem; margin:1.5rem 0 2.5rem; }
    @media (max-width: 780px) { .charts { grid-template-columns: 1fr; } }
    .chart-wrap { background:var(--bg-panel); border:1px solid var(--border); border-radius:8px; padding:1rem 1.25rem; }
    .chart-wrap h3 { margin:0 0 .8rem; font-size:.85rem; color:var(--text-dim); text-transform:uppercase; letter-spacing:.06em; font-weight:600; }
    .chart-wrap canvas { max-height:280px; }

    table { border-collapse:collapse; width:100%; font-size:.88rem; }
    th { background:var(--bg-raised); color:var(--text); padding:.6rem .9rem; text-align:left;
         white-space:nowrap; font-weight:600; border-bottom:1px solid var(--border); }
    td { padding:.55rem .9rem; border-bottom:1px solid var(--border); vertical-align:top; }
    .num { text-align:right; font-variant-numeric:tabular-nums; }
    .row-pass td:first-child { color:var(--green); font-size:1.1rem; }
    .row-fail { background:rgba(255,107,107,.06); }
    .row-fail td:first-child { color:var(--red); font-size:1.1rem; }
    .muted { color:var(--text-dim); font-weight:400; font-size:.8rem; }

    details.file-detail { background:var(--bg-panel); border:1px solid var(--border); border-radius:8px;
                          margin-bottom:.75rem; overflow:hidden; }
    details.file-detail > summary { cursor:pointer; padding:.7rem 1rem; font-weight:600; list-style:none;
                                    display:flex; align-items:center; gap:.4rem; user-select:none; }
    details.file-detail > summary::-webkit-details-marker { display:none; }
    details.file-detail > summary::before { content:"▸"; color:var(--text-dim); transition:transform .15s ease; }
    details.file-detail[open] > summary::before { transform: rotate(90deg); }
    details.file-detail > summary:hover { background:var(--bg-raised); }
    table.case-table { font-size:.84rem; }
    table.case-table th { background:transparent; border-bottom:1px solid var(--border); }
    table.case-table td.method { font-family: ui-monospace, SFMono-Regular, Consolas, monospace; }
    table.case-table td.method code { background:transparent; color:var(--accent); padding:0; }
    table.case-table td.desc { color:var(--text-dim); font-size:.82rem; max-width:340px; }
    tr.case-pass  td.status { color:var(--green); font-weight:700; }
    tr.case-fail  td.status { color:var(--red);   font-weight:700; }
    tr.case-error td.status { color:var(--amber); font-weight:700; }
    tr.case-fail, tr.case-error { background:rgba(255,107,107,.05); }

    pre, .failures { background:var(--bg-raised); border:1px solid var(--border); border-radius:6px;
                     padding:.7rem .9rem; overflow-x:auto; white-space:pre-wrap; word-break:break-word;
                     font-size:.8rem; color:var(--text-dim); margin:0; }
    .failures pre { margin-bottom:.75rem; }
  </style>
</head>
<body>
  <h1>Algorhythms Unit Test Report</h1>
  <p class="meta">Generated: $timestamp &nbsp;|&nbsp; Test directory: <code>$TestDir</code></p>
  <div class="$overallClass">$overallLabel</div>

  <div class="summary">
    <div class="stat"><div class="n">$total</div><div class="l">Total</div></div>
    <div class="stat"><div class="n" style="color:var(--green)">$totalPass</div><div class="l">Passed</div></div>
    <div class="stat"><div class="n" style="color:var(--red)">$totalFail</div><div class="l">Failed</div></div>
    <div class="stat"><div class="n" style="color:var(--amber)">$totalError</div><div class="l">Errors</div></div>
    <div class="stat"><div class="n">$($suites.Count)</div><div class="l">Test Files</div></div>
  </div>

  <div class="cards">
    $coverageCard
  </div>

  <div class="charts">
    <div class="chart-wrap">
      <h3>Result Distribution</h3>
      <canvas id="pieChart"></canvas>
    </div>
    <div class="chart-wrap">
      <h3>Tests per File</h3>
      <canvas id="barChart"></canvas>
    </div>
  </div>

  <h2>Test Files ($($suites.Count))</h2>
  <table>
    <thead><tr><th></th><th>File</th><th class="num">Pass</th><th class="num">Fail</th><th class="num">Error</th></tr></thead>
    <tbody>
$rows
    </tbody>
  </table>

  <h2>Test Case Detail</h2>
  $fileDetailSections
  $unmatchedSection

  <script>
    const chartTextColor = '#8b93a7';
    Chart.defaults.color = chartTextColor;
    Chart.defaults.borderColor = '#262a35';

    new Chart(document.getElementById('pieChart'), {
      type: 'doughnut',
      data: {
        labels: ['Passed', 'Failed', 'Errors'],
        datasets: [{
          data: [$totalPass, $totalFail, $totalError],
          backgroundColor: ['#3ddc97', '#ff6b6b', '#ffb454'],
          borderColor: '#12141a',
          borderWidth: 2
        }]
      },
      options: {
        responsive: true,
        plugins: { legend: { position: 'bottom' } }
      }
    });

    new Chart(document.getElementById('barChart'), {
      type: 'bar',
      data: {
        labels: [$chartLabels],
        datasets: [
          { label: 'Passed', data: [$chartPass],  backgroundColor: '#3ddc97', stack: 'a' },
          { label: 'Failed', data: [$chartFail],  backgroundColor: '#ff6b6b', stack: 'a' },
          { label: 'Errors', data: [$chartError], backgroundColor: '#ffb454', stack: 'a' }
        ]
      },
      options: {
        responsive: true,
        plugins: { legend: { position: 'bottom' } },
        scales: {
          x: { stacked: true, ticks: { autoSkip: false, maxRotation: 60, minRotation: 30, font: { size: 10 } } },
          y: { stacked: true, beginAtZero: true }
        }
      }
    });
  </script>
</body>
</html>
"@

$html | Out-File -FilePath $OutputFile -Encoding UTF8
Write-Host "Report written to: $OutputFile" -ForegroundColor Green
if ($coverageIndexLink) {
    Write-Host "Coverage report: $CoverageDir/index.html" -ForegroundColor Green
}
Start-Process $OutputFile
