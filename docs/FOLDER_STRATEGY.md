# FOLDER STRATEGY
## Water Management ERP System

**Version:** 1.0.0  
**Date:** 2026-07-03

---

## DESIGN PRINCIPLES

1. **Feature-first:** Business modules are the top-level organizational unit.
2. **Layer-second:** Within each feature, code is separated by architectural layer.
3. **Predictability:** Any developer should predict a file's location from its name and role.
4. **Isolation:** Features are self-contained. Cross-feature dependencies flow through `core/`.
5. **Scalability:** Adding a new feature is additive — no existing folders are modified.

---

## COMPLETE DIRECTORY ARCHITECTURE

```
water_management/
│
├── lib/
│   ├── main.dart                              # Application entry point
│   │
│   ├── app/                                   # Application shell
│   │   ├── app.dart                           # Root widget (GetMaterialApp)
│   │   ├── di/
│   │   │   └── injection_container.dart       # Global dependency registration
│   │   └── routes/
│   │       ├── app_routes.dart                # Route name constants
│   │       └── app_pages.dart                 # GetPage registry
│   │
│   ├── core/                                  # Shared infrastructure
│   │   ├── config/
│   │   │   ├── env_config.dart                # Environment settings
│   │   │   └── app_config.dart                # Runtime configuration
│   │   │
│   │   ├── constants/
│   │   │   ├── app_constants.dart             # Application-wide constants
│   │   │   └── api_constants.dart             # API endpoint paths
│   │   │
│   │   ├── error/
│   │   │   ├── failures.dart                  # Sealed failure types
│   │   │   └── exceptions.dart                # Data-layer exceptions
│   │   │
│   │   ├── network/
│   │   │   ├── network_info.dart              # Connectivity abstraction
│   │   │   ├── api_client.dart                # HTTP client wrapper (Phase 01)
│   │   │   └── interceptors/                  # Request/response interceptors
│   │   │       ├── auth_interceptor.dart
│   │   │       └── logging_interceptor.dart
│   │   │
│   │   ├── database/                          # Local database (Phase 01)
│   │   │   ├── app_database.dart              # Drift database definition
│   │   │   ├── tables/                        # Table definitions
│   │   │   └── daos/                          # Data access objects
│   │   │
│   │   ├── usecases/
│   │   │   └── usecase.dart                   # Abstract use case contract
│   │   │
│   │   ├── events/
│   │   │   ├── domain_event.dart              # Base event class
│   │   │   └── event_bus.dart                 # Event distribution
│   │   │
│   │   ├── sync/                              # Offline sync engine (Phase 01)
│   │   │   ├── sync_manager.dart              # Sync orchestrator
│   │   │   ├── sync_queue.dart                # Outbound queue
│   │   │   └── conflict_resolver.dart         # Conflict resolution
│   │   │
│   │   ├── theme/                             # Design system (Phase 02)
│   │   │   ├── app_colors.dart
│   │   │   ├── app_text_styles.dart
│   │   │   ├── app_spacing.dart
│   │   │   ├── app_theme.dart
│   │   │   └── app_shadows.dart
│   │   │
│   │   ├── extensions/
│   │   │   ├── string_extensions.dart
│   │   │   ├── datetime_extensions.dart
│   │   │   └── context_extensions.dart
│   │   │
│   │   ├── utils/
│   │   │   ├── logger.dart                    # Centralized logging
│   │   │   ├── date_utils.dart                # Date formatting
│   │   │   ├── validators.dart                # Input validation
│   │   │   └── formatters.dart                # Number/currency formatting
│   │   │
│   │   └── shared/
│   │       ├── entities/                      # Cross-feature domain entities
│   │       │   └── audit_entry.dart
│   │       ├── widgets/                       # Cross-feature UI components
│   │       │   ├── loading_indicator.dart
│   │       │   ├── error_view.dart
│   │       │   ├── empty_state.dart
│   │       │   └── search_field.dart
│   │       └── models/                        # Cross-feature data models
│   │           └── pagination.dart
│   │
│   ├── features/                              # Business feature modules
│   │   │
│   │   ├── auth/                              # Phase 03
│   │   │   ├── domain/
│   │   │   │   ├── entities/
│   │   │   │   │   └── user.dart
│   │   │   │   └── repositories/
│   │   │   │       └── auth_repository.dart
│   │   │   ├── data/
│   │   │   │   ├── models/
│   │   │   │   ├── data_sources/
│   │   │   │   └── repositories/
│   │   │   ├── application/
│   │   │   │   └── usecases/
│   │   │   └── presentation/
│   │   │       ├── controllers/
│   │   │       ├── bindings/
│   │   │       ├── pages/
│   │   │       └── widgets/
│   │   │
│   │   ├── customer/                          # Phase 04
│   │   │   ├── domain/
│   │   │   │   ├── entities/
│   │   │   │   ├── repositories/
│   │   │   │   └── events/
│   │   │   ├── data/
│   │   │   ├── application/
│   │   │   └── presentation/
│   │   │
│   │   ├── reading/                           # Phase 05
│   │   ├── billing/                           # Phase 06
│   │   ├── payment/                           # Phase 07
│   │   ├── timeline/                          # Phase 08
│   │   ├── notes/                             # Phase 09
│   │   ├── notification/                      # Phase 10
│   │   ├── reports/                           # Phase 11
│   │   ├── settings/                          # Phase 12
│   │   └── admin/                             # Phase 13
│   │
│   └── l10n/                                  # Localization
│       ├── app_en.arb
│       └── app_ar.arb
│
├── test/                                      # Test mirror of lib/
│   ├── core/
│   ├── features/
│   └── helpers/                               # Test utilities
│       ├── test_helpers.dart
│       └── mock_data.dart
│
├── docs/                                      # Engineering documentation
│   ├── ADR/                                   # Architecture Decision Records
│   ├── API/                                   # API contracts
│   ├── CODING_STANDARDS.md
│   ├── FOLDER_STRATEGY.md
│   ├── DEPENDENCY_STRATEGY.md
│   ├── ROADMAP.md
│   ├── RISK_ANALYSIS.md
│   ├── ACCEPTANCE_CHECKLIST.md
│   └── TECHNICAL_DEBT.md
│
├── assets/                                    # Static assets
│   ├── images/
│   ├── icons/
│   └── fonts/
│
├── ENGINEERING_CONSTITUTION.md                # Engineering law
├── CHANGELOG.md                               # Release history
├── README.md                                  # Project overview
├── pubspec.yaml                               # Dependencies
├── analysis_options.yaml                      # Lint rules
└── l10n.yaml                                  # Localization config
```

---

## FOLDER JUSTIFICATION

### `lib/app/`

**Purpose:** Application shell — bootstrapping, routing, and global DI.

**Why it exists:** Separates infrastructure glue (routing, DI, theming) from business logic. This is the "skeleton" of the app. It orchestrates features but contains zero business logic.

**What goes here:**
- Root widget (`GetMaterialApp`)
- Route table
- Global binding registration

**What does NOT go here:**
- Business logic
- Feature-specific code
- UI components

---

### `lib/core/`

**Purpose:** Cross-cutting concerns shared by all features.

**Why it exists:** Prevents duplication of infrastructure code. Every feature needs error handling, network checking, logging, etc. Centralizing these ensures consistency and single-point maintenance.

**Subfolders:**

| Folder | Why |
|--------|-----|
| `config/` | Environment-specific settings (dev/staging/prod). Changes here affect the entire app. |
| `constants/` | Magic values centralized. Prevents scattered literals. |
| `error/` | Unified error taxonomy. Every feature speaks the same error language. |
| `network/` | HTTP client, interceptors, connectivity. Network is a cross-cutting concern. |
| `database/` | Local database definition. Shared by all features for offline storage. |
| `usecases/` | Abstract contracts. The `UseCase` base class that every feature implements. |
| `events/` | Event infrastructure. Domain events flow through a shared event bus. |
| `sync/` | Offline sync engine. Shared by all features that need offline support. |
| `theme/` | Design tokens. One source of truth for colors, typography, spacing. |
| `extensions/` | Dart language extensions. Utility methods on built-in types. |
| `utils/` | Utility classes that don't fit elsewhere. Logger, validators, formatters. |
| `shared/` | Cross-feature entities, widgets, and models reused across features. |

---

### `lib/features/`

**Purpose:** Business feature modules, each fully self-contained.

**Why it exists:** Feature-first organization means:
- **Discoverability:** Finding code for "customer" means going to `features/customer/`.
- **Isolation:** Deleting a feature requires removing one folder.
- **Onboarding:** New developers understand scope immediately.
- **Scaling:** New features = new folder. Zero modification of existing code.

**Internal structure per feature:**

| Subfolder | Layer | Contains |
|-----------|-------|----------|
| `domain/entities/` | Domain | Pure Dart objects. Business rules. |
| `domain/repositories/` | Domain | Abstract interfaces only. |
| `domain/events/` | Domain | Domain events for this feature. |
| `data/models/` | Data | Database/API models with serialization. |
| `data/data_sources/` | Data | Local and remote data access. |
| `data/repositories/` | Data | Interface implementations. |
| `application/usecases/` | Application | Business operations. |
| `presentation/controllers/` | Presentation | GetX controllers. |
| `presentation/bindings/` | Presentation | DI registration. |
| `presentation/pages/` | Presentation | Full-screen UI. |
| `presentation/widgets/` | Presentation | Feature-specific components. |

---

### `lib/l10n/`

**Purpose:** Localization resource files (ARB).

**Why it exists:** Flutter's localization system expects ARB files in a dedicated directory. Keeping localization separate from features allows translators to work without touching code.

---

### `test/`

**Purpose:** Mirrors `lib/` structure for tests.

**Why it exists:** Convention-based test discovery. `lib/features/customer/domain/...` → `test/features/customer/domain/...`. The `helpers/` subfolder contains shared test utilities and mock factories.

---

### `docs/`

**Purpose:** Engineering documentation.

**Why it exists:** Code alone is not sufficient for a 10-year project. Decisions, tradeoffs, and context must be preserved. This folder is the institutional memory of the project.

---

### `assets/`

**Purpose:** Static resources (images, icons, fonts).

**Why it exists:** Separates binary assets from code. Standard Flutter convention.

---

## RULES

1. **Never create folders above these root groupings.** All new code fits into `app/`, `core/`, `features/`, or `l10n/`.
2. **Never nest beyond 5 levels from `lib/`.** If you need to go deeper, your abstraction is wrong.
3. **Never create "util" or "helper" folders inside features.** Put shared utilities in `core/utils/` and feature-specific logic in the appropriate layer.
4. **Every new feature gets the full 4-layer structure** even if one layer is initially empty. Consistency matters more than minimalism.
