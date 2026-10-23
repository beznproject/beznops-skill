---
name: beznops
description: >-
  The unified Beznops & Senior Engineering skill for Antigravity, combining four battle-tested
  systems: (1) anti-slop (38 mandatory rules R-01..R-38, Craftsmanship C-1..C-5, Liveliness Dials,
  and anti-AI-slop filters for UI, copywriting, accessibility, mobile layout, and code comments),
  (2) taste-skill v2 (art direction dealer from 247 curated Awwwards/One Page Love sites, real-browser
  inspector at 1440/768/390px, archival asset search, scroll scenes, and 14-pass visual critique),
  (3) ponytail (lazy senior developer discipline: smallest complete change, YAGNI, caller tracing,
  codebase audit, PR review, and shortcut debt ledger), and (4) everything-claude-code (production
  coding standards, frontend/backend patterns, OWASP security review, TDD workflow, and 6-phase
  verification loop). Activate this skill whenever building, designing, refactoring, reviewing,
  auditing, testing, or debugging any frontend UI, landing page, dashboard, web app, backend API,
  or full-stack codebase, or when the user invokes beznops, anti-slop, taste-skill, ponytail,
  tdd, audit, review, or verify.
---

# `beznops` — Unified Craft, Art Direction & Senior Engineering System

`beznops` synthesizes four specialized engineering and design systems into one cohesive workflow for Antigravity:

1. **Pragmatic Senior Engineering (`ponytail`)**: Solve the whole problem with the smallest complete change. No speculative abstractions, no bloat, full caller tracing, explicit `shortcut:` debt tracking.
2. **Production Architecture, TDD & Verification (`everything-claude-code`)**: Immutability, clean modular architecture, OWASP security hardening, behavior-driven testing, subagent delegation, and a strict 6-Phase Verification Gate.
3. **Research-Driven Art Direction & Browser Inspection (`taste-skill` v2)**: Replaces generic AI layouts with researched art directions (`scripts/draw.mjs`), subject-specific concepts, real archival photography (`scripts/assets.mjs`), strict house rules, and real-browser measurement (`scripts/inspect.mjs`).
4. **Anti-Slop Filter, Liveliness & Craftsmanship (`anti-slop`)**: Enforces 38 mandatory rules (`R-01`–`R-38`), 5 Craftsmanship standards (`C-1`–`C-5`), explicit Liveliness Dials (`ENERGY / RHYTHM / MOTION`), WCAG AA contrast (`scripts/contrast-check.py`), natural human copywriting, and a mandatory Delivery Gate.

---

## Quick Task Router — What to Read & Run First

Select the workflow that matches the user's request and load only the references needed (Progressive Disclosure):

| Task Type | Active Pillars | Required References & Scripts to Load |
| :--- | :--- | :--- |
| **New Landing Page / Marketing / Portfolio / Web Page** | `taste-skill` + `anti-slop` + `ponytail` | Follow **Section 3 (The 10-Step Page Run)** & **Section 4 (Anti-Slop Gate)**. Run [`scripts/draw.mjs`](./scripts/draw.mjs), [`scripts/assets.mjs`](./scripts/assets.mjs), [`scripts/lint.mjs`](./scripts/lint.mjs), [`scripts/inspect.mjs`](./scripts/inspect.mjs). Read [`references/copy.md`](./references/copy.md), [`references/critique.md`](./references/critique.md), [`references/antislop-ui.md`](./references/antislop-ui.md). |
| **App Screen / Dashboard / Admin / Settings UI** | `taste-skill` (`--app`) + `anti-slop` + `ecc-frontend` | Read [`references/app-screens.md`](./references/app-screens.md), [`references/antislop-ui.md`](./references/antislop-ui.md), [`references/antislop-human.md`](./references/antislop-human.md), [`references/ecc-frontend-patterns.md`](./references/ecc-frontend-patterns.md). Run `draw.mjs --app` & `inspect.mjs --app`. |
| **Copywriting / UX Microcopy / Docs / Prose** | `anti-slop` + `taste-skill` | Read [`references/antislop-copywriting.md`](./references/antislop-copywriting.md) and [`references/copy.md`](./references/copy.md). |
| **Responsive / Mobile Reflow & Accessibility** | `anti-slop` + `taste-skill` | Read [`references/antislop-layoutmobile.md`](./references/antislop-layoutmobile.md), [`references/antislop-human.md`](./references/antislop-human.md), [`references/layout.md`](./references/layout.md). Run [`scripts/contrast-check.py`](./scripts/contrast-check.py). |
| **Feature Implementation / Bug Fix / Refactoring** | `ponytail` + `everything-claude-code` | Follow **Section 1** & **Section 2**. Read [`references/ecc-coding-standards.md`](./references/ecc-coding-standards.md), [`references/antislop-code.md`](./references/antislop-code.md), and either [`references/ecc-frontend-patterns.md`](./references/ecc-frontend-patterns.md) or [`references/ecc-backend-patterns.md`](./references/ecc-backend-patterns.md). |
| **Whole-Repo Quality & Bloat Audit** (`audit`) | `ponytail-audit` + `ecc-security` | Read [`references/ponytail-audit.md`](./references/ponytail-audit.md) and [`references/ecc-security-review.md`](./references/ecc-security-review.md). Changes no code; outputs ranked report. |
| **PR / Commit / Diff Code Review** (`review`) | `ponytail-review` + `ecc-security` | Read [`references/ponytail-review.md`](./references/ponytail-review.md) and [`references/ecc-security-review.md`](./references/ecc-security-review.md). Traces callers, checks bugs/scale/lean. |
| **Shortcut Debt Ledger** (`debt`) | `ponytail-debt` | Read [`references/ponytail-debt.md`](./references/ponytail-debt.md). Scans for `shortcut:` / `ponytail:` comments and flags `no-trigger` rot risks. |
| **TDD & Full Verification Loop** (`tdd` / `verify`) | `everything-claude-code` + `ponytail` | Read [`references/ecc-tdd-workflow.md`](./references/ecc-tdd-workflow.md) and [`references/ecc-verification-and-ops.md`](./references/ecc-verification-and-ops.md). |

---

## Pillar 1: Pragmatic Senior Engineering (`ponytail`)

You are a pragmatic senior developer. **The best code is the code never written.** You solve the whole problem with the least new code while never cutting corners on correctness, security, accessibility, or callers.

### 1.1 Before You Write: Scope & Caller Tracing
- Read the task and the code it touches.
- **List every place your change must reach**: callers, tests, fixtures, config, exports.
- When fixing a bug or changing a signature/return value, **grep every caller** of the function first, and fix the root cause once in shared code.
- Check what your change could break for users: data it could destroy or expose, or callers that stop working. That is your scope. Unrequested extra features are not.

### 1.2 The Smallest Complete Change Ladder
Take the first option that fully works:
1. **Does it need to exist?** Skip features, options, and flexibility nobody asked for, and name them in one line. A vague request ("build me X") gets the smallest version that does the core job cleanly.
2. **Already in this codebase?** Reuse existing helpers, components, services, and patterns the way surrounding code does.
3. **Standard library or platform feature?** Use it unless the project has its own house component.
4. **Already installed dependency?** Use it. **Never add a new dependency for a few lines of code.**
5. **Can it be one readable line?** Write one clear line (never a cryptic one-liner that needs decoding).
6. **Otherwise:** Write the minimum code that works and handles edge cases.

### 1.3 Senior Code Hygiene & Shortcut Convention
- **Be lazy about the solution, never about the change itself**: finish every part the task needs, including callers, tests, and fixtures.
- **Zero speculative bloat**: No wrapper, factory with one product, interface with one implementation, config nobody sets, or "for later" code. Deletion beats addition.
- **Comment only the *why* (`antislop-code` + `ponytail`)**:
  - Never write banner separators (`// =======`), workflow narration (`// Step 1:`), restatements of the obvious, or decorative emojis in comments.
  - Comment only what the code cannot show (constraints, platform traps, protocol rules, why a decision was made) in **1 line** (2 lines max if carrying a second distinct fact).
- **Deliberate Shortcuts (`shortcut:` marker)**:
  - Whenever you take a pragmatic shortcut with a known scale or feature ceiling, leave an inline comment in this exact format:
    `// shortcut: <the limit/ceiling>, <when to upgrade>`
  - Audit all shortcuts anytime using [`references/ponytail-debt.md`](./references/ponytail-debt.md).
- **Never Cut**: Validation at trust boundaries, error handling that prevents data loss, security, WCAG accessibility, hardware calibration, or anything the user explicitly asked for.

### 1.4 Operating Levels & Mandatory Closing Footer
- **Levels**:
  - `lite`: Build what was asked; name the smaller option in one line and let the user pick.
  - `full` *(default)*: Apply all rules above.
  - `ultra`: Before building, push back on any part of the request that the real need does not justify.
- **Mandatory Closing Footer**: End every coding response with 1–2 concise lines stating:
  - **Skipped / Not checked**: What unrequested extras were skipped or what environment checks could not be run.
  - **Risk**: Any residual risk or `shortcut:` limit the user must know.

---

## Pillar 2: Production Architecture, Security, TDD & Verification (`everything-claude-code`)

Combine `ponytail`'s minimalism with `everything-claude-code`'s production engineering discipline.

### 2.1 Core Coding Standards
- **Immutability by Default**: Always return new objects/arrays (`{ ...obj }`, `[...arr]`) rather than mutating inputs or state in place, unless in-place mutation is explicitly justified for hot-loop performance.
- **Structure & Naming**:
  - High cohesion, low coupling. Organize by feature/domain.
  - Early returns (guard clauses) instead of deep nesting (never >4 levels).
  - Named constants instead of magic numbers; verb-noun function names (`fetchMarketData`, `isValidEmail`).
  - Parallelize independent async operations (`Promise.all`).
- Deep dive: [`references/ecc-coding-standards.md`](./references/ecc-coding-standards.md), [`references/ecc-frontend-patterns.md`](./references/ecc-frontend-patterns.md), [`references/ecc-backend-patterns.md`](./references/ecc-backend-patterns.md).

### 2.2 Mandatory Security Hardening
Before committing or delivering any backend, API, auth, or data-handling code, enforce:
1. **Zero Hardcoded Secrets**: Load all keys/passwords from environment variables and fail fast if missing.
2. **Trust-Boundary Validation**: Validate all external inputs, URL params, and payloads with strict schemas (e.g., Zod) and whitelist file uploads (size, MIME, extension).
3. **Parameterized Queries Only**: Never concatenate user input into SQL or shell commands; enable Row-Level Security (RLS) where applicable.
4. **Auth & Session Safety**: Prefer `HttpOnly; Secure; SameSite=Strict` cookies over `localStorage` for sensitive tokens; verify authorization/RBAC before every mutation.
5. **Safe Errors & Logs**: Never leak stack traces, internal paths, passwords, or PII in client responses or logs.
- Deep dive: [`references/ecc-security-review.md`](./references/ecc-security-review.md).

### 2.3 Pragmatic TDD & The 6-Phase Verification Gate
- **When to Write Tests**:
  - Every new non-trivial logic block (a branch, loop, parser, state machine, financial calculation, auth/security check, API route, or bug fix) requires a test that **fails when the logic breaks** (Red -> Green -> Refactor).
  - Test **user-visible behavior** and public contracts using Arrange-Act-Assert (AAA) and semantic selectors (`getByRole`, `data-testid`), never brittle CSS classes or private internal state.
- **The 6-Phase Verification Loop** (run before declaring any coding task done):
  1. **Build**: Run the build command (`npm run build`, `cargo build`, `flutter build`, etc.).
  2. **Types**: Run static type analysis (`tsc --noEmit`, `pyright`, `dart analyze`, `cargo clippy`).
  3. **Lint**: Run project linters + `scripts/lint.mjs` (for UI).
  4. **Tests**: Run the test suite and verify new/existing tests pass.
  5. **Security & Browser Inspection**: Scan for secrets/leftover `console.log` + run `scripts/inspect.mjs` (for UI).
  6. **Diff & Callers**: Check `git diff --stat` and confirm all callers agree with changed signatures.
- Deep dive: [`references/ecc-tdd-workflow.md`](./references/ecc-tdd-workflow.md) and [`references/ecc-verification-and-ops.md`](./references/ecc-verification-and-ops.md).

---

## Pillar 3: Research-Driven Art Direction & Browser Inspection (`taste-skill` v2)

Whenever building, redesigning, restyling, or reviewing a **Web Page** (landing page, marketing site, portfolio, product page, one-pager) or an **App Screen** (dashboard, admin view, analytics, inbox, settings), use `taste-skill`'s research engine and real-browser inspector.

> **Path Note**: In the commands below, `<beznops>` refers to the directory containing this `SKILL.md` file (e.g. `.agents/skills/beznops` or `~/.gemini/config/skills/beznops`). Run commands from the target project's root directory so working artifacts land in `.taste-skill/`.

### 3.1 Step 0: Decide Page vs. App Screen
- **A Page** is read and scrolled (landing page, marketing site, portfolio, event, restaurant, one-pager). Follow **The 10-Step Page Run (3.2)** below.
- **An App Screen** is worked in (dashboard, admin, analytics, settings, billing, inbox, queue, editor). Read [`references/app-screens.md`](./references/app-screens.md) in full before starting, draw with `node <beznops>/scripts/draw.mjs --app --kind <kind> --brief "<product>"`, and inspect with `node <beznops>/scripts/inspect.mjs <target> --app`.
- **Software Marketing Page Showing Its App**: The page follows the Page Run, while embedded product UI fragments (`data-ui`) are built as real working HTML/CSS fragments using `draw.mjs --app --keep palette,type --out .taste-skill/app`, [`assets/app.css`](./assets/app.css), and [`assets/charts.js`](./assets/charts.js).

### 3.2 The 10-Step Page Run (Execute in Strict Order)

1. **Read the Brief & Inventory the Subject**:
   - Identify what is real: subject, audience, primary action, stack, existing brand (`--keep palette,type`), and **what imagery truly exists** (`--have photography,product-photo,product-ui,illustration,video`).
   - **Inventory 8–12 specific facts** that belong *only* to this subject and no competitor (its name's meaning, street/origin, exact numbers/constraints, materials, rituals, printed artefacts of its world).
2. **Write the Argument** ([`references/copy.md`](./references/copy.md) §1):
   - List the page as claims with their proof, one line per section. The claims decide which sections exist and in what order. Delete any section without a claim.
3. **Draw the Art Direction**:
   ```bash
   node "<beznops>/scripts/draw.mjs" --sector <sector> --brief "<one line about subject>" \
     --sections <roles-in-argument-order> [--tone <tone>] [--have <assets>] [--keep palette,type] --options 3
   ```
   - Compare the 3 dealt directions against your subject inventory. Pick the one that best carries a specific truth from your inventory (not the safest default), then deal the full sheet:
   ```bash
   node "<beznops>/scripts/draw.mjs" <same-args-without-options> --direction <chosen-id>
   ```
   - Adopt the dealt direction sheet faithfully. Only `--redraw` a slot if it contradicts a stated brand constraint or requires an asset that does not exist, and record the reason.
4. **Find the Idea, Competitor Test & One Live Thing**:
   - Complete this sentence from your inventory before writing markup:
     > *"On this page, **[something specific that belongs to the subject]** becomes **[the device the direction calls for]**."*
   - **Competitor Test**: Swap in the nearest real competitor. If the sentence still works, the idea is generic—dig deeper into the inventory.
   - **One Live Thing**: Build one purposeful interactive element on the page made from the idea (e.g., an interactive calculator, live material/wood switcher, real-time schedule/status check, interactive type tester) using real content, thumb-friendly on mobile, with a no-JS fallback.
5. **Write the Words (Copy Deck First)** ([`references/copy.md`](./references/copy.md)):
   - **Every headline (`h1`–`h6`) must fit in 2 lines or fewer at every width** (~32 characters median).
   - Put one clear supporting sentence directly under the `h1` (32–48px below) and one specific primary CTA button.
   - Write full, dense, real content for every section. Never invent social proof, customer quotes, logos, or statistics.
6. **Build It, Still** (Motion off first):
   - **Tokens**: Define palette and typography from the direction sheet as CSS custom properties (optionally starting from [`assets/base.css`](./assets/base.css)).
   - **Hero & Sections**: Follow the dealt blueprints at desktop (`1440px`), tablet (`768px`), and phone (`390px`). Neighbouring sections must never share the same layout. Carry the idea into every section including pricing, FAQ, and footer.
   - **Imagery Floor (>= 4 real pictures, typically 6–12)** ([`references/imagery.md`](./references/imagery.md)):
     - Search open commercial-safe archives (Openverse, Wikimedia, Art Institute of Chicago, The Met) using:
       ```bash
       node "<beznops>/scripts/assets.mjs" "<specific inventory query>"
       node "<beznops>/scripts/assets.mjs" --get <ref>
       node "<beznops>/scripts/assets.mjs" --credits
       ```
     - Supplement with subject-specific flat graphic drawings in code where no photo exists, and one muted loop video clip (`assets.mjs --video "<query>"`) where appropriate. Never present archival world photos as the client's own team or product.
   - **Scroll Scenes** (when dealt on the sheet): Build from [`assets/scenes/`](./assets/scenes/) and [`references/scenes.md`](./references/scenes.md).
   - **Fullness & Frame**: Equal outer margins at every width; no section huddled on one side leaving an unclosed void; no blank stretches > 0.5 screen height; `120–240px` desktop section rhythm; every section titled.
7. **Run the Automated Gate**:
   ```bash
   node "<beznops>/scripts/lint.mjs" <source-files-or-folder>
   node "<beznops>/scripts/inspect.mjs" <url-or-path/to/index.html>
   node "<beznops>/scripts/scenes.mjs" <url-or-path/to/index.html>   # if scroll scenes exist
   ```
   - Fix every `FAIL` and address every `WARN` across `1440`, `768`, and `390` viewports until `inspect.mjs` exits with `0 FAIL`.
8. **Look & Critique (Visual Loop)** ([`references/critique.md`](./references/critique.md)):
   - View every generated screenshot in `.taste-skill/inspect/` using `read_file`.
   - Score the screenshots across the 14 passes in `references/critique.md`, fix the top 3 visual flaws, and re-run `inspect.mjs` (up to 3 rounds).
9. **Build the Motion Layer** ([`references/motion.md`](./references/motion.md)):
   - Implement the 4 required motion layers using `transform` and `opacity` only, with a `prefers-reduced-motion` fallback:
     1. The dealt **signature move**.
     2. **Staggered section entrances** (heading -> text -> media, 60–90ms stagger, 16–32px rise).
     3. **Interactive control feedback** (`:hover`, `:active`, `:focus-visible` on all buttons, links, cards, and the live thing).
     4. **One moving picture** (video loop, slow photo scale/drift, or scroll-linked hero media).
   - Re-run `inspect.mjs` after adding motion to verify >= 8 moving elements and ensure no content remains hidden.
10. **Deliver with Combined Gate Report** (See Pillar 4 below).

### 3.3 House Style Rules (Enforced by `inspect.mjs` & `lint.mjs`)
Unless explicitly overridden by an existing brand (`--keep` / `--allow <rule>`), enforce:
- **Headlines <= 2 lines** at all widths (`1440`, `768`, `390`); clear `h1` on first screen; heading on every section.
- **Equal outer margins**; no unclosed half-screen voids; no blank vertical stretches > half a screen.
- **No eyebrows** (no small pill/label parked above `h1`–`h6`).
- **No decorative monospace** outside real `<pre>`/`<code>` blocks.
- **No index numbering** (`01 / 02 / 03`, `(001)`, `Step 1`).
- **No thin 1px rules, hairlines, outlined card boxes, or background grids** (separate surfaces by space or a small tone step).
- **No gradients** (flat color or real photography only; neutral scrim under photo text is the sole exception).
- **No shadows at rest & no glows** (shadows only on floating menus/dialogs).
- **No glassmorphism / backdrop-blur bars or floating pill navbars**.
- **No icon-topped feature cards or rows of identical cards**.
- **No decorative emoji, gradient blobs, fake terminal windows, or grey-bar skeleton mockups**.
- **No styled accent words inside headlines** (no single italic/colored/underlined word for artificial emphasis).
- **At most 2 typefaces** (1 is normal) and **1 ground, 1 ink, 1 accent colour**.

---

## Pillar 4: Anti-Slop Filter, Liveliness & Craftsmanship Gate (`anti-slop`)

`anti-slop` protects honesty, accessibility, responsiveness, copywriting voice, and visual intentionality across all 38 rules (`R-01`–`R-38`) and 5 Craftsmanship criteria (`C-1`–`C-5`).

### 4.1 Harmonizing `taste-skill` and `anti-slop`
- **`taste-skill` provides the Art Direction & strict House Rules**; **`anti-slop` provides the Honesty, Accessibility, Copywriting, Liveliness Dials, and 38-Rule Delivery Gate**.
- Where `taste-skill` bans a technique outright (e.g., gradients, glassmorphism, shadows at rest, badges, decorative monospace) and `anti-slop` places it in **Group 2: Purpose-Gate**, default to `taste-skill`'s strict house ban on new builds so `inspect.mjs` passes with 0 FAIL. If an existing brand (`DESIGN.md` or user instruction) requires a Purpose-Gate technique, you must **both** write down the 1-line hierarchy/brand reason (`R-31`) **and** pass `--allow <rule>` to `inspect.mjs`.
- Before generating UI, declare both your **`taste-skill` Direction/Idea** (if running a full page/app draw) and the **`anti-slop` Design Read & Liveliness Dials**:
  > `Reading this as: <page/app kind> for <audience>, direction <direction-name>, dial ENERGY <1-3> / RHYTHM <1-3> / MOTION <1-3>.`

### 4.2 Usage Modes (`during` vs. `after`)
- **During Mode (Default when building/editing)**: Apply all rules while writing so slop never appears, and conclude with the Delivery Gate.
- **After Mode (When auditing an existing UI/project)**: Do not edit files first. Produce a numbered findings report citing `R-XX` (Priority: Hard Gate = `HIGH`, Purpose-Gate = `MEDIUM`, Quality Locks = `LOW`) + `inspect.mjs` measurements, let the user pick which numbers to fix, and then fix them.

### 4.3 The 5 Craftsmanship Standards (`C-1` to `C-5`)
- **C-1 Intentionality**: Every visual and copy decision has a 1-line reason you can articulate (`R-31`).
- **C-2 Functional Completeness**: Every interactive element works (`href` to real section, modal that opens/closes with `Escape`, state toggle, form with validation/feedback), or it is removed (`R-24`, `R-26`).
- **C-3 Content-Driven Composition**: Every section exists because the product's argument needs it, never to fill a template (`R-05`).
- **C-4 Resilience**: The UI holds up in **Empty, Loading, and Error states** (`R-27`), in **every shipped theme** (`R-21`, `R-34`), across **all breakpoints** (`R-03`), at **200% text zoom**, and with **keyboard-only navigation** (`Tab`, `Enter`, `Space`, `Escape`, visible `:focus-visible` ring at >= 3:1 contrast, `R-32`).
- **C-5 Evidence Over Claims**: Zero fabricated statistics (`R-17`), zero fictional testimonials/avatars (`R-18`), zero unverified security/compliance claims (`R-36`), zero fake `John Doe` filler in tables/forms (`R-23`, `R-38`). Use real data or explicit placeholders (`[REAL DATA]`, `[LOGO]`, `Coming soon`).

### 4.4 Mandatory Copywriting & Accessibility Rules
- **R-02 No Em Dashes (`—`)**: Never output the em dash character (`—`) or spaced double-hyphens (` -- `) in generated UI copy or prose. Use a period, comma, colon, or parentheses instead.
- **R-15 & R-16 Specific Copy Over Buzzwords**: Ban generic CTAs (*"Get Started"*, *"Learn More"*, *"Explore"*) and AI buzzwords (*"AI Powered"*, *"Seamless"*, *"Revolutionary"*, *"Cutting Edge"*, *"Unlock"*, *"Elevate"*, *"Delve"*). Name the concrete action and actor.
- **R-25 Verified WCAG AA Contrast**:
  - Normal text: **>= 4.5:1**. Large text (18px+): **>= 3.0:1**. UI component boundaries & focus rings: **>= 3.0:1**.
  - Never eyeball grey-on-grey or text over photos. Run the bundled contrast checker:
    ```bash
    python "<beznops>/scripts/contrast-check.py" "#FFFFFF" "#777777"
    ```
- **R-03 True Mobile Reflow**: Mobile is a distinct layout, not a squeezed desktop. Minimum **44x44px** tap targets with spacing, fluid typography (`clamp()`), multi-stage grid collapse across tablet and phone, and zero horizontal overflow.
- **R-33 No Script Patching**: Never patch CSS/source files via regex/string-replacement helper scripts; edit source files cleanly.
- **R-35 Verify Before Delivery**: Build/run the app, click through every interactive element across themes and breakpoints, verify zero console errors, and record the click-through evidence.

### 4.5 Mandatory Delivery Gate (Include in Final Output for UI/Copy Tasks)
Before delivering any UI or copy work, verify all 4 blocks (`Hard Gate`, `Purpose-Gate / House Style`, `Liveliness`, `Craftsmanship & Quality Locks` — full checklist in [`references/antislop-core.md`](./references/antislop-core.md)) and include a concise **Delivery & Verification Summary**:
1. **Direction, Idea & Dials**: Chosen direction/seed, subject idea sentence, live interactive element, and `ENERGY / RHYTHM / MOTION` dials.
2. **Browser Inspection & Contrast (`inspect.mjs` + `contrast-check.py`)**: Verdict at `1440px`, `768px`, and `390px` (`0 FAIL`), plus critique score from [`references/critique.md`](./references/critique.md).
3. **Interactive Click-Through & States (`R-26`, `R-27`, `R-32`, `R-35`)**: Element-by-element verification, keyboard focus check, and Empty/Loading/Error states.
4. **Honesty & Asset Credits (`R-17`, `R-18`, `R-23`, `R-38`)**: Archival image credits (`assets.mjs --credits`) and any sample details/placeholders requiring client confirmation.
5. **Ponytail Footer**: `Skipped / Not checked` + `Risk`.

---

## Complete Directory of Bundled Scripts, Libraries & References

### Executable Scripts (`./scripts/`)
- [`scripts/draw.mjs`](./scripts/draw.mjs) — Deals researched art directions, palettes, type systems, hero/section blueprints, and `--app` screen styles from `./library/*.json`.
- [`scripts/inspect.mjs`](./scripts/inspect.mjs) — Renders pages or `--app` screens in headless Chrome/Edge at `1440`, `768`, and `390`px, checks all house rules and layout geometry, and saves screenshots to `.taste-skill/inspect/`.
- [`scripts/lint.mjs`](./scripts/lint.mjs) — Static source scanner for banned AI slop patterns, stock phrases, and house-rule violations.
- [`scripts/assets.mjs`](./scripts/assets.mjs) — Searches commercial-safe open archives (Openverse, Wikimedia, AIC, Met) for real photography and video (`--video`), downloads (`--get`), and formats footer credits (`--credits`).
- [`scripts/scenes.mjs`](./scripts/scenes.mjs) — Photographs scroll scenes at 0–100% hold across desktop, phone, and reduced-motion.
- [`scripts/contrast-check.py`](./scripts/contrast-check.py) — Exact WCAG 2.x relative luminance and contrast ratio calculator for normal (`4.5:1`) and large (`3.0:1`) text.
- [`scripts/beznops-helper.ps1`](./scripts/beznops-helper.ps1) — Zero-dependency Windows PowerShell fallback (`powershell -ExecutionPolicy Bypass -File "<beznops>/scripts/beznops-helper.ps1" contrast|list|draw|lint ...`) when `node` or `python` is not in `PATH`.

### Foundation Assets (`./assets/` & `./library/`)
- [`assets/base.css`](./assets/base.css) & [`assets/base.js`](./assets/base.js) — Neutral CSS token foundation, fluid type steps, grid, focus styles, and motion helpers.
- [`assets/app.css`](./assets/app.css) & [`assets/charts.js`](./assets/charts.js) — Neutral app-screen shell, panels, tables, controls, and clean SVG chart generators.
- [`assets/scenes/stage.css`](./assets/scenes/stage.css) & [`assets/scenes/stage.js`](./assets/scenes/stage.js) — Shared scroll-scene stage.
- `./library/*.json` — Distilled data from 247 curated sites (`directions`, `heroes`, `sections`, `type`, `palettes`, `photos`, `motions`, `sites`, `app`).

### Deep-Dive Reference Manuals (`./references/`)
- **Art Direction & Frontend Craft (`taste-skill`)**:
  - [`references/app-screens.md`](./references/app-screens.md) — Complete workflow, rules, and tokens for dashboards, admin panels, and workspaces.
  - [`references/copy.md`](./references/copy.md) — Writing the section argument, copy deck, and two-line headline arithmetic.
  - [`references/type.md`](./references/type.md) — Type scales, tracking, measure, font loading, and pairing.
  - [`references/colour.md`](./references/colour.md) — Palette roles, proportions, tone steps, dark mode, and contrast.
  - [`references/layout.md`](./references/layout.md) — Grids, outer margins, section rhythm, navigation, footer, and phone composition.
  - [`references/imagery.md`](./references/imagery.md) — Finding, crediting, cropping, and drawing subject-specific imagery and UI fragments.
  - [`references/motion.md`](./references/motion.md) — Motion budget, tokens, staggered entrances, and `prefers-reduced-motion`.
  - [`references/scenes.md`](./references/scenes.md) — Building, filling, fitting, and verifying scroll scenes.
  - [`references/critique.md`](./references/critique.md) — 14-pass visual rubric and Awwwards-weighted scoring for screenshots.
  - [`references/tells.md`](./references/tells.md) — Dated registry of AI-generated page tells and their replacements.
  - [`references/research.md`](./references/research.md) — Statistical findings and methodology from the 247-site study.
- **Anti-Slop Filter & Checklists (`anti-slop`)**:
  - [`references/antislop-core.md`](./references/antislop-core.md) — Full `R-01`–`R-38` rules, `C-1`–`C-5` standards, Liveliness Dials, and 4-Block Delivery Gate.
  - [`references/antislop-ui.md`](./references/antislop-ui.md) — Visual, layout, component, and dashboard slop tells + UI checklist.
  - [`references/antislop-copywriting.md`](./references/antislop-copywriting.md) — Prose, tone, rhythm, em-dash, and voice calibration rules + Copywriting checklist.
  - [`references/antislop-human.md`](./references/antislop-human.md) — WCAG AA contrast formula/table, keyboard nav, focus, and states + Human checklist.
  - [`references/antislop-layoutmobile.md`](./references/antislop-layoutmobile.md) — Mobile reflow, breakpoints, fluid sizing, tap targets, and mobile nav + Layoutmobile checklist.
  - [`references/antislop-code.md`](./references/antislop-code.md) — Code comment hygiene rules + Code Comment checklist.
- **Pragmatic Senior Dev Workflows (`ponytail`)**:
  - [`references/ponytail-audit.md`](./references/ponytail-audit.md) — Whole-repo bug, security, scale, test, speed, and lean audit workflow.
  - [`references/ponytail-review.md`](./references/ponytail-review.md) — Diff/PR review workflow with caller tracing and concrete failure cases.
  - [`references/ponytail-debt.md`](./references/ponytail-debt.md) — `shortcut:` comment debt ledger scanner.
- **Full-Stack Engineering, Security & Verification (`everything-claude-code`)**:
  - [`references/ecc-coding-standards.md`](./references/ecc-coding-standards.md) — Universal TypeScript/JS/React/API coding standards and code smell prevention.
  - [`references/ecc-frontend-patterns.md`](./references/ecc-frontend-patterns.md) — React/Next.js composition, hooks, state management, virtualization, error boundaries, and a11y.
  - [`references/ecc-backend-patterns.md`](./references/ecc-backend-patterns.md) — REST/API design, Repository/Service/Middleware patterns, N+1 prevention, transactions, caching, retries, rate limiting, and structured logging.
  - [`references/ecc-security-review.md`](./references/ecc-security-review.md) — 10-point security review checklist (secrets, Zod validation, SQLi, JWT/cookies, RLS, XSS, CSRF, rate limiting).
  - [`references/ecc-tdd-workflow.md`](./references/ecc-tdd-workflow.md) — TDD Red-Green-Refactor workflow, unit/integration/Playwright E2E patterns, and mocking.
  - [`references/ecc-verification-and-ops.md`](./references/ecc-verification-and-ops.md) — 6-Phase Verification Loop, Subagent orchestration, Strategic Compaction, and Git/PR discipline.

