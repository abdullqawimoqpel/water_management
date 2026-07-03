# ADR-001: Feature-First Architecture

**Status:** Accepted  
**Date:** 2026-07-03  
**Deciders:** Lead Software Architect

## Context

We need to decide the top-level organizational strategy for the codebase. Two primary options exist:

1. **Layer-first:** Group by architectural layer (`controllers/`, `models/`, `repositories/`), then by feature within each layer.
2. **Feature-first:** Group by business feature (`customer/`, `billing/`, `payment/`), then by layer within each feature.

## Decision

We adopt **feature-first architecture**.

## Rationale

### Layer-first problems at scale

In a layer-first project with 11 features, a developer working on "customer payments" would need to navigate:

- `controllers/payment_controller.dart`
- `models/payment_model.dart`
- `repositories/payment_repository.dart`
- `pages/payment_page.dart`

These files are scattered across the entire `lib/` directory. With 11 features × 4 layers × 2+ files per layer, the top-level folders contain 80+ files each. Finding related code requires knowing the full naming convention.

### Feature-first advantages

| Benefit | Description |
|---------|-------------|
| **Discoverability** | All payment code is in `features/payment/`. One folder to search. |
| **Isolation** | Deleting a feature = deleting one folder. No cross-folder cleanup. |
| **Team scaling** | Teams own features. No merge conflicts across unrelated feature files in shared folders. |
| **Onboarding** | New developer asks "where is billing?" → `features/billing/`. Immediate answer. |
| **Modularity** | Features can be extracted to packages if needed for multi-app scenarios. |

### Feature-first risks (mitigated)

| Risk | Mitigation |
|------|-----------|
| Cross-feature code duplication | `core/shared/` for truly shared entities and widgets. |
| Inconsistent internal structure | Enforced via Engineering Constitution Section 12. |
| Feature coupling | Cross-feature imports restricted to domain layer only. |

## Consequences

- Every new feature creates a new folder under `features/` with a standard 4-layer structure.
- Shared abstractions live in `core/`, never duplicated inside features.
- Cross-feature wiring happens through `core/shared/` or use case composition.

## Alternatives Considered

- **Layer-first:** Rejected due to poor discoverability at scale.
- **Module-per-package:** Too complex for current team size. Revisit when team exceeds 10 engineers.
