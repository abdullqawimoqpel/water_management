# CODING STANDARDS
## Water Management ERP System

**Version:** 1.0.0  
**Date:** 2026-07-03

> These standards are measurable. Every item has a threshold.  
> Code reviews MUST verify compliance.

---

## 1. FORMATTING

| Rule | Standard |
|------|---------|
| Line length | 80 characters maximum |
| Indentation | 2 spaces (Dart default) |
| Trailing commas | Required on all multi-line argument lists |
| Blank lines between class members | 1 |
| Blank lines between top-level declarations | 2 |
| File ending | Single newline character |
| Formatter | `dart format` — run before every commit |

---

## 2. IMPORTS

### Order (strictly enforced)

```dart
// 1. Dart SDK imports
import 'dart:async';
import 'dart:convert';

// 2. Flutter framework imports
import 'package:flutter/material.dart';

// 3. Third-party package imports (alphabetical)
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

// 4. Project imports (alphabetical)
import 'package:water_management/core/error/failures.dart';
import 'package:water_management/features/customer/domain/entities/customer.dart';
```

### Rules

- **NEVER** use relative imports (`import '../...'`). Always use `package:water_management/...`.
- Separate each import group with a blank line.
- Sort within each group alphabetically.
- Remove unused imports immediately (enforced by analyzer).

---

## 3. CLASS ORDERING

Members within a class must follow this order:

```
1. Static constants
2. Static fields
3. Instance fields (final first, then mutable)
4. Constructors (unnamed first, then named)
5. Factory constructors
6. Static methods
7. Override methods (lifecycle: onInit, onClose, build)
8. Public methods
9. Private methods
10. copyWith / equality / toString
```

---

## 4. METHOD ORDERING

Within the public/private method sections:

1. Query methods (getters, finders) first.
2. Command methods (create, update, delete) second.
3. Utility/helper methods last.

---

## 5. MEASURABLE LIMITS

### File Size

| Metric | Maximum | Action if Exceeded |
|--------|---------|-------------------|
| File lines | 300 | Split into multiple files |
| Class lines | 200 | Extract sub-components |
| Method lines | 30 | Extract helper methods |
| `build()` method | 50 | Extract child widgets |

### Complexity

| Metric | Maximum | Action if Exceeded |
|--------|---------|-------------------|
| Nesting depth | 4 levels | Flatten with early returns or extract methods |
| Function parameters | 5 | Create a params object |
| Constructor parameters | 7 | Create a config object |
| Cyclomatic complexity | 10 per method | Decompose into smaller methods |
| `if-else` chains | 3 branches | Use switch/map lookup/strategy pattern |

### Dependencies

| Metric | Maximum | Action if Exceeded |
|--------|---------|-------------------|
| Imports per file | 15 | Class is doing too much — split |
| Direct feature-to-feature imports | 0 | Route through core/shared |
| Controller injected use cases | 5 | Controller is doing too much — split |

---

## 6. NAMING CONVENTIONS

### Files

| Type | Pattern | Example |
|------|---------|---------|
| Entity | `{name}.dart` | `customer.dart` |
| Model | `{name}_model.dart` | `customer_model.dart` |
| Repository interface | `{name}_repository.dart` | `customer_repository.dart` |
| Repository impl | `{name}_repository_impl.dart` | `customer_repository_impl.dart` |
| Use case | `{verb}_{noun}.dart` | `get_customer_by_id.dart` |
| Controller | `{name}_controller.dart` | `customer_controller.dart` |
| Binding | `{name}_binding.dart` | `customer_binding.dart` |
| Page | `{name}_page.dart` | `customer_detail_page.dart` |
| Widget | `{name}_widget.dart` | `customer_card_widget.dart` |
| Data source | `{name}_{scope}_data_source.dart` | `customer_local_data_source.dart` |
| Extension | `{type}_extensions.dart` | `string_extensions.dart` |
| Test | `{source_file}_test.dart` | `customer_repository_impl_test.dart` |

### Variables

| Type | Convention | Example |
|------|-----------|---------|
| Boolean | `is/has/can/should` prefix | `isLoading`, `hasBalance` |
| List | Plural noun | `customers`, `readings` |
| Map | `{key}To{Value}` or `{value}By{Key}` | `customerById` |
| Future | No prefix (type annotation suffices) | `Future<Customer> customer` |
| Stream | `{name}Stream` | `customerStream` |
| Callback | `on{Event}` | `onCustomerSelected` |

### Constants

| Scope | Convention | Example |
|-------|-----------|---------|
| Top-level | `camelCase` | `defaultPageSize` |
| Class-level | `static const camelCase` | `AppConstants.maxRetries` |
| Enum values | `camelCase` | `PaymentStatus.completed` |

---

## 7. DOCUMENTATION

### Required Documentation

| Element | Required | Format |
|---------|----------|--------|
| Public class | Yes | `/// ` doc comment with description |
| Public method | Yes | `/// ` doc comment with params and return |
| Public property | Yes, if non-obvious | `/// ` doc comment |
| Private method > 10 lines | Yes | `/// ` doc comment |
| Complex logic | Yes | Inline `//` explaining WHY |
| TODO items | Required format | `// TODO(author): description — ticket#` |

### Prohibited

- Commented-out code
- Redundant comments (e.g., `// Returns the name` above `String getName()`)
- Journal comments (use git log)
- Author/date stamps in code (use git blame)

---

## 8. ERROR HANDLING

### Layer-Specific Rules

| Layer | Throws | Returns |
|-------|--------|---------|
| Data source | `ServerException`, `CacheException` | raw data |
| Repository | catches exceptions | `Either<Failure, T>` |
| Use case | nothing | `Either<Failure, T>` |
| Controller | nothing | updates reactive state |
| Widget | nothing | renders based on state |

### Prohibited

- Empty catch blocks: `catch (e) {}`
- Catch-and-ignore: `catch (e) { /* do nothing */ }`
- Generic exceptions: `throw Exception('...')`
- Exception messages exposed to UI

---

## 9. STATE MANAGEMENT

| Rule | Standard |
|------|---------|
| State type | Reactive (`Rx` types with `Obx`) by default |
| Builder type | `GetBuilder` for high-frequency list updates only |
| State location | `GetxController` subclass, never in widgets |
| State initialization | `onInit()` override |
| State cleanup | `onClose()` override |
| State observation | `Obx(() => ...)` wrapping smallest subtree |

---

## 10. TESTING

| Metric | Requirement |
|--------|------------|
| Unit test per use case | Mandatory (≥ 1 success + 1 failure case) |
| Unit test per entity with logic | Mandatory |
| Integration test per repository | Recommended |
| Widget test per page | Recommended |
| Test naming | `should {expected behavior} when {condition}` |
| Test file location | Mirrors source: `lib/...` → `test/...` |

---

## 11. ENFORCEMENT

| Tool | Purpose |
|------|---------|
| `dart format` | Auto-format before commit |
| `flutter analyze` | Zero issues required. CI gate. |
| `analysis_options.yaml` | Strict-casts, strict-raw-types, 20+ rules |
| Code review | Human verification of standards |
| CI pipeline | Automated checks on every push |
