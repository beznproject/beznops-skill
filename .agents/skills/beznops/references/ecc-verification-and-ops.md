# Verification Loop, Subagent Orchestration & Operations Reference

Consolidated from `everything-claude-code` (`verification-loop`, `eval-harness`, `strategic-compact`, `continuous-learning`, and `rules/*`), adapted for Google Antigravity (`beznops`).

---

## 1. The 6-Phase Verification Loop

Run this verification loop after completing a feature, significant refactor, or before preparing a PR/commit.

### Phase 1: Build Verification
```bash
# Node / TypeScript
npm run build
# Rust
cargo build
# Dart / Flutter
flutter build
```
If the build fails, **STOP and fix** before continuing.

### Phase 2: Static Analysis & Type Check
```bash
# TypeScript
npx tsc --noEmit
# Python
pyright .
# Dart / Flutter
dart analyze
# Rust
cargo clippy --all-targets -- -D warnings
```
Fix all type and static analysis errors before continuing.

### Phase 3: Lint & Slop Gate
```bash
# Project linter
npm run lint
# UI / Frontend Taste & Anti-Slop Linter (when UI files exist)
node <beznops>/scripts/lint.mjs <source-dir>
```

### Phase 4: Test Suite & Coverage
```bash
npm run test -- --coverage
```
- Verify all unit, integration, and E2E tests pass.
- For new non-trivial logic (branches, loops, parsers, money, auth, state transitions), ensure tests exist and fail when the logic breaks.

### Phase 5: Security & Browser Inspection Scan
1. **Secrets & Debug Leftovers Scan**:
   - Ensure zero hardcoded secrets (`sk-`, `api_key`, tokens, passwords) in source files.
   - Ensure zero stray `console.log` / debug print statements in production paths.
2. **Real-Browser UI Inspection** (when building or modifying web pages or app screens):
   ```bash
   node <beznops>/scripts/inspect.mjs <url-or-html-path>
   ```
   - Must achieve **0 FAIL** across `1440`, `768`, and `390` widths.
   - Verify WCAG AA contrast (`4.5:1` normal text, `3.0:1` large text / UI boundaries) via `python <beznops>/scripts/contrast-check.py "#HEX1" "#HEX2"`.

### Phase 6: Diff & Caller Review
```bash
git diff --stat
```
- Grep every caller of any function whose signature, return shape, or side effects changed.
- Verify no unintended file modifications or dead code remain.

### Standard Verification Report Format
```text
VERIFICATION REPORT
===================
Build:     [PASS/FAIL]
Types:     [PASS/FAIL] (X errors)
Lint:      [PASS/FAIL] (X warnings)
Tests:     [PASS/FAIL] (X/Y passed, Z% coverage)
Security:  [PASS/FAIL] (X issues)
UI Gate:   [PASS/FAIL/N/A] (inspect.mjs 1440/768/390 & Antislop R-01..R-38)
Diff:      [X files changed]

Overall:   [READY / NOT READY]
Skipped:   <1 line: what was skipped or not checked>
Risk:      <1 line: any residual risk or shortcut limit>
```

---

## 2. Subagent Orchestration in Antigravity

When working on large or multi-faceted tasks in Antigravity, delegate isolated work to subagents (`invoke_subagent`) to keep the main conversation context clean:

| Role | Subagent Type | When to Delegate |
| :--- | :--- | :--- |
| **Codebase & Docs Explorer** | `research` | Broad codebase surveys, reading many files, or external web/docs research that would bloat the main context window. |
| **Accessibility Auditor** | `flutter_a11y_agent` / `self` | Auditing WCAG compliance, focus order, contrast, and screen reader labels. |
| **Security & Quality Reviewer** | `self` (Read/Review prompt) | Running an independent `ponytail-review` or `ecc-security-review` pass on a large diff before shipping. |
| **Build & Test Fixer** | `self` (Branch/Inherit) | Resolving isolated compile/type errors or writing E2E test suites. |

---

## 3. Context Window & Strategic Compaction

1. **Avoid the Last 20% of Context for Complex Multi-File Work**:
   - Multi-file refactoring, architectural design, and root-cause debugging degrade when context is cluttered with stale exploration logs.
2. **Recommend `/compact` at Logical Milestones**:
   - After completing research/exploration and finalizing an implementation plan.
   - After resolving a tricky build or debugging session before starting the next feature.
3. **Recommend `/learn` for Continuous Learning**:
   - When the user corrects a project-specific convention, package manager quirk, or architectural rule, suggest `/learn` or document it in `GEMINI.md` / `AGENTS.md` so future sessions inherit it automatically.

---

## 4. Git & Pull Request Discipline

- **Conventional Commits**: `<type>: <description>` (`feat`, `fix`, `refactor`, `docs`, `test`, `chore`, `perf`, `ci`).
- **PR Preparation**:
  1. Inspect the full branch diff (`git diff <base>...HEAD`), not just the last commit.
  2. Run the 6-Phase Verification Loop.
  3. Summarize *what* changed, *why* (the minimum complete change), and exact verification evidence.

