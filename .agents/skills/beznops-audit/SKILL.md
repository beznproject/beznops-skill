---
name: beznops-audit
description: >-
  Focused Whole-Codebase & PR Security/Quality Audit engine for Antigravity (part of beznops).
  Combines Ponytail whole-repo audit, 10-point OWASP security review, technical debt scanner
  (shortcut ledger), caller tracing, and 6-phase verification loops.
argument-hint: "[repo|diff|security|debt|caller] <path or scope>"
---

# `beznops-audit` — Codebase Audit, Security Review & Technical Debt

Specialized focus mode for evaluating whole repositories, verifying PRs, uncovering security flaws, and hunting technical debt.

## Audit Disciplines

### 1. Ponytail Whole-Repo Audit
- Maps entry points, expected load, and critical data flows (money, auth, user input).
- Evaluates code hierarchy: Correct > Safe > Holds Under Load > Tested > Fast > Lean.
- Identifies unnecessary bloat, dead code, single-use abstractions, and speculative complexity.

### 2. 10-Point OWASP Security Review
- **Secrets & Credentials**: Zero hardcoded API keys, tokens, or private credentials in code or Git history.
- **Input Validation**: Schema validation at system boundaries (Zod / Valibot / Pydantic).
- **Injection Flaws**: Prepared statements / parameterized queries only (SQLi prevention), XSS sanitization.
- **Authentication & Sessions**: Secure JWT/session cookies (`HttpOnly`, `SameSite=Lax`, `Secure`), rotation, expiration.
- **Authorization & RLS**: Row-Level Security checks and role-based access control (RBAC).
- **CSRF & CORS**: Strict CORS origin whitelisting, CSRF tokens on mutation endpoints.
- **Rate Limiting**: Throttling on sensitive endpoints (login, forgot-password, payment).

### 3. Technical Debt Ledger (`// shortcut:`)
- Scans and tabulates all temporary shortcuts in the format:
  `// shortcut: <known limit>, <when to upgrade>`
- Generates a clear ledger of technical debt with trigger conditions and risk rankings.

### 4. Caller Tracing
- Before touching or approving changes to shared functions, exhaustively greps every caller to prevent downstream regressions.

---

## Detailed References
- Ponytail Audit Manual: `../beznops/references/ponytail-audit.md`
- PR & Diff Review: `../beznops/references/ponytail-review.md`
- Debt Ledger: `../beznops/references/ponytail-debt.md`
- OWASP Security Checklist: `../beznops/references/ecc-security-review.md`
