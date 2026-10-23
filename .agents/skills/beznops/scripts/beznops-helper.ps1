<#
.SYNOPSIS
Zero-dependency PowerShell fallback helper for beznops on Windows when Node.js or Python is not in PATH.
Supports:
  1. contrast <hex1> <hex2>
  2. list <sectors|directions|roles|tones>
  3. draw -Sector <sector> [-Tone <tone>] [-Direction <id>]
  4. lint <path>
#>
param(
    [Parameter(Position = 0, Mandatory = $true)]
    [ValidateSet("contrast", "list", "draw", "lint")]
    [string]$Command,

    [Parameter(Position = 1)]
    [string]$Arg1 = "",

    [Parameter(Position = 2)]
    [string]$Arg2 = "",

    [string]$Sector = "saas",
    [string]$Tone = "",
    [string]$Direction = ""
)

$ErrorActionPreference = "Stop"
$ScriptDir = $PSScriptRoot
$LibDir = Join-Path (Split-Path $ScriptDir -Parent) "library"

function ConvertFrom-HexChannel([string]$hexPair) {
    $val = [Convert]::ToInt32($hexPair, 16) / 255.0
    if ($val -le 0.03928) {
        return $val / 12.92
    }
    return [Math]::Pow((($val + 0.055) / 1.055), 2.4)
}

function Get-RelativeLuminance([string]$hex) {
    $clean = $hex.TrimStart('#')
    if ($clean.Length -eq 3) {
        $clean = "$($clean[0])$($clean[0])$($clean[1])$($clean[1])$($clean[2])$($clean[2])"
    }
    if ($clean.Length -ne 6) {
        throw "Invalid hex color: $hex"
    }
    $r = ConvertFrom-HexChannel $clean.Substring(0, 2)
    $g = ConvertFrom-HexChannel $clean.Substring(2, 2)
    $b = ConvertFrom-HexChannel $clean.Substring(4, 2)
    return (0.2126 * $r) + (0.7152 * $g) + (0.0722 * $b)
}

switch ($Command) {
    "contrast" {
        if (-not $Arg1 -or -not $Arg2) {
            Write-Error "Usage: beznops-helper.ps1 contrast '#FFFFFF' '#777777'"
            exit 1
        }
        $l1 = Get-RelativeLuminance $Arg1
        $l2 = Get-RelativeLuminance $Arg2
        $lighter = [Math]::Max($l1, $l2)
        $darker = [Math]::Min($l1, $l2)
        $ratio = ($lighter + 0.05) / ($darker + 0.05)
        $ratioFormatted = "{0:N2}" -f $ratio
        $normalPass = if ($ratio -ge 4.5) { "PASS ($ratioFormatted >= 4.5)" } else { "FAIL ($ratioFormatted < 4.5)" }
        $largePass  = if ($ratio -ge 3.0) { "PASS ($ratioFormatted >= 3.0)" } else { "FAIL ($ratioFormatted < 3.0)" }
        Write-Output "Contrast ($Arg1 vs $Arg2): ${ratioFormatted}:1"
        Write-Output "normal text: $normalPass"
        Write-Output "large text:  $largePass"
    }

    "list" {
        $what = if ($Arg1) { $Arg1 } else { "sectors" }
        switch ($what) {
            "sectors" {
                Write-Output "saas, dev-tool, ai-product, consumer-app, finance, agency, studio-portfolio, personal-portfolio, ecommerce, physical-product, fashion, hospitality, restaurant, real-estate, architecture, event, health, education, nonprofit, culture, music, other"
            }
            "tones" {
                Write-Output "quiet, bold, warm, technical, playful, luxury, editorial"
            }
            "directions" {
                $dirs = Get-Content (Join-Path $LibDir "directions.json") -Encoding UTF8 -Raw | ConvertFrom-Json
                foreach ($d in $dirs) {
                    Write-Output "$($d.id): $($d.name) - $($d.idea)"
                }
            }
            "roles" {
                Write-Output "hero, features, showcase, how-it-works, testimonial, proof, stats, pricing, faq, cta, footer, intro, about, work, gallery, list, contact"
            }
        }
    }

    "draw" {
        $dirs = Get-Content (Join-Path $LibDir "directions.json") -Encoding UTF8 -Raw | ConvertFrom-Json
        $palettes = Get-Content (Join-Path $LibDir "palettes.json") -Encoding UTF8 -Raw | ConvertFrom-Json
        $types = Get-Content (Join-Path $LibDir "type.json") -Encoding UTF8 -Raw | ConvertFrom-Json
        $heroes = Get-Content (Join-Path $LibDir "heroes.json") -Encoding UTF8 -Raw | ConvertFrom-Json

        if ($Direction) {
            $chosen = $dirs | Where-Object { $_.id -eq $Direction } | Select-Object -First 1
            if (-not $chosen) { $chosen = $dirs | Get-Random -Count 1 }
            $pal = $palettes | Get-Random -Count 1
            $typ = $types | Get-Random -Count 1
            $hero = $heroes | Get-Random -Count 1
            [PSCustomObject]@{
                direction = $chosen
                palette   = $pal
                type      = $typ
                hero      = $hero
            } | ConvertTo-Json -Depth 6
        } else {
            $filtered = $dirs | Where-Object { $_.sectors -contains $Sector }
            if (-not $filtered) { $filtered = $dirs }
            $options = $filtered | Get-Random -Count 3
            Write-Output "=== 3 Dealt Art Directions for '$Sector' (Pick 1 and re-run with -Direction <id>) ==="
            foreach ($o in $options) {
                Write-Output "- [$($o.id)] $($o.name): $($o.idea)"
            }
        }
    }

    "lint" {
        $target = if ($Arg1) { Resolve-Path $Arg1 } else { Get-Location }
        $files = Get-ChildItem -Path $target -Recurse -File -Include *.html,*.tsx,*.jsx,*.vue,*.svelte,*.astro,*.css,*.md -ErrorAction SilentlyContinue
        $issues = 0
        foreach ($f in $files) {
            $content = Get-Content $f.FullName -Encoding UTF8 -Raw -ErrorAction SilentlyContinue
            if (-not $content) { continue }
            if ($content -match "\u2014") {
                Write-Output "[FAIL R-02] Em dash found in $($f.FullName)"
                $issues++
            }
            if ($content -match "(?i)\b(AI Powered|Revolutionary|Next Generation|Cutting Edge|Unlock the power|Seamless)\b") {
                Write-Output "[WARN R-16] AI marketing buzzword found in $($f.FullName)"
                $issues++
            }
            if ($content -match "backdrop-filter:\s*blur") {
                Write-Output "[WARN House-Rule/R-10] backdrop-filter blur (glassmorphism) found in $($f.FullName)"
                $issues++
            }
        }
        if ($issues -eq 0) {
            Write-Output "LINT PASS: 0 anti-slop issues detected."
        } else {
            Write-Output "LINT COMPLETED: $issues issue(s) flagged."
        }
    }
}

