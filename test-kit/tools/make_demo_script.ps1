# Extract the demo script from the master scenario: keep the introduction,
# the phase headings that still have content, the steps tagged [demo] and the
# final recap. Called by build.bat; needs nothing beyond Windows PowerShell.
#
# Keep this file ASCII-only: Windows PowerShell 5.1 reads a .ps1 without BOM
# as ANSI. Non-ASCII text lives in demo-script-header.md (UTF-8).
param(
    [Parameter(Mandatory = $true)][string]$Source,
    [Parameter(Mandatory = $true)][string]$Target,
    [Parameter(Mandatory = $true)][string]$Version
)

$ErrorActionPreference = "Stop"

$headerPath = Join-Path $PSScriptRoot "demo-script-header.md"
$lines = Get-Content -Path $Source -Encoding UTF8
$out = New-Object System.Collections.Generic.List[string]
foreach ($h in (Get-Content -Path $headerPath -Encoding UTF8)) {
    $out.Add($h.Replace("{version}", $Version))
}
$out.Add("")

$keep = $true
$inStep = $false
$pendingHeading = $null
$demoSteps = 0

foreach ($line in $lines) {
    if ($line -match '^# ') { continue }
    if ($line -match '^### ') {
        $inStep = $true
        $keep = $line -match '\[demo\]'
        if ($keep) { $demoSteps++ }
    }
    elseif ($line -match '^## ') {
        # Emit the section heading only if the section still has content.
        $inStep = $false
        $pendingHeading = $line
        $keep = $false
        continue
    }
    if (-not $keep -and -not $inStep -and $null -ne $pendingHeading -and $line.Trim() -ne '') {
        # Section text that is not a step (introduction, recap): keep the section.
        $keep = $true
    }
    if ($keep) {
        if ($null -ne $pendingHeading) {
            $out.Add($pendingHeading)
            $out.Add("")
            $pendingHeading = $null
        }
        $out.Add($line)
    }
}

if ($demoSteps -eq 0) {
    Write-Error "No step tagged [demo] found in $Source"
    exit 1
}

$utf8NoBom = New-Object System.Text.UTF8Encoding $false
[System.IO.File]::WriteAllLines($Target, $out, $utf8NoBom)
Write-Output "Demo script: $demoSteps step(s) kept."
