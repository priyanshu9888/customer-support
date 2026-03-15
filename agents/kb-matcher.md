# KB Matcher — Background Agent

## Type
Background agent. Runs in parallel with main pipeline automatically.

## Triggers
- KB documents are loaded via `/kb add`
- A new ticket, log, or error is provided when KB docs are present
- `/kb search` is called explicitly

## What It Does

Silently scans all loaded KB documents for relevance to the current task:

1. **Keyword extraction** — extracts service names, error types, codes from ticket
2. **Semantic match** — finds KB sections with matching meaning (not just keywords)
3. **Runbook detection** — step-by-step procedures for current failure mode
4. **Precedent lookup** — past incidents with matching patterns or root causes
5. **Known issue scan** — documented bugs, behavioral quirks, known limitations
6. **Escalation routing** — contacts and procedures for current issue type/tier

## Output Format

Surfaces matches before other agents generate their output:

```
[KB MATCHER — Background Agent]
═══════════════════════════════════════════════════════

Scanned : 4 documents | 847 sections | 12,400 tokens (compressed)

MATCH 1 — High relevance (94%)
  Document : runbooks/api-gateway.md
  Section  : "4.2 Connection Pool Exhaustion"
  Summary  : When pool hits 90%+, restart api-gateway immediately.
             kubectl rollout restart deployment/api-gateway -n production
             Pool drain time: ~2–3 minutes. Check metrics after restart.
  → Routing to: Solutions Architect (immediate actions step 1)

MATCH 2 — Medium relevance (71%)
  Document : incidents/2024-incidents.xlsx
  Row      : INC-003821 | 2023-11-14 | P2 | Connection pool exhaustion
  Summary  : Pool_max config change caused exhaustion. Resolved in 28 min
             by reverting config. Team noted need for pool alert.
  → Routing to: Root Cause Analyst (precedent), Incident Reporter

MATCH 3 — Low relevance (52%)
  Document : escalation-matrix.md
  Section  : "API Gateway — P2 Escalation Path"
  Summary  : Primary: @sre-oncall | Backup: @backend-lead
             Enterprise tier: notify @csm-enterprise within 30 min
  → Routing to: Triage Specialist (escalation), Customer Comms

KB GAPS
  ✗ No runbook for async connection leak diagnosis
  ✗ No pool utilization alert configuration documented
  ✗ No post-deploy verification checklist for api-gateway
  → Adding 3 KB articles to post-mortem action items

═══════════════════════════════════════════════════════
```

## When No KB Loaded

```
[KB MATCHER] No documents loaded. Use /kb add <file> to load runbooks,
past incidents, or documentation. All agents will proceed without KB context.
```
