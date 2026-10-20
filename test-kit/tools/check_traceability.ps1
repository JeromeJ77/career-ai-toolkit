# Check the traceability between the requirements, the tests that cite them
# and the test dashboard (issue #20, REQ-QA-10). Reads docs/requirements/*.md
# (except README.md), docs/checks.md, test-kit/scenario.md and
# docs/test-log.md, ignoring fenced code blocks. Errors make the script exit
# with code 1; warnings alone leave it at 0. Development tool: never called by
# build.bat, needs nothing beyond Windows PowerShell 5.1.
#
# From the repository root:
#   powershell -NoProfile -ExecutionPolicy Bypass -File test-kit\tools\check_traceability.ps1
# -Root checks another copy of the repository (default: the repository that
# holds this script).
#
# Keep this file ASCII-only: Windows PowerShell 5.1 reads a .ps1 without BOM
# as ANSI. Accented letters and emojis are built from character codes.
param(
    [string]$Root
)

$ErrorActionPreference = "Stop"

if (-not $Root) { $Root = Split-Path -Parent (Split-Path -Parent $PSScriptRoot) }
$Root = (Resolve-Path -LiteralPath $Root).Path.TrimEnd('\', '/')

$eAcute = [string][char]0x00E9
$variation = [string][char]0xFE0F

# Requirement statuses (docs/requirements/README.md).
$statusProposed = [char]::ConvertFromUtf32(0x1F535) + " Propos" + $eAcute + "e"
$statusActive = [string][char]0x2705 + " Active"
$replacedPattern = '^' + [regex]::Escape([string][char]0x26AA + " Remplac" + $eAcute + "e par ") +
    '(\S+)(?:\s+\(#[0-9]+\))?$'
$abandonedPattern = '^' + [regex]::Escape([string][char]0x274C + " Abandonn" + $eAcute + "e") +
    '(?:\s+\(.+\))?$'

# Test statuses of the dashboard, with their label (needed by the test-coverage mod).
$dashboardStatuses = @(
    ([string][char]0x2705 + " Valid" + $eAcute),
    ([string][char]0x26A0 + " " + [string][char]0x00C0 + " revalider"),
    ([char]::ConvertFromUtf32(0x1F41E) + " Probl" + [string][char]0x00E8 + "me constat" + $eAcute),
    ([string][char]0x2B1C + " Non test" + $eAcute)
)

$reqIdPattern = '^REQ-[A-Z]{2,5}-[0-9]{2,}$'
$chkIdPattern = '^CHK-[A-Z]{2,5}-[0-9]{2,}$'
# Loose on purpose, so that a malformed identifier is reported instead of ignored.
$reqTokenPattern = 'REQ-[A-Za-z0-9-]*[A-Za-z0-9]'

$errors = New-Object System.Collections.Generic.List[string]
$warnings = New-Object System.Collections.Generic.List[string]
# Case-sensitive dictionaries: "c4" is not the step C4.
$requirements = New-Object 'System.Collections.Generic.Dictionary[string,object]'
$tests = New-Object 'System.Collections.Generic.Dictionary[string,object]'
$dashboard = New-Object 'System.Collections.Generic.Dictionary[string,object]'
$citations = New-Object System.Collections.Generic.List[object]

function Get-RelativePath([string]$Path) {
    return $Path.Substring($Root.Length).TrimStart('\', '/').Replace('\', '/')
}

function Add-Error([string]$File, [int]$Line, [string]$Id, [string]$Message) {
    $errors.Add(("ERROR    {0}:{1}  {2}  {3}" -f $File, $Line, $Id, $Message))
}

function Add-Warning([string]$File, [int]$Line, [string]$Id, [string]$Message) {
    $warnings.Add(("WARNING  {0}:{1}  {2}  {3}" -f $File, $Line, $Id, $Message))
}

# Lines of a Markdown file in NFC, with fenced code blocks blanked so that
# line numbers stay right and examples are not read as content.
function Get-MarkdownLines([string]$Path) {
    $raw = @(Get-Content -LiteralPath $Path -Encoding UTF8)
    $lines = New-Object string[] $raw.Count
    $fence = $false
    for ($i = 0; $i -lt $raw.Count; $i++) {
        $line = ([string]$raw[$i]).Normalize([Text.NormalizationForm]::FormC)
        if ($line -match '^\s*(```|~~~)') {
            $fence = -not $fence
            $lines[$i] = ''
        }
        elseif ($fence) { $lines[$i] = '' }
        else { $lines[$i] = $line }
    }
    return , $lines
}

function Test-File([string]$Path) {
    if (Test-Path -LiteralPath $Path -PathType Leaf) { return $true }
    Add-Error (Get-RelativePath $Path) 0 "-" "file not found"
    return $false
}

# Requirements: "### REQ-..." headings and their "- **Statut** :" field.
function Close-Requirement($Requirement) {
    if ($null -eq $Requirement) { return }
    if ($null -eq $Requirement.StatusLine) {
        Add-Error $Requirement.File $Requirement.Line $Requirement.Id "missing status"
    }
}

function Read-Requirements([string]$Directory) {
    if (-not (Test-Path -LiteralPath $Directory -PathType Container)) {
        Add-Error (Get-RelativePath $Directory) 0 "-" "directory not found"
        return
    }
    $files = Get-ChildItem -LiteralPath $Directory -Filter "*.md" |
        Where-Object { $_.Name -ne "README.md" } | Sort-Object Name
    foreach ($file in $files) {
        $rel = Get-RelativePath $file.FullName
        $lines = Get-MarkdownLines $file.FullName
        $current = $null
        for ($i = 0; $i -lt $lines.Count; $i++) {
            $text = $lines[$i]
            $n = $i + 1
            if ($text -match '^#{1,6}\s') {
                Close-Requirement $current
                $current = $null
                if ($text -cmatch "^###\s+($reqTokenPattern)") {
                    $id = $Matches[1]
                    if ($id -cnotmatch $reqIdPattern) {
                        Add-Error $rel $n $id "malformed requirement id"
                    }
                    elseif ($requirements.ContainsKey($id)) {
                        $first = $requirements[$id]
                        Add-Error $rel $n $id ("duplicate requirement id (first at {0}:{1})" -f $first.File, $first.Line)
                    }
                    else {
                        $current = [pscustomobject]@{
                            Id = $id; File = $rel; Line = $n
                            Status = $null; StatusLine = $null; ReplacedBy = $null
                        }
                        $requirements[$id] = $current
                    }
                }
                continue
            }
            if ($null -eq $current) { continue }
            if ($text -match '^\s*-\s+\*\*Statut\*\*\s*:\s*(.*?)\s*$') {
                if ($null -ne $current.StatusLine) {
                    Add-Error $rel $n $current.Id ("second status field (first at line {0})" -f $current.StatusLine)
                    continue
                }
                $current.StatusLine = $n
                $value = $Matches[1].Replace($variation, '')
                if ($value -ceq $statusProposed) { $current.Status = "proposed" }
                elseif ($value -ceq $statusActive) { $current.Status = "active" }
                elseif ($value -cmatch $replacedPattern) {
                    $current.Status = "replaced"
                    $current.ReplacedBy = $Matches[1]
                }
                elseif ($value -cmatch $abandonedPattern) { $current.Status = "abandoned" }
                else { Add-Error $rel $n $current.Id ("unknown status '{0}'" -f $value) }
            }
        }
        Close-Requirement $current
    }
}

function Add-Citations([string]$Text, [string]$File, [int]$Line, [string]$TestId) {
    foreach ($match in [regex]::Matches($Text, $reqTokenPattern)) {
        $id = $match.Value
        if ($id -cnotmatch $reqIdPattern) {
            Add-Error $File $Line $id "malformed requirement id"
            continue
        }
        $citations.Add([pscustomobject]@{ Id = $id; File = $File; Line = $Line; TestId = $TestId })
    }
}

# Tests: scenario steps ("### C4 - ...") or checks ("### CHK-QA-01 - ..."),
# each with an "- **Exigences** :" line and its indented continuation lines.
function Read-Tests([string]$Path, [string]$HeadingPattern, [string]$IdPattern, [string]$Kind) {
    if (-not (Test-File $Path)) { return 0 }
    $rel = Get-RelativePath $Path
    $lines = Get-MarkdownLines $Path
    $current = $null
    $inField = $false
    $count = 0
    for ($i = 0; $i -lt $lines.Count; $i++) {
        $text = $lines[$i]
        $n = $i + 1
        if ($text -match '^#{1,6}\s') {
            $current = $null
            $inField = $false
            if ($text -cmatch $HeadingPattern) {
                $id = $Matches[1]
                # Its citations are still checked, under the id as written.
                $current = $id
                if ($id -cnotmatch $IdPattern) {
                    Add-Error $rel $n $id "malformed $Kind id"
                }
                elseif ($tests.ContainsKey($id)) {
                    $first = $tests[$id]
                    Add-Error $rel $n $id ("duplicate $Kind id (first at {0}:{1})" -f $first.File, $first.Line)
                }
                else {
                    $tests[$id] = [pscustomobject]@{ Id = $id; File = $rel; Line = $n; Kind = $Kind }
                    $count++
                }
            }
            continue
        }
        if ($text -match '^\s*-\s+\*\*Exigences\*\*\s*:(.*)$') {
            if ($null -eq $current) {
                Add-Error $rel $n "-" "Exigences line outside a $Kind"
                $inField = $false
                continue
            }
            $inField = $true
            Add-Citations $Matches[1] $rel $n $current
        }
        elseif ($inField -and ($text -match '^\s+\S') -and ($text -notmatch '^\s*-\s+\*\*')) {
            Add-Citations $text $rel $n $current
        }
        else { $inField = $false }
    }
    return $count
}

function Split-Row([string]$Text) {
    $body = $Text.Trim()
    if ($body.StartsWith('|')) { $body = $body.Substring(1) }
    if ($body.EndsWith('|') -and -not $body.EndsWith('\|')) { $body = $body.Substring(0, $body.Length - 1) }
    return , ([regex]::Split($body, '(?<!\\)\|') | ForEach-Object { $_.Trim() })
}

# Dashboard: table rows starting with "| REQ-".
function Read-Dashboard([string]$Path) {
    if (-not (Test-File $Path)) { return }
    $rel = Get-RelativePath $Path
    $lines = Get-MarkdownLines $Path
    $statusColumn = 2
    $testsColumn = 5
    for ($i = 0; $i -lt $lines.Count; $i++) {
        $text = $lines[$i]
        $n = $i + 1
        if ($text -match '^\|\s*Exigence\s*\|') {
            $header = Split-Row $text
            for ($c = 0; $c -lt $header.Count; $c++) {
                if ($header[$c] -ceq "Statut") { $statusColumn = $c }
                if ($header[$c] -ceq "Tests") { $testsColumn = $c }
            }
            continue
        }
        if ($text -notmatch '^\|\s*REQ-') { continue }
        $cells = Split-Row $text
        $id = $cells[0]
        if ($id -cnotmatch $reqIdPattern) {
            Add-Error $rel $n $id "malformed requirement id in the dashboard"
            continue
        }
        if ($dashboard.ContainsKey($id)) {
            Add-Error $rel $n $id ("second dashboard row (first at line {0})" -f $dashboard[$id].Line)
            continue
        }
        $dashboard[$id] = [pscustomobject]@{ Id = $id; File = $rel; Line = $n }

        $status = if ($statusColumn -lt $cells.Count) { $cells[$statusColumn].Replace($variation, '') } else { '' }
        if ($dashboardStatuses -cnotcontains $status) {
            Add-Error $rel $n $id ("unknown test status '{0}'" -f $status)
        }

        $testsCell = if ($testsColumn -lt $cells.Count) { $cells[$testsColumn] } else { '' }
        foreach ($token in ($testsCell -split ',')) {
            $testId = $token.Trim()
            if ($testId -eq '' -or $testId -eq '-' -or $testId -eq [string][char]0x2014) { continue }
            if ($tests.ContainsKey($testId)) { continue }
            if (($testId -cmatch '^([A-Z][0-9]+)\.[0-9]+$') -and $tests.ContainsKey($Matches[1]) -and
                ($tests[$Matches[1]].Kind -eq "step")) { continue }
            Add-Error $rel $n $id ("test not found: '{0}'" -f $testId)
        }
    }
}

function Test-Tracked([string]$Id) {
    if (-not $requirements.ContainsKey($Id)) { return $false }
    $status = $requirements[$Id].Status
    return ($status -eq "proposed") -or ($status -eq "active")
}

Read-Requirements (Join-Path $Root "docs\requirements")
$stepCount = Read-Tests (Join-Path $Root "test-kit\scenario.md") '^###\s+\*?([A-Z][0-9]+)(?=[\s*]|$)' '^[A-Z][0-9]+$' "step"
$checkCount = Read-Tests (Join-Path $Root "docs\checks.md") "^###\s+(CHK-[A-Za-z0-9-]*[A-Za-z0-9])" $chkIdPattern "check"
Read-Dashboard (Join-Path $Root "docs\test-log.md")

foreach ($req in $requirements.Values) {
    if (($req.Status -eq "replaced") -and -not $requirements.ContainsKey($req.ReplacedBy)) {
        Add-Error $req.File $req.StatusLine $req.Id ("replacing requirement not found: {0}" -f $req.ReplacedBy)
    }
}

$cited = New-Object 'System.Collections.Generic.HashSet[string]'
foreach ($citation in $citations) {
    if (-not $requirements.ContainsKey($citation.Id)) {
        Add-Error $citation.File $citation.Line $citation.Id ("requirement cited by {0} not found" -f $citation.TestId)
        continue
    }
    [void]$cited.Add($citation.Id)
    # A requirement without a valid status is already reported.
    $status = $requirements[$citation.Id].Status
    if (($status -eq "replaced") -or ($status -eq "abandoned")) {
        Add-Warning $citation.File $citation.Line $citation.Id ("{0} requirement still cited by {1}" -f $status, $citation.TestId)
    }
}

foreach ($row in $dashboard.Values) {
    if (-not $requirements.ContainsKey($row.Id)) {
        Add-Error $row.File $row.Line $row.Id "dashboard row for a requirement that does not exist"
        continue
    }
    $status = $requirements[$row.Id].Status
    if (($status -eq "replaced") -or ($status -eq "abandoned")) {
        Add-Error $row.File $row.Line $row.Id ("dashboard row for a requirement that is {0}" -f $status)
    }
}

foreach ($req in $requirements.Values) {
    if (-not (Test-Tracked $req.Id)) { continue }
    if (-not $dashboard.ContainsKey($req.Id)) {
        Add-Error $req.File $req.Line $req.Id ("{0} requirement missing from the dashboard" -f $req.Status)
    }
    if (-not $cited.Contains($req.Id)) {
        Add-Warning $req.File $req.Line $req.Id ("{0} requirement cited by no test" -f $req.Status)
    }
}

foreach ($line in $errors) { Write-Output $line }
foreach ($line in $warnings) { Write-Output $line }

$byStatus = @{ proposed = 0; active = 0; replaced = 0; abandoned = 0; invalid = 0 }
foreach ($req in $requirements.Values) {
    if ($null -eq $req.Status) { $byStatus.invalid++ } else { $byStatus[$req.Status]++ }
}
if ($errors.Count + $warnings.Count -gt 0) { Write-Output "" }
Write-Output ("Requirements: {0} (proposed {1}, active {2}, replaced {3}, abandoned {4}, invalid status {5})" -f
    $requirements.Count, $byStatus.proposed, $byStatus.active, $byStatus.replaced, $byStatus.abandoned, $byStatus.invalid)
Write-Output ("Tests: {0} scenario steps, {1} checks; dashboard rows: {2}" -f $stepCount, $checkCount, $dashboard.Count)
Write-Output ("Errors: {0}, warnings: {1}" -f $errors.Count, $warnings.Count)

if ($errors.Count -gt 0) { exit 1 }
exit 0
