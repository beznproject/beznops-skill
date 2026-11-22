---
name: beznops-clean
description: >-
  Focused Clean Code & Software Architecture engine for Antigravity (part of beznops).
  Synthesizes 14 software engineering classics (Clean Code, Clean Architecture, DDIA, DDD,
  Refactoring, Pragmatic Programmer, PoEAA, Release It). Mandates crystal-clear function and
  logic header comments so code is instantly understandable for humans.
argument-hint: "[refactor|document|architecture|explain] <path or scope>"
---

# `beznops-clean` — Clean Code & Software Engineering Architecture

Specialized focus mode for clean code, solid architectural design, domain modeling, and self-documenting implementations.

## Core Rules & Architecture Standards

### 1. Mandatory Function & Logic Header Comments
Every function, method, endpoint, and non-trivial business logic block MUST have an explanatory header placed directly above it:
- **Purpose & Business Intent**: What capability this code fulfills in plain, human language.
- **Context & Domain Rules**: What triggers this logic and what business policy it enforces.
- **Exceptions & Non-Obvious Behavior**: Handled errors, idempotency guarantees, side effects, and concurrency behavior.
- **Inline Annotations**: Every complex conditional or calculation begins with a 1-line business explanation.

*Example:*
```typescript
/**
 * Calculates tiered promotional discounts for active customer cart.
 * - Enforces coupon quota limits and real-time expiration checks.
 * - Applies volume discounts if subtotal crosses tier threshold before shipping.
 * @throws {CouponExpiredException} When the supplied promotion code has expired.
 */
export async function calculateTieredCartDiscount(cart: Cart, couponCode?: string): Promise<DiscountResult> {
  // Verify customer loyalty tier prior to applying external partner vouchers
  const loyaltyTier = await getCustomerLoyaltyTier(cart.customerId);
  ...
}
```

### 2. The 14 Engineering Classics In Action
- **Clean Code (Uncle Bob)**: Small single-purpose functions, meaningful intention-revealing names, maximum 2-3 arguments, no magic numbers.
- **Clean Architecture (Uncle Bob)**: Inward dependency rule, business entities isolated from external DB/frameworks.
- **The Pragmatic Programmer**: DRY (Don't Repeat Yourself), orthogonality, Broken Windows Theory, ETC (Easier To Change).
- **Refactoring & Refactoring Guru**: Continuous smell identification (Long Method, Feature Envy, Primitive Obsession) and safe micro-refactorings.
- **A Philosophy of Software Design (Ousterhout)**: Deep modules (simple interface, powerful implementation), defining errors out of existence.
- **Domain-Driven Design (DDD)**: Ubiquitous language, bounded contexts, aggregates, value objects, domain events.
- **DDIA (Martin Kleppmann)**: ACID vs BASE trade-offs, storage indexing, partitioning, reliability under scale.
- **Release It! (Michael Nygard)**: Circuit breakers, bulkheads, timeouts, fail-fast resilience.

---

## Detailed References
- Software Engineering Books Guide: `../../docs/software-engineering-books.md`
- 14 Book Modules: `../beznops/modules/books/`
- Code Standards: `../beznops/references/antislop-code.md` & `../beznops/references/ecc-coding-standards.md`
