# DEPENDENCY STRATEGY
## Water Management ERP System

**Version:** 1.0.0  
**Date:** 2026-07-03

---

## PRINCIPLES

1. **Minimal dependencies.** Every package adds maintenance burden and supply-chain risk.
2. **Mature, maintained packages only.** Minimum 90% pub.dev score, active GitHub within 6 months.
3. **No overlapping functionality.** One package per concern.
4. **Abstraction over direct usage.** Wrap third-party packages behind app-owned interfaces so they can be replaced without rewriting business logic.
5. **Lock versions.** Use caret syntax (`^`) to allow patch updates but prevent breaking changes.

---

## DEPENDENCY CATALOG

### Phase 00 — Foundation (Current)

| Package | Version | Purpose | Why This Package |
|---------|---------|---------|-----------------|
| `get` | ^4.6.6 | State management, routing, DI | Single package for 3 concerns. Reduces dependency count. Lightweight. Battle-tested in large Flutter projects. |
| `dartz` | ^0.10.1 | Functional programming (`Either`, `Option`) | Enables type-safe error handling without exceptions. `Either<Failure, T>` is the backbone of our repository pattern. |
| `equatable` | ^2.0.5 | Value equality for entities | Eliminates boilerplate `==` and `hashCode` overrides. Critical for entity comparison and state diffing. |
| `intl` | ^0.19.0 | Date formatting, number formatting, i18n | Official Dart i18n package. Required by `flutter_localizations`. |
| `flutter_localizations` | SDK | RTL support, Arabic locale delegates | Flutter SDK built-in. Required for Arabic RTL rendering. |
| `connectivity_plus` | ^6.0.5 | Network connectivity detection | First-party Flutter Community package. Detects WiFi/mobile/ethernet status for offline-first logic. |
| `logger` | ^2.4.0 | Structured logging | Pretty-printed, leveled logging. Small footprint. No external dependencies. |
| `uuid` | ^4.5.1 | UUID generation | Generates unique IDs for domain events, entities. RFC 4122 compliant. |

### Phase 01 — Architecture Setup (Planned)

| Package | Version | Purpose | Why This Package |
|---------|---------|---------|-----------------|
| `drift` | ^2.x | Local SQLite database | Type-safe SQLite. Compile-time query verification. Migration support. Offline-first foundation. |
| `sqlite3_flutter_libs` | ^0.5.x | SQLite native binaries | Required runtime dependency for Drift on mobile/desktop. |
| `dio` | ^5.x | HTTP client | Interceptor pipeline, request cancellation, retry logic. Superior to `http` for enterprise use. |
| `json_annotation` | ^4.x | JSON serialization annotations | Code-gen annotations for data models. Zero runtime overhead. |
| `json_serializable` | ^6.x | JSON code generation (dev) | Generates `fromJson`/`toJson` methods. Eliminates manual serialization. |
| `build_runner` | ^2.x | Code generation runner (dev) | Required for json_serializable and drift codegen. |

### Phase 02 — Design System (Planned)

| Package | Version | Purpose | Why This Package |
|---------|---------|---------|-----------------|
| `google_fonts` | ^6.x | Typography | Dynamic font loading. Supports Arabic typefaces. |
| `flutter_svg` | ^2.x | SVG rendering | Scalable vector icons and illustrations. |
| `shimmer` | ^3.x | Loading skeletons | Premium loading states. Better UX than spinners. |

### Phase 03 — Authentication (Planned)

| Package | Version | Purpose | Why This Package |
|---------|---------|---------|-----------------|
| `flutter_secure_storage` | ^9.x | Secure token storage | Encrypts data using Keychain (iOS) and Keystore (Android). |
| `jwt_decoder` | ^2.x | JWT token parsing | Decode token claims for role extraction without server roundtrip. |

### Phase 05+ — Feature-Specific (Planned)

| Package | Version | Purpose | Why This Package |
|---------|---------|---------|-----------------|
| `fl_chart` | ^0.x | Charts for reports | Highly customizable. Active maintenance. |
| `pdf` | ^3.x | PDF invoice generation | Generates PDF documents client-side for offline invoicing. |
| `printing` | ^5.x | Print/share PDFs | Cross-platform printing and sharing. |
| `url_launcher` | ^6.x | SMS/phone integration | Opens SMS and phone apps for customer contact. |
| `path_provider` | ^2.x | File system paths | Required for local file storage of PDFs, exports. |

---

## PACKAGES EXPLICITLY REJECTED

| Package | Reason for Rejection |
|---------|---------------------|
| `provider` | GetX already handles DI. Adding Provider would create duplicate DI systems. |
| `bloc` / `flutter_bloc` | GetX already handles state management. Mixing patterns causes confusion. |
| `riverpod` | Same reason as Provider. One state management approach only. |
| `hive` | Drift provides better SQL query support, relations, and migration. Hive lacks relational capabilities. |
| `isar` | Similar to Hive. Drift's SQL foundation better fits ERP with complex queries. |
| `shared_preferences` | Insecure for tokens. Not suitable for structured data. Drift handles both concerns. |
| `http` | Lacks interceptors, retry logic, and cancellation. Dio is superior for enterprise. |
| `firebase_*` | Vendor lock-in. This system must be deployable on-premise. |
| `get_storage` | Unencrypted file storage. Not appropriate for sensitive or structured data. |
| `auto_route` | Redundant with GetX routing. Would fragment navigation patterns. |
| `freezed` | Adds significant code-gen complexity. Manual copyWith + equatable is sufficient and more transparent. |

---

## DEPENDENCY GOVERNANCE

### Adding a New Dependency

Before adding any package, answer:

1. **Is it necessary?** Can this be achieved with Dart/Flutter built-ins?
2. **Is it mature?** 90%+ pub.dev score? Active within 6 months? Null-safe?
3. **Is it unique?** Does it overlap with any existing package?
4. **What's the exit plan?** Can we replace it without rewriting business logic?
5. **What's the security surface?** Does it require dangerous permissions?

### Approval Process

1. Developer proposes in ADR format.
2. Lead Architect reviews.
3. If approved, add to this document with justification.
4. Wrap behind app-owned interface where possible.

### Audit Schedule

- Monthly: check for security advisories on all dependencies.
- Quarterly: run `flutter pub outdated` and plan updates.
- Annually: review full dependency list for necessity.
