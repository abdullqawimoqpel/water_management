# ADR-004: GetX as State Management and DI Framework

**Status:** Accepted  
**Date:** 2026-07-03  
**Deciders:** Lead Software Architect

## Context

We need a state management solution that also handles:

- Dependency injection
- Routing/navigation
- Reactive state updates

We must choose ONE approach and use it consistently throughout the entire project.

## Decision

We adopt **GetX** for state management, dependency injection, and routing.

## Rationale

### Why GetX

| Criterion | GetX | BLoC | Riverpod |
|-----------|------|------|----------|
| Learning curve | Low | High | Medium |
| Boilerplate | Minimal | High (events, states, bloc) | Medium |
| Built-in DI | Yes | No (needs get_it) | Yes |
| Built-in routing | Yes | No (needs go_router) | No |
| Reactive state | Yes (`Rx` types) | Yes (streams) | Yes (providers) |
| Package count | 1 | 3+ | 2+ |
| Performance | Excellent | Good | Good |
| Testability | Good | Excellent | Good |

### Why not BLoC

BLoC is excellent for large teams with strict patterns but introduces significant boilerplate:

- Every state change requires an Event class, a State class, and handler methods.
- For 11 features × 5 operations average = 55 event classes, 55 state classes, 55 handlers.
- The ceremony-to-logic ratio is too high for a team of this size.

### Why not Riverpod

Riverpod is modern and well-designed but:

- Does not include routing. Would need a separate routing solution.
- Code generation version (`riverpod_generator`) adds build complexity.
- Provider scoping is powerful but adds cognitive overhead.

### GetX risks (mitigated)

| Risk | Mitigation |
|------|-----------|
| Over-reliance on GetX magic | Business logic lives in use cases, NOT controllers. GetX is only the delivery mechanism. |
| Global state leaks | Feature-scoped bindings with `GetPage`. Dependencies destroyed on page pop. |
| Testability concerns | Controllers tested by injecting mock use cases. No GetX coupling in domain/data layers. |
| Framework obsolescence | Domain and Data layers have zero GetX imports. Only Presentation depends on GetX. Replacing GetX means rewriting controllers and routes only. |

### Isolation guarantee

```
Domain layer:     0 GetX imports ✓
Data layer:       0 GetX imports ✓
Application layer: 0 GetX imports ✓
Presentation layer: GetX for controllers, routing, DI ✓
```

If GetX is deprecated in 5 years, we replace Presentation layer only. Business logic is untouched.

## Consequences

- All state management uses `GetxController` with `Rx` types.
- All DI uses `Get.lazyPut` / `Get.put` in `Binding` classes.
- All navigation uses `Get.toNamed()` with named routes.
- No mixing with Provider, BLoC, or other state management.

## Alternatives Considered

- **BLoC:** Too much boilerplate for team size.
- **Riverpod:** Missing built-in routing. Additional complexity.
- **Provider:** Deprecated in favor of Riverpod by its author.
- **setState + InheritedWidget:** Insufficient for complex state management.
