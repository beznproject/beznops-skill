---
name: beznops-design
description: >-
  Focused UI/UX Art Direction & Interface Craft engine for Antigravity (part of beznops).
  Combines Hallmark v2.0 (56 archetypes & 21 macrostructures), taste-skill v2 (247 site study),
  interface-design (craft-first UI & design-deslop), and shadcn/ui component architecture.
argument-hint: "[theme|deslop|review|app|canvas] <prompt or path>"
---

# `beznops-design` — Art Direction, UI Craft & De-slop Engine

Specialized focus mode for visual art direction, theme selection, product UI interfaces, component systems, and eliminating AI slop.

## Capabilities & Workflows

### 1. Hallmark Thematic Archetypes (56 Curated Themes)
Invoke or explore specific themes:
- **Neo-Brutalist**: Raw borders, high contrast, bold geometric shapes.
- **Editorial Monochrome**: Rich serif headlines, stark black & white contrast, high-density journalism.
- **Cyberpunk Terminal / Dark Industrial**: Monospace data grids, neon accents, dark canvas.
- **Swiss Minimal**: Asymmetrical grid balance, sans-serif dominance, deep negative space tension.
- **Luxury Serif**: Elegant typography, muted warm tones, spacious layouts.

### 2. Product UI & Dashboard Craft (`interface-design`)
- **`design-deslop`**: Cleanse interfaces of generic AI tells (remove generic purple gradients, flat cards with heavy blurred dropshadows, centered empty hero copy).
- **`design-review`**: Multi-pass audit for hierarchy, micro-interactions, responsive states, and affordances.
- **Component Primitives**: Integration with `shadcn/ui` (Radix UI / Tailwind CSS) with clean `components.json` configurations.

### 3. Visual Hard Floor & Delivery Gate
- **No AI tells**: No generic floating cards, fake testimonials, or stock avatar walls.
- **No `transition: all`**: Animate only `transform` and `opacity`.
- **Focus visible**: Instant, accessible `:focus-visible` ring on every clickable element.
- **Reduced Motion**: Complete `prefers-reduced-motion` compliance.

---

## Detailed References
- Hallmark Skill & Themes: `../beznops/modules/hallmark/SKILL.md` & `../beznops/modules/hallmark/THEMES.md`
- Interface Design: `../beznops/modules/interface-design/SKILL.md`
- Taste Skill Manuals: `../beznops/references/app-screens.md`, `../beznops/references/layout.md`, `../beznops/references/colour.md`
- Shadcn Primitives: `../beznops/modules/shadcn/SKILL.md`
