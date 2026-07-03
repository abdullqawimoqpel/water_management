# ADR-002: Clean Architecture

**Status:** Accepted  
**Date:** 2026-07-03  
**Deciders:** Lead Software Architect

## Context

We need a software architecture that:

- Survives 10+ years of evolution without rewriting core logic.
- Allows replacing Flutter UI with another framework without touching business logic.
- Allows replacing the database without touching business logic.
- Allows replacing the API client without touching business logic.
- Enables testing business logic in isolation.

## Decision

We adopt **Clean Architecture** with 4 layers: Presentation, Application, Domain, and Data.

## Rationale

### The Dependency Rule

```
Presentation → Application → Domain ← Data
```

The Domain layer has ZERO external dependencies. It is pure Dart. This means:

- Business rules can be tested without Flutter, without databases, without HTTP.
- The Domain layer is the most stable part of the system. It changes only when business rules change.
- All volatile concerns (UI frameworks, databases, APIs) depend on the Domain, not the other way around.

### Layer responsibilities

| Layer | Responsibility | Changes When |
|-------|---------------|-------------|
| **Domain** | Entities, repository interfaces, business rules | Business rules change |
| **Application** | Use cases (orchestration of domain logic) | Workflows change |
| **Data** | API clients, DB access, model serialization | Infrastructure changes |
| **Presentation** | UI rendering, user interaction | Design changes |

### Why this matters for a 10-year system

- **Database migration:** Moving from SQLite to PostgreSQL only changes the Data layer.
- **UI refresh:** Redesigning the UI only changes the Presentation layer.
- **API evolution:** Moving from REST to GraphQL only changes the Data layer.
- **Business rule change:** New billing formula only changes Domain/Application.

## Consequences

- Every feature must implement all 4 layers.
- Domain entities must NOT import Flutter or third-party packages.
- All data access goes through repository interfaces defined in Domain.
- Use cases are the single entry point for business operations.

## Alternatives Considered

- **MVC:** Too little separation. Controllers become God objects.
- **MVVM:** Better than MVC, but no explicit separation of data access from business logic.
- **Hexagonal:** Equivalent to Clean Architecture in spirit. We use Clean Architecture terminology as it's more widely documented in Flutter ecosystem.
