# Extract the light demo script from the master scenario. For each step tagged
# [demo] and not [todo #N] (not delivered yet), keep only what the presenter needs: duration, conversation, files,
# actions, prompts and talking points (Mots-cles, renamed "A montrer"). Drop
# the expected results, test plan references, the scenario introduction and
# the test instructions; keep only the table of the final recap, without its
# [todo] rows. Called by
# build.bat; needs nothing beyond Windows PowerShell.
#
# Keep this file ASCII-only: Windows PowerShell 5.1 reads a .ps1 without BOM
# as ANSI. Non-ASCII text lives in demo-script-header.md (UTF-8) or is built
# from character codes.
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

# "A montrer" with an A grave accent.
$showLabel = "- **$([char]0x00C0) montrer** :"

# Section kinds: "skip" (introduction, test instructions), "phase", "recap".
$section = "skip"
$keep = $false
$inStep = $false
$skipField = $false
$pendingHeading = $null
$demoSteps = 0

foreach ($line in $lines) {
    if ($line -match '^# ') { continue }
    if ($line -match '^## ') {
        $inStep = $false
        $keep = $false
        $skipField = $false
        if ($line -match '^## Phase ') { $section = "phase" }
        elseif ($line -match '^## R.capitulatif') { $section = "recap" }
        else { $section = "skip" }
        $pendingHeading = if ($section -eq "skip") { $null } else { $line }
        continue
    }
    if ($section -eq "skip") { continue }

    if ($line -match '^### ') {
        $inStep = $true
        $skipField = $false
        $keep = ($section -eq "phase") -and ($line -match '\[demo\]') -and ($line -notmatch '\[todo')
        if ($keep) {
            $demoSteps++
            $line = $line.Replace(" [demo]", "")
        }
    }
    elseif ($inStep -and $keep) {
        if ($line -match '^- \*\*(Attendu|Plan de test)') {
            # Drop the field and its indented continuation lines.
            $skipField = $true
            continue
        }
        if ($skipField) {
            if ($line -match '^\s+\S') { continue }
            $skipField = $false
        }
        if ($line -match '^- \*\*Mots-cl\S* :') {
            $line = $line -replace '^- \*\*Mots-cl\S* :', $showLabel
        }
    }
    elseif ($section -eq "recap") {
        # Keep only the recap table, not the commentary around it.
        $keep = ($line -match '^\|') -and ($line -notmatch '\[todo')
    }
    elseif (-not $inStep) {
        $keep = $false
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
