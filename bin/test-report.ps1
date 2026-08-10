#!/usr/bin/env pwsh
# Runs raco test -v and generates a self-contained HTML report.
# Usage:  .\bin\test-report.ps1 [-TestDir tests/] [-OutputFile test-report.html]

param(
    [string]$TestDir    = "tests/",
    [string]$OutputFile = "test-report.html"
)

Write-Host "Running: raco test $TestDir ..." -ForegroundColor Cyan
# Force every output object (including stderr ErrorRecords) to plain strings
$rawOutput = (& raco test $TestDir 2>&1) | ForEach-Object { $_.ToString() }
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# ── Parse output ───────────────────────────────────────────────────────────────
$suites      = [System.Collections.Generic.List[hashtable]]::new()
$currentFile = "(unknown)"
$lastFileSeen = "(unknown)"
$fileHasSummary = $false
$failures    = [System.Collections.Generic.List[string]]::new()
$totalPass   = 0; $totalFail = 0; $totalError = 0

function Flush-File {
    # If a file produced no standard summary line, add it as pass with unknown count
    if (-not $fileHasSummary -and $lastFileSeen -ne "(unknown)") {
        $script:suites.Add(@{ File = $lastFileSeen; Pass = "?"; Fail = 0; Error = 0 })
    }
}

foreach ($line in $rawOutput) {
    $text = "$line"
    if ($text -match 'raco test: \(file "(.+?)"\)') {
        Flush-File
        # Normalise: replace backslashes, strip leading ./, collapse double slashes
        $currentFile   = ($Matches[1].Replace('\','/') -replace '^\./', '') -replace '//', '/'
        $lastFileSeen  = $currentFile
        $fileHasSummary = $false
    }
    elseif ($text -match '(\d+) success.es. (\d+) failure.s. (\d+) error.s.') {
        $p = [int]$Matches[1]; $f = [int]$Matches[2]; $e = [int]$Matches[3]
        $suites.Add(@{ File = $currentFile; Pass = $p; Fail = $f; Error = $e })
        $totalPass += $p; $totalFail += $f; $totalError += $e
        $fileHasSummary = $true
    }
    elseif ($text -match 'FAILURE|----' -and $text.Trim() -ne '') {
        $safe = $text -replace '&','&amp;' -replace '<','&lt;' -replace '>','&gt;'
        $failures.Add($safe)
    }
}
Flush-File

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

$failureSection = if ($failures.Count -gt 0) {
    "<h2>Failure Details</h2><pre class='failures'>$($failures -join "`n")</pre>"
} else { "" }

$html = @"
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Algorhythms Test Report</title>
  <style>
    *, *::before, *::after { box-sizing: border-box; }
    body   { font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
             margin: 2rem auto; max-width: 900px; color: #212529; padding: 0 1rem; }
    h1     { margin-bottom: .2rem; }
    .meta  { color: #6c757d; font-size: .88rem; margin-bottom: 1.5rem; }
    .badge-pass { display:inline-block; padding:.45rem 1.25rem; border-radius:4px;
                  font-weight:700; font-size:1.05rem; background:#d1e7dd; color:#0a3622; margin-bottom:1.5rem; }
    .badge-fail { display:inline-block; padding:.45rem 1.25rem; border-radius:4px;
                  font-weight:700; font-size:1.05rem; background:#f8d7da; color:#58151c; margin-bottom:1.5rem; }
    .summary { display:flex; gap:1.2rem; margin-bottom:1.75rem; flex-wrap:wrap; }
    .stat    { background:#f8f9fa; border:1px solid #dee2e6; border-radius:6px;
               padding:.75rem 1.5rem; text-align:center; min-width:90px; }
    .stat .n { font-size:2rem; font-weight:700; line-height:1; }
    .stat .l { font-size:.72rem; color:#6c757d; text-transform:uppercase; margin-top:.2rem; }
    table    { border-collapse:collapse; width:100%; font-size:.88rem; }
    th       { background:#343a40; color:#fff; padding:.55rem .8rem; text-align:left; white-space:nowrap; }
    td       { padding:.45rem .8rem; border-bottom:1px solid #e9ecef; }
    .num     { text-align:right; font-variant-numeric:tabular-nums; }
    .row-pass td:first-child { color:#198754; font-size:1.1rem; }
    .row-fail                { background:#fff5f5; }
    .row-fail td:first-child { color:#dc3545; font-size:1.1rem; }
    .failures { background:#f8f9fa; border:1px solid #dee2e6; border-radius:4px;
                padding:1rem; overflow-x:auto; white-space:pre-wrap; font-size:.82rem; }
    h2 { margin-top:2rem; }
  </style>
</head>
<body>
  <h1>Algorhythms Test Report</h1>
  <p class="meta">Generated: $timestamp &nbsp;|&nbsp; Test directory: <code>$TestDir</code></p>
  <div class="$overallClass">$overallLabel</div>

  <div class="summary">
    <div class="stat"><div class="n">$total</div><div class="l">Total</div></div>
    <div class="stat"><div class="n" style="color:#198754">$totalPass</div><div class="l">Passed</div></div>
    <div class="stat"><div class="n" style="color:#dc3545">$totalFail</div><div class="l">Failed</div></div>
    <div class="stat"><div class="n" style="color:#e07b00">$totalError</div><div class="l">Errors</div></div>
  </div>

  <h2>Test Files ($($suites.Count))</h2>
  <table>
    <thead><tr><th></th><th>File</th><th class="num">Pass</th><th class="num">Fail</th><th class="num">Error</th></tr></thead>
    <tbody>
$rows
    </tbody>
  </table>
  $failureSection
</body>
</html>
"@

$html | Out-File -FilePath $OutputFile -Encoding UTF8
Write-Host "Report written to: $OutputFile" -ForegroundColor Green
Start-Process $OutputFile
