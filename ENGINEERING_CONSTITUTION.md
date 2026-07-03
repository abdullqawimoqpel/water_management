# ENGINEERING CONSTITUTION
## Water Management ERP System

**Version:** 1.0.0  
**Effective Date:** 2026-07-03  
**Classification:** Internal — Engineering Team  
**Status:** ACTIVE — Binding for all contributors

> This document is the engineering law of the project.  
> Every line of code, every commit, every pull request, and every decision must comply.  
> Violations require justification and explicit approval from the Lead Architect.

---

## TABLE OF CONTENTS

1. [Project Vision](#1-project-vision)
2. [Engineering Philosophy](#2-engineering-philosophy)
3. [Coding Standards](#3-coding-standards)
4. [Clean Code Principles](#4-clean-code-principles)
5. [SOLID Rules](#5-solid-rules)
6. [Architecture Principles](#6-architecture-principles)
7. [Naming Conventions](#7-naming-conventions)
8. [Folder Naming Rules](#8-folder-naming-rules)
9. [File Naming Rules](#9-file-naming-rules)
10. [Class Naming Rules](#10-class-naming-rules)
11. [Widget Naming Rules](#11-widget-naming-rules)
12. [Feature Rules](#12-feature-rules)
13. [Dependency Injection Rules](#13-dependency-injection-rules)
14. [Routing Rules](#14-routing-rules)
15. [Localization Rules](#15-localization-rules)
16. [State Management Rules](#16-state-management-rules)
17. [Repository Rules](#17-repository-rules)
18. [Domain Layer Rules](#18-domain-layer-rules)
19. [UI Rules](#19-ui-rules)
20. [Design System Rules](#20-design-system-rules)
21. [Comment Rules](#21-comment-rules)
22. [Documentation Rules](#22-documentation-rules)
23. [Git Commit Rules](#23-git-commit-rules)
24. [Branch Strategy](#24-branch-strategy)
25. [Pull Request Rules](#25-pull-request-rules)
26. [Code Review Checklist](#26-code-review-checklist)
27. [Performance Rules](#27-performance-rules)
28. [Security Rules](#28-security-rules)
29. [Logging Rules](#29-logging-rules)
30. [Error Handling Rules](#30-error-handling-rules)
31. [Testing Strategy](#31-testing-strategy)
32. [Future Scalability Rules](#32-future-scalability-rules)
33. [Backward Compatibility Rules](#33-backward-compatibility-rules)
34. [Event-Driven Rules](#34-event-driven-rules)
35. [Rules for AI-Generated Code](#35-rules-for-ai-generated-code)
36. [Rules for Future Developers](#36-rules-for-future-developers)

---

## 1. PROJECT VISION

This system manages the full lifecycle of water utility operations: customer registration, meter management, readings, billing, payments, notifications, and reporting.

**Design Lifespan:** 10+ years of active development and maintenance.

**Core Tenets:**

| Tenet | Description |
|-------|-------------|
| **Customer-Centered** | Every module relates back to a Customer Number. The customer is the root entity. |
| **Offline-First** | Field workers must operate without internet. Data syncs when connectivity returns. |
| **Financial Integrity** | Invoices are immutable. Payments are append-only. Balances are derived, never mutated. |
| **Auditability** | Every action produces an event. Every event is logged in the customer timeline. |
| **Simplicity** | Rural users with limited technical literacy must operate the system daily. |

---

## 2. ENGINEERING PHILOSOPHY

### 2.1 Core Beliefs

1. **Clarity over cleverness.** Code is read 10x more than it is written.
2. **Explicit over implicit.** No magic. Every dependency is declared. Every side effect is visible.
3. **Composition over inheritance.** Favor mixins and composition. Use inheritance only for sealed hierarchies.
4. **Fail fast, recover gracefully.** Validate at boundaries. Return typed errors. Never swallow exceptions.
5. **Convention over configuration.** Follow established patterns. New developers should predict file locations.

### 2.2 Decision-Making Framework

When making technical decisions, evaluate in this order:

1. **Correctness** — Does it work as specified?
2. **Maintainability** — Can another developer modify it in 6 months?
3. **Performance** — Is it efficient for the expected data volume?
4. **Simplicity** — Is it the simplest correct solution?

### 2.3 Technical Debt Policy

- Technical debt must be recorded in `docs/TECHNICAL_DEBT.md`.
- Each entry must include: description, impact, estimated cost-to-fix, and priority.
- Zero tolerance for undocumented shortcuts.

---

## 3. CODING STANDARDS

### 3.1 Formatting

| Rule | Value |
|------|-------|
| Line length | 80 characters maximum |
| Indentation | 2 spaces (Dart default) |
| Trailing commas | Required for all multi-line parameter lists |
| Blank lines between members | 1 blank line |
| Blank lines between top-level declarations | 2 blank lines |
| File ends with | Single newline |

### 3.2 Imports

Order imports in this exact sequence, separated by blank lines:

```
1. dart: imports
2. package:flutter/ imports
3. package:third_party/ imports
4. package:water_management/ imports
5. Relative imports (PROHIBITED — always use package imports)
```

### 3.3 Measurable Limits

| Metric | Maximum |
|--------|---------|
| File length | 300 lines |
| Class length | 200 lines |
| Method/function length | 30 lines |
| Widget build() method | 50 lines |
| Nesting depth | 4 levels |
| Function parameters | 5 (use object for more) |
| Constructor parameters | 7 (use object for more) |
| Cyclomatic complexity per method | 10 |

---

## 4. CLEAN CODE PRINCIPLES

### 4.1 Functions

- Every function does exactly ONE thing.
- Function names describe WHAT it does, not HOW.
- No side effects beyond the stated purpose.
- Return values, don't modify in place.

### 4.2 Variables

- Names must be self-documenting. No abbreviations except: `id`, `url`, `db`, `ui`.
- Boolean variables/methods start with: `is`, `has`, `can`, `should`, `was`.
- Avoid generic names: `data`, `info`, `temp`, `result`, `value`, `item`.

### 4.3 Classes

- One class per file (exception: private helper classes used only by the main class).
- Classes under 200 lines. If larger, decompose.
- No God objects. No utility-dump classes.

### 4.4 Dead Code

- Zero tolerance. No commented-out code in version control.
- If code might be needed later, it exists in git history.

---

## 5. SOLID RULES

### S — Single Responsibility Principle

- Every class has one reason to change.
- Controllers manage state only.
- Use cases contain business logic only.
- Repositories handle data access only.
- Widgets render UI only.

### O — Open/Closed Principle

- Classes are open for extension, closed for modification.
- Use abstract classes and interfaces for extensibility.
- New functionality = new class implementing existing contract.

### L — Liskov Substitution Principle

- Subtypes must be substitutable for their base types.
- Never override a method to throw `UnimplementedError`.

### I — Interface Segregation Principle

- Prefer many small, focused interfaces over one large interface.
- Clients should not depend on methods they do not use.
- Repository interfaces are split per aggregate root.

### D — Dependency Inversion Principle

- High-level modules depend on abstractions, not implementations.
- Domain layer NEVER imports from data or presentation layers.
- All dependencies point INWARD in the architecture diagram.

---

## 6. ARCHITECTURE PRINCIPLES

### 6.1 Clean Architecture Layers

```
┌─────────────────────────────────────────────┐
│              PRESENTATION                    │
│  (Pages, Widgets, Controllers, Bindings)     │
├─────────────────────────────────────────────┤
│              APPLICATION                     │
│  (Use Cases, DTOs, Mappers)                  │
├─────────────────────────────────────────────┤
│              DOMAIN                          │
│  (Entities, Repository Interfaces, Events)   │
├─────────────────────────────────────────────┤
│              DATA                            │
│  (Repositories, Data Sources, Models)        │
└─────────────────────────────────────────────┘
```

### 6.2 Dependency Rule

Dependencies flow INWARD only:

```
Presentation → Application → Domain ← Data
```

- Domain has ZERO external dependencies.
- Data implements Domain interfaces.
- Presentation depends on Application and Domain.
- Never skip layers.

### 6.3 Feature-First Organization

Every feature is a self-contained module:

```
features/
  customer/
    domain/
    data/
    application/
    presentation/
```

Cross-feature communication happens through the application layer or shared domain events. NEVER import directly between feature presentation layers.

---

## 7. NAMING CONVENTIONS

### 7.1 General Rules

| Element | Convention | Example |
|---------|-----------|---------|
| Files | `snake_case` | `customer_repository.dart` |
| Classes | `PascalCase` | `CustomerRepository` |
| Variables | `camelCase` | `customerName` |
| Constants | `camelCase` | `defaultPageSize` |
| Enums | `PascalCase` name, `camelCase` values | `PaymentStatus.pending` |
| Private members | Prefix with `_` | `_isLoading` |
| Type parameters | Single uppercase letter or descriptive | `T`, `Entity` |

### 7.2 Naming Precision

- Repository: `CustomerRepository`, not `CustomerRepo`
- Use case: `GetCustomerById`, not `GetCustomer`
- Entity: `Customer`, not `CustomerModel` (models are in data layer)
- Model: `CustomerModel`, not `CustomerData`
- Event: `CustomerCreated`, not `NewCustomer`

---

## 8. FOLDER NAMING RULES

- Always `snake_case`.
- Always singular for layer names: `domain/`, not `domains/`.
- Always plural for collection folders: `entities/`, `models/`, `pages/`.
- No abbreviations: `presentation/`, not `pres/`.
- No redundant prefixes: inside `features/customer/`, the folder is `domain/`, not `customer_domain/`.
- Maximum nesting depth: 5 levels from `lib/`.

---

## 9. FILE NAMING RULES

- Always `snake_case.dart`.
- Name reflects the primary class/function inside.
- One public class per file.
- Suffix indicates role:

| Role | Suffix | Example |
|------|--------|---------|
| Entity | (none) | `customer.dart` |
| Model | `_model` | `customer_model.dart` |
| Repository interface | `_repository` | `customer_repository.dart` |
| Repository implementation | `_repository_impl` | `customer_repository_impl.dart` |
| Use case | (verb phrase) | `get_customer_by_id.dart` |
| Controller | `_controller` | `customer_controller.dart` |
| Binding | `_binding` | `customer_binding.dart` |
| Page | `_page` | `customer_detail_page.dart` |
| Widget | `_widget` | `customer_card_widget.dart` |
| Service | `_service` | `notification_service.dart` |
| Data source | `_data_source` | `customer_local_data_source.dart` |

---

## 10. CLASS NAMING RULES

- Abstract classes: descriptive noun. `CustomerRepository`, not `ICustomerRepository` or `AbstractCustomerRepository`.
- Implementation classes: add `Impl` suffix. `CustomerRepositoryImpl`.
- Use cases: verb phrase. `GetCustomerById`, `CreateInvoice`, `RecordPayment`.
- Controllers: `{Feature}Controller`. `CustomerController`.
- Bindings: `{Feature}Binding`. `CustomerBinding`.
- Failures: descriptive noun + `Failure`. `ServerFailure`, `ValidationFailure`.
- Events: past-tense verb phrase. `CustomerCreated`, `PaymentRecorded`.

---

## 11. WIDGET NAMING RULES

- Pages: `{Feature}{Action}Page`. `CustomerDetailPage`, `ReadingCreatePage`.
- Reusable widgets: `{Descriptor}Widget`. `CustomerCardWidget`, `BalanceBadgeWidget`.
- Dialogs: `{Action}Dialog`. `ConfirmDeleteDialog`.
- Bottom sheets: `{Action}BottomSheet`. `FilterOptionsBottomSheet`.
- All widgets must:
  - Use `const` constructors where possible.
  - Accept a `Key` parameter.
  - Be stateless unless local state is required.
  - Extract `build()` sub-trees > 50 lines into private methods or child widgets.

---

## 12. FEATURE RULES

### 12.1 Feature Structure

Every feature must contain these layers:

```
features/{feature_name}/
├── domain/
│   ├── entities/
│   ├── repositories/       # Abstract interfaces only
│   └── events/             # Domain events
├── data/
│   ├── models/
│   ├── data_sources/
│   │   ├── {feature}_local_data_source.dart
│   │   └── {feature}_remote_data_source.dart
│   └── repositories/       # Implementations
├── application/
│   └── usecases/
└── presentation/
    ├── controllers/
    ├── bindings/
    ├── pages/
    └── widgets/
```

### 12.2 Feature Independence

- Features must NOT directly import from other features' presentation layer.
- Shared domain entities go in `core/shared/entities/`.
- Cross-feature logic goes through use cases.
- A feature CAN depend on `core/` but NEVER on another feature's data layer.

### 12.3 Feature Lifecycle

1. Define domain entities and repository interface.
2. Create use cases.
3. Implement data layer.
4. Build presentation layer.
5. Register routes and bindings.

---

## 13. DEPENDENCY INJECTION RULES

- Use GetX (`Get.put`, `Get.lazyPut`, `Get.find`) for dependency injection.
- Registration happens in `Binding` classes, NEVER inside widgets or controllers.
- Use `fenix: true` for dependencies that must survive page disposal.
- Feature-level bindings are registered in `GetPage` declarations.
- Global dependencies (network, database, logger) are registered in `InjectionContainer`.

**Binding structure:**

```dart
class CustomerBinding extends Bindings {
  @override
  void dependencies() {
    // Data sources
    Get.lazyPut<CustomerLocalDataSource>(() => CustomerLocalDataSourceImpl(...));
    Get.lazyPut<CustomerRemoteDataSource>(() => CustomerRemoteDataSourceImpl(...));
    // Repository
    Get.lazyPut<CustomerRepository>(() => CustomerRepositoryImpl(...));
    // Use cases
    Get.lazyPut(() => GetCustomerById(Get.find()));
    // Controller
    Get.lazyPut(() => CustomerController(...));
  }
}
```

---

## 14. ROUTING RULES

- All route names defined in `app/routes/app_routes.dart` as static constants.
- All pages registered in `app/routes/app_pages.dart`.
- Route names use path-style: `/customers`, `/customers/detail`, `/customers/create`.
- Every page has a corresponding `Binding`.
- Use `Get.toNamed()` for navigation. Never use `Get.to()` with widget references.
- Pass arguments via `Get.arguments` or route parameters, never through constructors during navigation.

---

## 15. LOCALIZATION RULES

- All user-visible strings MUST go through the localization system.
- Zero hardcoded strings in widgets. Exception: technical logs.
- Use Flutter's ARB-based localization (`flutter_localizations` + `gen_l10n`).
- ARB files live in `lib/l10n/`.
- Default locale: Arabic (`ar`). Fallback locale: English (`en`).
- Placeholders use ICU message syntax.
- Every new string requires both `app_ar.arb` and `app_en.arb` entries.
- Key naming: `{feature}_{element}_{descriptor}`. Example: `customer_label_name`, `payment_button_submit`.

---

## 16. STATE MANAGEMENT RULES

- Use GetX reactive state management (`Rx` types and `Obx` widgets).
- State lives in `GetxController` subclasses in the `controllers/` folder.
- Controllers must:
  - Not contain business logic (delegate to use cases).
  - Not directly access data sources (delegate to repositories via use cases).
  - Expose observables (`Rx` types) for the UI to react to.
  - Override `onInit()` for initialization, `onClose()` for cleanup.
- UI binds to state via `Obx(() => ...)` or `GetBuilder`.
- `Obx` for reactive, `GetBuilder` for non-reactive performance-critical lists.
- Never call `setState()`. This is not a StatefulWidget project.

---

## 17. REPOSITORY RULES

- Repository interfaces live in `domain/repositories/`.
- Repository implementations live in `data/repositories/`.
- Every repository method returns `Future<Either<Failure, T>>`.
- Repositories coordinate between local and remote data sources.
- Repositories catch exceptions from data sources and convert to `Failure` objects.
- Repository implementations decide the data source based on connectivity.
- Offline-first: always write to local first, then sync to remote.

```dart
// Domain layer (interface)
abstract class CustomerRepository {
  Future<Either<Failure, Customer>> getById(String id);
  Future<Either<Failure, List<Customer>>> search(String query);
  Future<Either<Failure, Unit>> create(Customer customer);
}
```

---

## 18. DOMAIN LAYER RULES

- Domain entities are pure Dart classes. No Flutter imports. No third-party imports.
- Entities use `Equatable` for value equality.
- Entities are immutable. Use `copyWith()` for modifications.
- Business rules live in entities or use cases, NEVER in controllers or widgets.
- Domain events are recorded for every state change.
- Use cases take a single `Params` object and return `Either<Failure, T>`.
- Domain knows nothing about persistence, UI, or framework.

---

## 19. UI RULES

- Mobile-first design. All layouts must work on screens ≥ 320px wide.
- RTL-first. All layouts must support Arabic right-to-left rendering.
- Maximum 3 taps to reach any daily operation.
- Use `const` constructors everywhere possible.
- Extract reusable widgets to `shared/widgets/`.
- Avoid deep widget nesting: max 4 levels. Use builder methods.
- All interactive elements must have:
  - Loading states
  - Error states
  - Empty states
  - Success states
- No business logic in widgets. Widgets call controller methods only.

---

## 20. DESIGN SYSTEM RULES

- All colors defined in `core/theme/app_colors.dart`.
- All text styles defined in `core/theme/app_text_styles.dart`.
- All spacing/sizing defined in `core/theme/app_spacing.dart`.
- No magic numbers in widgets. Use design tokens.
- Dark mode support from day one.
- Custom widgets wrap Material widgets. Never use raw Material widgets with inline styling.
- Icon set: Material Icons only. No mixing icon sets.

---

## 21. COMMENT RULES

### What to Comment

- **Public APIs:** Every public class, method, and property gets a `///` doc comment.
- **Why, not what:** Explain business reasoning, not code mechanics.
- **Complex algorithms:** Step-by-step explanation when logic is non-obvious.
- **TODOs:** Format: `// TODO(author): Description — ticket#`

### What NOT to Comment

- Obvious code. `// Increment counter` above `counter++` is noise.
- Commented-out code. Delete it. Git remembers.
- Journal comments. Git log handles history.

### Format

```dart
/// Retrieves a customer by their unique customer number.
///
/// Returns [Left(Failure)] if the customer is not found or if
/// a network error occurs.
///
/// The method checks local cache first, then falls back to
/// the remote API if the device is online.
Future<Either<Failure, Customer>> getByNumber(String customerNumber);
```

---

## 22. DOCUMENTATION RULES

- Every feature must have a `README.md` in its root explaining purpose, dependencies, and usage.
- Architecture decisions go in `docs/ADR/` numbered sequentially.
- API contracts go in `docs/API/`.
- `CHANGELOG.md` updated with every release.
- `docs/TECHNICAL_DEBT.md` tracks known shortcuts.
- All documentation is Markdown. No Word, no PDF, no HTML.

---

## 23. GIT COMMIT RULES

### Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types

| Type | Usage |
|------|-------|
| `feat` | New feature |
| `fix` | Bug fix |
| `refactor` | Code change that neither fixes nor adds |
| `docs` | Documentation only |
| `style` | Formatting, no code change |
| `test` | Adding/fixing tests |
| `chore` | Build, CI, deps, config |
| `perf` | Performance improvement |

### Rules

- Subject line: max 72 characters. Imperative mood. No period at end.
- Body: explain WHAT and WHY, not HOW.
- One logical change per commit. Never mix refactoring and features.
- Reference issue/ticket number in footer: `Refs: #123`.

### Examples

```
feat(customer): add customer search by phone number

Implemented partial phone number matching using trigram
similarity. This supports the fast-search requirement
for field workers who may only know partial numbers.

Refs: #45
```

---

## 24. BRANCH STRATEGY

### Branches

| Branch | Purpose | Merges To |
|--------|---------|-----------|
| `main` | Production-ready code | — |
| `develop` | Integration branch | `main` |
| `feature/{ticket}-{description}` | Feature work | `develop` |
| `fix/{ticket}-{description}` | Bug fixes | `develop` |
| `hotfix/{ticket}-{description}` | Critical production fixes | `main` + `develop` |
| `release/{version}` | Release preparation | `main` + `develop` |

### Rules

- `main` is always deployable.
- `develop` is always buildable.
- Feature branches live max 5 days. Break large features into sub-tasks.
- Rebase feature branches on `develop` before PR. No merge commits in feature branches.
- Delete branches after merge.

---

## 25. PULL REQUEST RULES

### Before Creating PR

- [ ] All tests pass locally.
- [ ] `flutter analyze` returns zero issues.
- [ ] Code follows this constitution.
- [ ] No commented-out code.
- [ ] No `print()` statements.
- [ ] Commit history is clean (squash if needed).

### PR Format

```
## Summary
Brief description of the change.

## Type
- [ ] Feature
- [ ] Fix
- [ ] Refactor
- [ ] Docs

## Changes
- File 1: what changed
- File 2: what changed

## Testing
How was this tested?

## Screenshots
(If UI changes)

## Checklist
- [ ] Self-reviewed
- [ ] Documented
- [ ] Tested
- [ ] No breaking changes
```

### Rules

- Max 400 lines of change per PR. If larger, split.
- At least 1 approving review required.
- Author must not merge their own PR.
- CI must pass before merge.

---

## 26. CODE REVIEW CHECKLIST

**Reviewer must check:**

- [ ] Code compiles without warnings.
- [ ] Architecture layers are respected (no layer violations).
- [ ] Naming follows conventions.
- [ ] No hardcoded strings (use localization).
- [ ] No magic numbers (use constants).
- [ ] Error handling is complete (no missing catch blocks, no naked exceptions).
- [ ] New public APIs have doc comments.
- [ ] No duplicated logic.
- [ ] No unnecessary dependencies added.
- [ ] File/class/method size limits are respected.
- [ ] Offline scenario is handled if applicable.
- [ ] RTL layout is correct.
- [ ] Event logging is included for auditable actions.
- [ ] No `print()` statements (use `AppLogger`).
- [ ] Tests exist for business logic.

---

## 27. PERFORMANCE RULES

- Use `const` constructors everywhere possible.
- Use `ListView.builder` for lists > 20 items. Never `ListView(children: [...])`.
- Avoid `setState()` and `StatefulWidget`. Use GetX reactive state.
- Minimize rebuilds: use `Obx` around smallest possible widget subtree.
- Lazy-load heavy dependencies. Never initialize everything at startup.
- Paginate lists. Default page size: 20.
- Cache images and network responses.
- Database queries must use indexes. No full table scans on tables > 1000 rows.
- Profile before optimizing. No premature optimization.
- Animation frame budget: 16ms. Never block the UI thread.

---

## 28. SECURITY RULES

- Never store passwords in plain text. Hash with bcrypt (server-side).
- Authentication tokens stored in secure storage (`flutter_secure_storage`), never in `SharedPreferences`.
- No sensitive data in logs. Never log tokens, passwords, or PII.
- API keys never hardcoded. Use environment variables.
- Validate all input at the domain boundary.
- SQL injection prevention: always use parameterized queries (Drift handles this).
- HTTPS only for all API calls.
- Session timeout after 30 minutes of inactivity.
- Role-based access control enforced at the use case level, not the UI level.
- Sensitive screens require re-authentication.

---

## 29. LOGGING RULES

- Use `AppLogger` exclusively. Zero `print()` statements.
- Log levels:

| Level | Usage |
|-------|-------|
| `trace` | Very verbose debug info (disabled in production) |
| `debug` | Development-only information |
| `info` | Normal application events |
| `warning` | Recoverable issues |
| `error` | Errors requiring attention |
| `fatal` | Critical failures, app cannot continue |

- Log at boundaries: entering/exiting use cases, API calls, database operations.
- Never log sensitive data: tokens, passwords, customer financial data.
- Production logging: `info` and above only.
- Include context: `AppLogger.error('Failed to load customer', error, stackTrace)`.

---

## 30. ERROR HANDLING RULES

### Data Layer

- Throw typed exceptions: `ServerException`, `CacheException`, `NetworkException`.
- Never throw generic `Exception` or `Error`.

### Repository Layer

- Catch exceptions from data sources.
- Convert exceptions to `Failure` objects.
- Return `Either<Failure, T>`.
- Never let exceptions propagate beyond the repository.

### Application Layer

- Use cases receive `Either<Failure, T>` from repositories.
- Use cases may compose results but must not catch additional exceptions.

### Presentation Layer

- Controllers fold `Either` results into UI state.
- Show user-friendly error messages based on `Failure` type.
- Never show raw exception messages to users.
- Always provide a recovery action (retry, go back, contact support).

```
Exception (Data) → Failure (Repository) → UI State (Controller) → Message (Widget)
```

---

## 31. TESTING STRATEGY

### Test Pyramid

| Level | What | Coverage Target |
|-------|------|----------------|
| Unit | Entities, use cases, utilities | 90%+ |
| Integration | Repositories, data sources | 80%+ |
| Widget | Individual widgets | 70%+ |
| E2E | Critical user flows | Top 10 flows |

### Rules

- New use case = new test file.
- Test file mirrors source file path: `lib/features/customer/...` → `test/features/customer/...`.
- Use meaningful test names: `'should return CustomerNotFound failure when ID does not exist'`.
- Mock external dependencies. Never hit real APIs or databases in unit tests.
- Tests must be deterministic. No time-dependent or order-dependent tests.
- CI blocks merge if any test fails.

---

## 32. FUTURE SCALABILITY RULES

- Design for 50,000+ customers from day one.
- All list views must support pagination.
- Database schema must support partitioning by date for readings/invoices.
- API contracts must be versioned: `/api/v1/`, `/api/v2/`.
- Feature flags for gradual rollout of new features.
- Modular design allows individual features to be replaced without affecting others.
- Multi-tenant architecture must be possible without rewriting core.
- Consider eventual migration to microservices (backend).

---

## 33. BACKWARD COMPATIBILITY RULES

- Database migrations must be forward-only. Never delete columns; deprecate with default values.
- API changes must maintain previous version support for at least 2 release cycles.
- Changing a domain entity's structure requires a migration plan.
- Removing a public API requires:
  1. Deprecation notice in documentation.
  2. Mark as `@Deprecated` with removal version.
  3. Maintain for at least 1 major version.
  4. Remove in next major version with migration guide.
- Sync protocol changes must be backward-compatible with field devices running older versions.

---

## 34. EVENT-DRIVEN RULES

### Core Principle

Every significant action in the system produces an event.

### Events

| Entity | Events |
|--------|--------|
| Customer | `CustomerCreated`, `CustomerUpdated`, `CustomerDeactivated` |
| Meter | `MeterInstalled`, `MeterReplaced`, `MeterDeactivated` |
| Reading | `ReadingRecorded`, `ReadingCorrected` |
| Invoice | `InvoiceGenerated`, `InvoiceCancelled` |
| Payment | `PaymentRecorded`, `PaymentReversed` |
| Note | `NoteAdded`, `WarningIssued` |
| SMS | `SmsSent`, `SmsFailed` |
| Auth | `UserLoggedIn`, `UserLoggedOut`, `PermissionChanged` |

### Event Structure

Every event must include:

| Field | Type | Description |
|-------|------|-------------|
| `id` | `String` (UUID) | Unique event identifier |
| `type` | `String` | Event type name |
| `entityId` | `String` | ID of the affected entity |
| `entityType` | `String` | Type of entity |
| `customerId` | `String?` | Related customer (if applicable) |
| `performedBy` | `String` | User ID who performed the action |
| `timestamp` | `DateTime` | When the event occurred |
| `data` | `Map<String, dynamic>` | Event-specific payload |

### Rules

- Events are immutable. Once created, never modified.
- Events are the source of truth for the customer timeline.
- Events must be stored locally and synced to server.
- Events are ordered by timestamp.
- UI timeline renders events chronologically.

---

## 35. RULES FOR AI-GENERATED CODE

- AI-generated code is treated as a DRAFT. It must pass the same review process as human code.
- AI must never generate mock data, fake services, or placeholder implementations.
- AI must follow this constitution completely. Non-compliant code is rejected.
- AI must explain architectural decisions when asked.
- AI must stop and ask when requirements are ambiguous.
- AI must not auto-continue between phases. Wait for explicit human approval.
- All AI-generated code must be reviewed for:
  - Architecture compliance
  - Naming convention adherence
  - Security implications
  - Performance characteristics
  - Test coverage

---

## 36. RULES FOR FUTURE DEVELOPERS

1. **Read this document first.** Before writing a single line of code.
2. **Follow the existing patterns.** Consistency trumps personal preference.
3. **Ask when unsure.** The cost of asking is always less than the cost of fixing.
4. **Don't bypass architecture.** Shortcuts today become rewrites tomorrow.
5. **Document your decisions.** Write an ADR for any non-trivial choice.
6. **Think about the field worker.** They have limited connectivity, limited training, and no patience for errors.
7. **Think about the accountant.** Financial data must be 100% accurate, 100% auditable.
8. **Write tests.** If it's not tested, it's not done.
9. **Keep it simple.** The most elegant solution is the one that's easiest to understand.
10. **This system outlives all of us.** Code for the developer who will maintain it in 2036.

---

## AMENDMENT PROCESS

To modify this constitution:

1. Submit a proposal via Pull Request to `docs/ENGINEERING_CONSTITUTION.md`.
2. Include rationale for the change.
3. Requires approval from Lead Architect.
4. Update version number.
5. Notify all team members.

---

**Approved by:** Lead Software Architect  
**Version:** 1.0.0  
**Date:** 2026-07-03
