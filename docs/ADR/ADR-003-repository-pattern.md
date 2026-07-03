# ADR-003: Repository Pattern

**Status:** Accepted  
**Date:** 2026-07-03  
**Deciders:** Lead Software Architect

## Context

We need a pattern for abstracting data access so that:

- Business logic doesn't know where data comes from (API, database, cache).
- The offline-first requirement is handled transparently.
- Data sources can be swapped without affecting higher layers.
- Testing can use mock data sources.

## Decision

We adopt the **Repository Pattern** with:

- Abstract repository interfaces in the Domain layer.
- Concrete implementations in the Data layer.
- Implementations coordinate between local and remote data sources.

## Rationale

### Architecture

```
┌──────────────┐
│  Use Case     │  Depends on repository interface
│  (Application)│
└──────┬───────┘
       │ calls
       ▼
┌──────────────┐
│  Repository   │  Interface (Domain layer)
│  (Abstract)   │
└──────┬───────┘
       │ implemented by
       ▼
┌──────────────┐
│  Repository   │  Implementation (Data layer)
│  (Impl)       │
└──┬────────┬──┘
   │        │
   ▼        ▼
┌──────┐ ┌──────┐
│Local │ │Remote│  Data sources
│ DB   │ │ API  │
└──────┘ └──────┘
```

### Why Repository Pattern fits this project

| Requirement | How Repository Pattern satisfies it |
|-------------|-------------------------------------|
| Offline-first | Repository checks connectivity, reads from local if offline. |
| Data source flexibility | Swap local DB from SQLite to Hive without touching use cases. |
| Test isolation | Mock the repository interface. Zero database/API setup in tests. |
| Sync logic | Repository manages write-through to local, queue for remote. |
| Financial integrity | Repository enforces that invoices are append-only, never updated. |

### Data flow for offline-first

```
READ:
  if cached and fresh → return local
  if online → fetch remote, cache locally, return
  if offline → return local (may be stale)

WRITE:
  always write to local first
  if online → sync to remote immediately
  if offline → queue for sync when online
```

## Consequences

- Every data access goes through a repository. No direct data source calls from controllers.
- Repository interfaces return `Either<Failure, T>`. No exceptions escape the repository.
- Repository implementations receive data sources via constructor injection.
- Sync logic lives inside repository implementations, not in controllers.

## Alternatives Considered

- **Direct data source access from controllers:** No abstraction. Tight coupling.
- **Service layer pattern:** Similar but does not enforce the interface/implementation split.
- **DAO pattern alone:** Handles persistence but not coordination between local and remote.
