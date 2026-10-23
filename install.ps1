param(
    [string]$TargetProject = ""
)

$ErrorActionPreference = "Stop"
$SourceSkillDir = Join-Path $PSScriptRoot ".agents\skills\beznops"

if (-not (Test-Path "$SourceSkillDir\SKILL.md")) {
    Write-Error "Source beznops not found at $SourceSkillDir"
    exit 1
}

if ([string]::IsNullOrWhiteSpace($TargetProject)) {
    # Install globally for Antigravity (~/.gemini/config/skills/beznops)
    $GlobalSkillsDir = Join-Path $HOME ".gemini\config\skills\beznops"
    New-Item -ItemType Directory -Force -Path $GlobalSkillsDir | Out-Null
    Copy-Item -Path "$SourceSkillDir\*" -Destination $GlobalSkillsDir -Recurse -Force
    Write-Host "[OK] Installed beznops globally to: $GlobalSkillsDir" -ForegroundColor Green
    Write-Host "     Start a new Antigravity session to load beznops across all workspaces."
} else {
    # Install into a specific project workspace (.agents/skills/beznops)
    $ResolvedProject = Resolve-Path $TargetProject
    $WorkspaceSkillDir = Join-Path $ResolvedProject ".agents\skills\beznops"
    New-Item -ItemType Directory -Force -Path $WorkspaceSkillDir | Out-Null
    Copy-Item -Path "$SourceSkillDir\*" -Destination $WorkspaceSkillDir -Recurse -Force
    Write-Host "[OK] Installed beznops into workspace: $WorkspaceSkillDir" -ForegroundColor Green
}

