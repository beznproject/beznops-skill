param(
    [string]$TargetProject = ""
)

$ErrorActionPreference = "Stop"
$SourceSkillsBase = Join-Path $PSScriptRoot ".agents\skills"

$SkillFolders = @(
    "beznops",
    "beznops-typography",
    "beznops-web",
    "beznops-design",
    "beznops-clean",
    "beznops-audit"
)

if (-not (Test-Path "$SourceSkillsBase\beznops\SKILL.md")) {
    Write-Error "Source beznops not found at $SourceSkillsBase\beznops"
    exit 1
}

if ([string]::IsNullOrWhiteSpace($TargetProject)) {
    # Install globally for Antigravity (~/.gemini/config/skills/)
    $GlobalBase = Join-Path $HOME ".gemini\config\skills"
    New-Item -ItemType Directory -Force -Path $GlobalBase | Out-Null

    foreach ($skill in $SkillFolders) {
        $src = Join-Path $SourceSkillsBase $skill
        $dst = Join-Path $GlobalBase $skill
        if (Test-Path $src) {
            New-Item -ItemType Directory -Force -Path $dst | Out-Null
            Copy-Item -Path "$src\*" -Destination $dst -Recurse -Force
            Write-Host "[OK] Installed $skill globally to: $dst" -ForegroundColor Green
        }
    }
    Write-Host "`nAll beznops skills installed successfully!" -ForegroundColor Cyan
    Write-Host "Start a new Antigravity session to load beznops and focused skills across all workspaces."
} else {
    # Install into a specific project workspace (.agents/skills/)
    $ResolvedProject = Resolve-Path $TargetProject
    $WorkspaceSkillsBase = Join-Path $ResolvedProject ".agents\skills"
    New-Item -ItemType Directory -Force -Path $WorkspaceSkillsBase | Out-Null

    foreach ($skill in $SkillFolders) {
        $src = Join-Path $SourceSkillsBase $skill
        $dst = Join-Path $WorkspaceSkillsBase $skill
        if (Test-Path $src) {
            New-Item -ItemType Directory -Force -Path $dst | Out-Null
            Copy-Item -Path "$src\*" -Destination $dst -Recurse -Force
            Write-Host "[OK] Installed $skill into workspace: $dst" -ForegroundColor Green
        }
    }
}
