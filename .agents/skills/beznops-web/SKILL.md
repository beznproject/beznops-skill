---
name: beznops-web
description: >-
  Focused Modern Web Platform & Standards engine for Antigravity (part of beznops).
  Integrates GoogleChrome/modern-web-guidance best practices. Mandated for HTML5 semantics,
  native popovers/dialogs, anchor positioning, view transitions, container queries,
  Core Web Vitals (LCP/INP/CLS), Web Security, Passkeys, and PWA capabilities.
argument-hint: "[search|retrieve|audit] <capability or UI pattern>"
---

# `beznops-web` — Modern Web Platform & Chrome Engineering Guidance

Specialized focus mode for leveraging standard, native web platform APIs before reaching for bloated third-party JavaScript libraries.

## Core Rules & Modern Web Standards

### 1. Native Primitives Over JS Hacks
- **Modals & Dialogs**: Use `<dialog>` with `showModal()` and native light-dismiss popovers (`popover="auto"`), not custom div modals with messy z-index and hand-rolled focus traps.
- **Tooltips & Dropdowns**: Use CSS Anchor Positioning (`position-anchor`, `anchor()`) where supported instead of heavy floating-ui libraries.
- **Transitions**: Use Native View Transitions API (`document.startViewTransition`) for seamless page or state animations.
- **Container Queries**: Use `@container` for responsive component-driven layouts rather than viewport-only `@media` queries.
- **Scroll-driven Animations**: Leverage CSS `@scroll-timeline` and `animation-timeline: view()` for performant GPU-accelerated scroll animations without JS scroll listeners.

### 2. Core Web Vitals (CWV) & Performance
- **Largest Contentful Paint (LCP)**:
  - Add `fetchpriority="high"` to hero images.
  - Never lazy-load the above-the-fold hero image (`loading="lazy"` on LCP destroys score).
  - Preload critical web fonts with `<link rel="preload" as="font" crossorigin>`.
- **Interaction to Next Paint (INP)**:
  - Yield main thread long tasks using `scheduler.yield()` or microtask chunking.
  - Avoid layout thrashing (batch DOM reads before writes).
- **Cumulative Layout Shift (CLS)**:
  - Always declare explicit `width` and `height` or `aspect-ratio` on all `<img>`, `<video>`, and iframe elements.
  - Reserve space for dynamic content, banners, and skeleton screens.

### 3. Forms & Accessibility
- Native HTML validation (`pattern`, `required`, `type="email"`, `inputmode="numeric"`).
- Accessible forms with `<label for="...">`, autocomplete hints (`autocomplete="one-time-code"`, `autocomplete="address-line1"`).
- Form submission through standard `FormData` and native request APIs.

---

## Direct Guide Search Workflow

When looking up modern web platform implementations:
```bash
# Search official modern web guidance
npx -y modern-web-guidance@latest search "<2-5 word pattern e.g. 'responsive table' or 'popover dialog'>"

# Retrieve full guide
npx -y modern-web-guidance@latest retrieve "<guide-id>"
```

## Detailed References
- Modern Web Guidance Module: `../beznops/modules/modern-web-guidance/SKILL.md`
- Local Guides Directory: `../beznops/modules/modern-web-guidance/guides/`
- Accessibility & Mobile: `../beznops/references/antislop-human.md` & `../beznops/references/antislop-layoutmobile.md`
