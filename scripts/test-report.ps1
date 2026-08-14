#!/usr/bin/env pwsh
# Runs raco test and generates a self-contained HTML report.
# Usage:  .\scripts\test-report.ps1 [-TestDir tests/] [-OutputFile reports/test-report.html]

param(
    [string]$TestDir    = "tests/",
    [string]$OutputFile = "reports/test-report.html"
)

# Keep raco from scattering compiled/ folders through the repo; @(version) is substituted by Racket itself
$compiledCacheBase = if ($env:LOCALAPPDATA) { $env:LOCALAPPDATA } else { Join-Path $HOME ".cache" }
$env:PLTCOMPILEDROOTS = (Join-Path $compiledCacheBase "racket-compiled-cache") + '/@(version)/'

# Ensure the output directory exists
$outDir = Split-Path $OutputFile -Parent
if ($outDir -and -not (Test-Path $outDir)) {
    New-Item -ItemType Directory -Path $outDir -Force | Out-Null
}

Write-Host "Running: raco test $TestDir ..." -ForegroundColor Cyan
# Force every output object (including stderr ErrorRecords) to plain strings
$rawOutput = (& raco test $TestDir 2>&1) | ForEach-Object { $_.ToString() }
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

function HtmlEscape([string]$s) {
    $s -replace '&','&amp;' -replace '<','&lt;' -replace '>','&gt;'
}

# ── Parse output ───────────────────────────────────────────────────────────────
# Two things are extracted from the raw raco test stream in a single pass:
#  1. per-file pass/fail/error summary lines (as before)
#  2. per-check "--------------------" delimited FAILURE/ERROR blocks, later
#     matched back to a source test-case by comparing the check's reported
#     location line to test-case declarations statically scanned from the file
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
    # If a file produced no standard summary line, add it as pass with unknown count
    if (-not $fileHasSummary -and $lastFileSeen -ne "(unknown)") {
        $script:suites.Add(@{ File = $lastFileSeen; Pass = "?"; Fail = 0; Error = 0 })
    }
}

foreach ($line in $rawOutput) {
    $text = "$line"

    if ($text -eq '--------------------') {
        if (-not $inBlock) {
            $inBlock   = $true
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
                    # Discard the PowerShell native-stderr wrapper artifact that appears
                    # before an ERROR block's raised-exception message
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
    if ($inBlock) {
        $blockLines.Add($text)
        continue
    }

    if ($text -match 'raco test: \(file "(.+?)"\)') {
        Flush-File
        # Normalise: replace backslashes, strip leading ./, collapse double slashes
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

# ── Statically scan each source test file for individual test-case names ───────
# Gives us "method name" level granularity without requiring any change to the
# test files themselves or their rackunit run-tests/text-ui reporting mode.
$testCaseMap = @{}
foreach ($s in $suites) {
    $file = $s.File
    if ($testCaseMap.ContainsKey($file)) { continue }
    $fullPath = Join-Path (Get-Location) $file
    if (-not (Test-Path -LiteralPath $fullPath)) { continue }

    $entries = [System.Collections.Generic.List[hashtable]]::new()
    $lineNo  = 0
    foreach ($srcLine in Get-Content -LiteralPath $fullPath) {
        $lineNo++
        if ($srcLine -match '\(test-case\s+"([^"]*)"') {
            $entries.Add(@{
                Line   = $lineNo
                Name   = (HtmlEscape $Matches[1])
                Status = "PASS"
                Detail = $null
                Header = $null
            })
        }
    }
    if ($entries.Count -gt 0) { $testCaseMap[$file] = $entries }
}

# Match each FAILURE/ERROR block to the nearest preceding test-case declaration
# in the same file (the check's location line always falls inside its owning
# test-case body); anything that can't be matched is kept for a fallback section.
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
    if ($owner) {
        $owner.Status = $fb.Kind
        $owner.Detail = $fb.Detail
        $owner.Header = $fb.Header
    }
    else {
        $unmatchedFailures.Add($fb)
    }
}

# ── Build HTML ─────────────────────────────────────────────────────────────────
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
        $statusClass = switch ($_.Status) {
            "PASS"    { "case-pass" }
            "FAILURE" { "case-fail" }
            "ERROR"   { "case-error" }
        }
        $label       = switch ($_.Status) { "PASS" { "PASS" } "FAILURE" { "FAIL" } "ERROR" { "ERROR" } }
        $detailCell  = if ($_.Detail) { "<pre>$($_.Header)`n$($_.Detail)</pre>" } else { "" }
        "<tr class='$statusClass'><td>$($_.Name)</td><td class='status'>$label</td><td>$detailCell</td></tr>"
    }) -join "`n"

    @"
  <details class="file-detail"$openAttr>
    <summary>$file &nbsp;<span class="muted">($($entries.Count) test case$(if ($entries.Count -ne 1) { 's' }))</span></summary>
    <table class="case-table">
      <thead><tr><th>Test Case</th><th>Status</th><th>Detail</th></tr></thead>
      <tbody>
$caseRows
      </tbody>
    </table>
  </details>
"@
}) -join "`n"

$unmatchedSection = if ($unmatchedFailures.Count -gt 0) {
    $blocks = ($unmatchedFailures | ForEach-Object {
        "<pre>[$($_.File)] $($_.Header)`n$($_.Kind)`n$($_.Detail)</pre>"
    }) -join "`n"
    "<h2>Other Failure Details</h2><div class='failures'>$blocks</div>"
} else { "" }

$html = @"
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Algorhythms Test Report</title>
  <style>
    :root {
      --bg:        #08090c;
      --bg-panel:  #12141a;
      --bg-raised: #1a1d25;
      --border:    #262a35;
      --text:      #e6e8ee;
      --text-dim:  #8b93a7;
      --accent:    #6ea8fe;
      --green:     #3ddc97;
      --green-bg:  #113328;
      --red:       #ff6b6b;
      --red-bg:    #3a1616;
      --amber:     #ffb454;
      --amber-bg:  #3a2a10;
    }
    *, *::before, *::after { box-sizing: border-box; }
    body   { font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
             margin: 2.5rem auto; max-width: 980px; color: var(--text); background: var(--bg);
             padding: 0 1.25rem 4rem; }
    h1     { margin-bottom: .2rem; letter-spacing: -.02em; }
    h2     { margin-top: 2.5rem; border-bottom: 1px solid var(--border); padding-bottom: .4rem; }
    code   { background: var(--bg-raised); padding: .1rem .4rem; border-radius: 4px; color: var(--accent); }
    .meta  { color: var(--text-dim); font-size: .88rem; margin-bottom: 1.5rem; }
    .badge-pass, .badge-fail {
      display:inline-block; padding:.5rem 1.4rem; border-radius:6px;
      font-weight:700; font-size:1.05rem; letter-spacing:.03em; margin-bottom:1.75rem;
      border:1px solid transparent;
    }
    .badge-pass { background:var(--green-bg); color:var(--green); border-color:#1e5c46; }
    .badge-fail { background:var(--red-bg);   color:var(--red);   border-color:#6b2323; }
    .summary { display:flex; gap:1rem; margin-bottom:2rem; flex-wrap:wrap; }
    .stat    { background:var(--bg-panel); border:1px solid var(--border); border-radius:8px;
               padding:.9rem 1.6rem; text-align:center; min-width:100px; }
    .stat .n { font-size:2.1rem; font-weight:700; line-height:1; }
    .stat .l { font-size:.72rem; color:var(--text-dim); text-transform:uppercase; letter-spacing:.06em; margin-top:.3rem; }
    table    { border-collapse:collapse; width:100%; font-size:.88rem; }
    th       { background:var(--bg-raised); color:var(--text); padding:.6rem .9rem; text-align:left;
               white-space:nowrap; font-weight:600; border-bottom:1px solid var(--border); }
    td       { padding:.55rem .9rem; border-bottom:1px solid var(--border); vertical-align:top; }
    .num     { text-align:right; font-variant-numeric:tabular-nums; }
    .row-pass td:first-child { color:var(--green); font-size:1.1rem; }
    .row-fail                { background:rgba(255,107,107,.06); }
    .row-fail td:first-child { color:var(--red); font-size:1.1rem; }
    .muted   { color: var(--text-dim); font-weight:400; font-size:.8rem; }

    details.file-detail {
      background:var(--bg-panel); border:1px solid var(--border); border-radius:8px;
      margin-bottom:.75rem; overflow:hidden;
    }
    details.file-detail > summary {
      cursor:pointer; padding:.7rem 1rem; font-weight:600; list-style:none;
      display:flex; align-items:center; gap:.4rem; user-select:none;
    }
    details.file-detail > summary::-webkit-details-marker { display:none; }
    details.file-detail > summary::before {
      content:"▸"; color:var(--text-dim); transition:transform .15s ease;
    }
    details.file-detail[open] > summary::before { transform: rotate(90deg); }
    details.file-detail > summary:hover { background:var(--bg-raised); }
    table.case-table { font-size:.84rem; }
    table.case-table th { background:transparent; border-bottom:1px solid var(--border); }
    tr.case-pass  td.status { color:var(--green); font-weight:700; }
    tr.case-fail  td.status { color:var(--red);   font-weight:700; }
    tr.case-error td.status { color:var(--amber); font-weight:700; }
    tr.case-fail, tr.case-error { background:rgba(255,107,107,.05); }

    pre, .failures {
      background:var(--bg-raised); border:1px solid var(--border); border-radius:6px;
      padding:.7rem .9rem; overflow-x:auto; white-space:pre-wrap; word-break:break-word;
      font-size:.8rem; color:var(--text-dim); margin:0;
    }
    .failures pre { margin-bottom:.75rem; }
  </style>
</head>
<body>
  <h1>Algorhythms Test Report</h1>
  <p class="meta">Generated: $timestamp &nbsp;|&nbsp; Test directory: <code>$TestDir</code></p>
  <div class="$overallClass">$overallLabel</div>

  <div class="summary">
    <div class="stat"><div class="n">$total</div><div class="l">Total</div></div>
    <div class="stat"><div class="n" style="color:var(--green)">$totalPass</div><div class="l">Passed</div></div>
    <div class="stat"><div class="n" style="color:var(--red)">$totalFail</div><div class="l">Failed</div></div>
    <div class="stat"><div class="n" style="color:var(--amber)">$totalError</div><div class="l">Errors</div></div>
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
</body>
</html>
"@

$html | Out-File -FilePath $OutputFile -Encoding UTF8
Write-Host "Report written to: $OutputFile" -ForegroundColor Green
Start-Process $OutputFile
