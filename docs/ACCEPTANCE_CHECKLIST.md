# ACCEPTANCE CHECKLIST
## Water Management ERP System

**Version:** 1.0.0  
**Date:** 2026-07-03

> Every phase must pass ALL applicable items before approval.  
> Mark each item as PASS, FAIL, or N/A.

---

## 1. CODE QUALITY GATE

| # | Check | Status |
|---|-------|--------|
| 1.1 | `flutter analyze` returns zero issues | ☐ |
| 1.2 | `dart format` produces no changes | ☐ |
| 1.3 | No `print()` statements in production code | ☐ |
| 1.4 | No commented-out code | ☐ |
| 1.5 | No TODO items without ticket references | ☐ |
| 1.6 | No files exceeding 300 lines | ☐ |
| 1.7 | No methods exceeding 30 lines | ☐ |
| 1.8 | No nesting deeper than 4 levels | ☐ |
| 1.9 | No functions with more than 5 parameters | ☐ |

---

## 2. ARCHITECTURE GATE

| # | Check | Status |
|---|-------|--------|
| 2.1 | Domain layer has zero Flutter imports | ☐ |
| 2.2 | Domain layer has zero third-party package imports (except equatable, dartz) | ☐ |
| 2.3 | No direct cross-feature presentation imports | ☐ |
| 2.4 | All data access goes through repository interfaces | ☐ |
| 2.5 | All business logic lives in use cases or entities, not controllers | ☐ |
| 2.6 | Dependencies flow inward only (Presentation → Application → Domain ← Data) | ☐ |
| 2.7 | New features follow the standard 4-layer directory structure | ☐ |
| 2.8 | DI registration happens in Binding classes only | ☐ |

---

## 3. NAMING GATE

| # | Check | Status |
|---|-------|--------|
| 3.1 | All files use `snake_case.dart` | ☐ |
| 3.2 | All classes use `PascalCase` | ☐ |
| 3.3 | All variables use `camelCase` | ☐ |
| 3.4 | File names reflect the primary class inside | ☐ |
| 3.5 | Suffixes follow convention (_repository, _controller, _page, etc.) | ☐ |
| 3.6 | Boolean variables use is/has/can/should prefix | ☐ |
| 3.7 | Use cases are named as verb phrases (GetCustomerById, CreateInvoice) | ☐ |

---

## 4. ERROR HANDLING GATE

| # | Check | Status |
|---|-------|--------|
| 4.1 | All repository methods return `Either<Failure, T>` | ☐ |
| 4.2 | No untyped exceptions thrown | ☐ |
| 4.3 | No empty catch blocks | ☐ |
| 4.4 | Data sources throw typed exceptions (ServerException, CacheException) | ☐ |
| 4.5 | Repositories catch and convert exceptions to Failures | ☐ |
| 4.6 | Controllers handle both Left (failure) and Right (success) states | ☐ |
| 4.7 | UI shows user-friendly error messages, never raw exceptions | ☐ |

---

## 5. LOCALIZATION GATE

| # | Check | Status |
|---|-------|--------|
| 5.1 | Zero hardcoded user-visible strings in widgets | ☐ |
| 5.2 | All new strings exist in both `app_en.arb` and `app_ar.arb` | ☐ |
| 5.3 | UI renders correctly in RTL mode | ☐ |
| 5.4 | Arabic translations reviewed (not machine-translated) | ☐ |

---

## 6. EVENT LOGGING GATE

| # | Check | Status |
|---|-------|--------|
| 6.1 | All create/update/delete operations produce domain events | ☐ |
| 6.2 | Events include: id, type, entityId, customerId, performedBy, timestamp, data | ☐ |
| 6.3 | Events are stored locally | ☐ |
| 6.4 | Events appear in customer timeline | ☐ |

---

## 7. OFFLINE GATE

| # | Check | Status |
|---|-------|--------|
| 7.1 | Feature works without internet connection | ☐ |
| 7.2 | Data persists across app restarts while offline | ☐ |
| 7.3 | Changes sync to server when connectivity returns | ☐ |
| 7.4 | No data loss during offline-to-online transitions | ☐ |
| 7.5 | Sync conflicts handled per documented rules | ☐ |

---

## 8. SECURITY GATE

| # | Check | Status |
|---|-------|--------|
| 8.1 | No sensitive data in logs | ☐ |
| 8.2 | No hardcoded API keys or secrets | ☐ |
| 8.3 | Authentication tokens in secure storage | ☐ |
| 8.4 | Role-based access enforced at use case level | ☐ |
| 8.5 | All inputs validated at domain boundary | ☐ |

---

## 9. PERFORMANCE GATE

| # | Check | Status |
|---|-------|--------|
| 9.1 | Lists use `ListView.builder` (not `ListView(children: [...])`) | ☐ |
| 9.2 | `const` constructors used where possible | ☐ |
| 9.3 | `Obx` wraps smallest possible widget subtree | ☐ |
| 9.4 | Database queries use appropriate indexes | ☐ |
| 9.5 | No unnecessary rebuilds (verified via DevTools) | ☐ |
| 9.6 | All lists support pagination | ☐ |

---

## 10. TESTING GATE

| # | Check | Status |
|---|-------|--------|
| 10.1 | Unit tests exist for all use cases (≥ 1 success + 1 failure) | ☐ |
| 10.2 | Test names follow `should {behavior} when {condition}` | ☐ |
| 10.3 | All tests pass (`flutter test`) | ☐ |
| 10.4 | No tests depend on execution order | ☐ |
| 10.5 | No tests depend on real time or external services | ☐ |

---

## 11. DOCUMENTATION GATE

| # | Check | Status |
|---|-------|--------|
| 11.1 | All public APIs have `///` doc comments | ☐ |
| 11.2 | Complex logic has explanatory comments | ☐ |
| 11.3 | CHANGELOG.md updated if applicable | ☐ |
| 11.4 | New architecture decisions documented in ADR | ☐ |
| 11.5 | Feature README exists in feature root | ☐ |

---

## 12. GIT GATE

| # | Check | Status |
|---|-------|--------|
| 12.1 | Commit messages follow `<type>(<scope>): <subject>` format | ☐ |
| 12.2 | One logical change per commit | ☐ |
| 12.3 | Branch name follows convention | ☐ |
| 12.4 | PR template completed | ☐ |
| 12.5 | At least 1 reviewing approval | ☐ |

---

## PHASE APPROVAL

| Item | Value |
|------|-------|
| Phase | |
| Reviewed by | |
| Date | |
| Result | PASS / FAIL |
| Notes | |

---

> **Instructions:** Copy this checklist for each phase.  
> Items marked N/A must include justification.  
> A phase CANNOT be approved with any FAIL items.
