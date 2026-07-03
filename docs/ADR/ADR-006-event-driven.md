# ADR-006: Event-Driven Architecture

**Status:** Accepted  
**Date:** 2026-07-03  
**Deciders:** Lead Software Architect

## Context

The system has two critical requirements:

1. **Customer Timeline:** Every action related to a customer must appear in a chronological timeline visible to operators.
2. **Audit Trail:** For financial and regulatory compliance, every state change must be traceable to a user and timestamp.

These requirements demand a mechanism to record and distribute knowledge of "things that happened in the system."

## Decision

We adopt an **event-driven approach** where every significant domain action produces a domain event.

Events are:
- Stored persistently (local database, synced to server).
- Used to render the customer timeline.
- Used to generate audit logs.
- Optionally used to trigger side effects (e.g., SMS after invoice generation).

## Rationale

### Why events and not just database queries?

| Approach | Timeline capability | Audit capability | Side effects |
|----------|-------------------|-----------------|-------------|
| Query current state | Cannot show what happened, only what IS. | No historical trail. | No trigger mechanism. |
| Change log (before/after) | Shows field changes but lacks semantic meaning. | Good for debugging, poor for business users. | Requires polling. |
| **Domain events** | Rich, semantic: "Invoice #4521 generated for 15,000 YER." | Complete: who, what, when, why. | Natural: event triggers handler. |

### Event anatomy

Every event contains:

```
{
  "id": "evt_uuid_v4",
  "type": "InvoiceGenerated",
  "entityType": "Invoice",
  "entityId": "inv_123",
  "customerId": "cust_456",
  "performedBy": "user_789",
  "timestamp": "2026-07-03T12:00:00Z",
  "data": {
    "invoiceNumber": "INV-2026-4521",
    "amount": 15000,
    "currency": "YER",
    "billingPeriod": "2026-06"
  }
}
```

### Event lifecycle

```
Action occurs → Domain event created → Stored locally → Rendered in timeline
                                    → Queued for sync → Synced to server
                                    → Side effects triggered (optional)
```

### Why NOT full event sourcing

Full event sourcing derives current state entirely from replaying events. We reject this because:

- It requires CQRS (separate read/write models) which is over-engineering for our needs.
- Financial auditors expect to see current state stored explicitly, not derived.
- Replaying thousands of events for a single customer would degrade read performance.

**Our approach:** State is stored directly. Events are a parallel record for audit and timeline. This gives us the audit benefits without the complexity overhead.

## Consequences

- Every feature that creates/modifies/deletes domain entities must produce events.
- Events are stored in a dedicated `timeline_events` table.
- The customer timeline page reads events filtered by `customerId`.
- Sync engine includes events in its upload/download cycle.
- Event handlers can trigger side effects (SMS, notifications) asynchronously.
