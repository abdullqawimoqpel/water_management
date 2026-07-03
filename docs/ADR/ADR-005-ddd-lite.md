# ADR-005: Domain-Driven Design Lite (DDD Lite)

**Status:** Accepted  
**Date:** 2026-07-03  
**Deciders:** Lead Software Architect

## Context

We need a design approach that:

- Keeps business logic organized and discoverable.
- Models real-world water utility operations accurately.
- Supports complex rules (immutable invoices, partial payments, balance carry-forward).
- Scales with growing business complexity over 10+ years.

Full DDD (with aggregates, value objects, domain services, bounded contexts, CQRS, event sourcing) is powerful but introduces significant complexity. We need a pragmatic subset.

## Decision

We adopt **DDD Lite** — a simplified subset of Domain-Driven Design that takes key tactical patterns without the full strategic overhead.

## What We Take from DDD

| Pattern | Usage |
|---------|-------|
| **Entities** | Objects with identity and lifecycle. `Customer`, `Invoice`, `Payment`. |
| **Value Objects** | Immutable objects defined by their attributes. `Address`, `MeterReading`, `MoneyAmount`. |
| **Repository interfaces** | Abstractions for data access, defined in the domain layer. |
| **Domain Events** | Record of every significant state change. Foundation for timeline and audit. |
| **Use Cases** | Application-level operations that orchestrate domain logic. |
| **Ubiquitous Language** | Code uses the same terms as the water utility business. "Reading", "Invoice", "Meter", not "Record", "Bill", "Device". |

## What We Do NOT Take from Full DDD

| Pattern | Reason for Omission |
|---------|-------------------|
| **Aggregates with root enforcement** | Over-engineering for a single-app context. Entities with clear ownership suffice. |
| **Bounded Contexts** | Single team, single codebase. Features serve as implicit boundaries. |
| **CQRS** | Read and write models are the same. No performance need for separation yet. |
| **Event Sourcing** | Events are logged for audit/timeline but are NOT the source of truth for state. State is stored directly. |
| **Domain Services** | Logic fits naturally in entities and use cases. No need for an additional layer. |
| **Specification Pattern** | Query logic in repositories is sufficient for current needs. |

## Rationale

### Why Lite and not Full DDD?

| Factor | Full DDD | DDD Lite |
|--------|----------|----------|
| Team size needed | 5+ experienced devs | 1-3 devs |
| Learning curve | Steep | Moderate |
| Boilerplate | High | Moderate |
| Business complexity | Very complex domains | Moderately complex |
| Migration difficulty | Hard to adopt incrementally | Easy to start, grow later |

This project has a **moderately complex domain** (billing, payments, readings) with a **small team**. DDD Lite gives us the organizational benefits without the overhead.

### Upgrade path

If business complexity increases (multi-tenant, complex tariff structures, regulatory reporting), we can:

1. Introduce formal aggregates around `Customer` root.
2. Add bounded contexts when team grows beyond 5.
3. Consider CQRS if read and write patterns diverge.

All of these are additive changes, not rewrites.

## Consequences

- Domain entities are pure Dart classes with business rules inside.
- Entities use value equality (via Equatable) for comparison.
- Domain events are recorded for every state change.
- Ubiquitous language is enforced in code, documentation, and conversations.
- No domain services layer — logic lives in entities and use cases.
