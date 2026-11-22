---
name: beznops-typography
description: >-
  Focused typography and micro-copy engine for Antigravity (part of beznops).
  Enforces editorial-grade typography: unitless line-height, measure (60-75ch),
  max 2-line headlines, font pairing, OpenType tabular-nums, zero em-dashes (—),
  anti-buzzword human copywriting, and WCAG AA contrast.
argument-hint: "[audit|format|scale|pair] <path or text>"
---

# `beznops-typography` — Precision Typography & Micro-Copy Engine

Specialized focus mode for text rendering, baseline rhythm, type scales, font pairing, and human copywriting.

## Core Rules & Calculations

### 1. Measure & Scale
- **Measure (Line Length)**: Maximum 60–75 characters per line (`max-width: 65ch` / `70ch`). Never let body prose stretch across full-width monitors.
- **Headlines**: Maximum 2 lines at any desktop resolution. If it wraps to 3 lines, tighten the wording or adjust the fluid clamp scale.
- **Fluid Type**: Use `clamp()` for fluid responsive type scaling without breakpoint jumps.
- **Minimum Body Size**: Minimum `16px` for body text to avoid iOS Safari auto-zoom on inputs and ensure comfortable reading.
- **Weight Restraint**: Below `18px`, always use `font-weight: 400` or heavier. Light weights (`100`–`300`) are reserved for `28px` and above.

### 2. Font Features & OpenType
- **Tabular Numbers**: Use `font-variant-numeric: tabular-nums` for timers, prices, counters, tables, and changing metric values so layout doesn't shift.
- **No Faux Styles**: Load genuine font files for italic and bold weights. Never rely on browser synthesis.
- **Hyphenation & Wrap**: Apply `text-wrap: balance` on headlines and `text-wrap: pretty` on paragraphs to prevent orphans.

### 3. Copywriting & Anti-Slop Language
- **Zero Em-Dash (`—`)**: Never use the em-dash. Use commas, parentheses, colons, or clean separate sentences.
- **No Buzzwords**: Eliminate words like *"empower"*, *"revolutionize"*, *"seamless"*, *"unleash"*, *"delve"*, *"game-changing"*. Write straightforward human prose.
- **Error Messages**: Always explain what happened and provide an immediate actionable next step.

---

## Detailed References
- Deep Typography Manual: `../beznops/references/type.md`
- Copywriting & Headline Arithmetic: `../beznops/references/copy.md` & `../beznops/references/antislop-copywriting.md`
- Better Typography Module: `../beznops/modules/better-typography/SKILL.md`
- Better Writing Module: `../beznops/modules/better-writing/SKILL.md`
