# /support — Full Support Pipeline

Runs the complete 5-agent support engineering pipeline on a ticket.

## Usage

```
/support <describe the issue>
/support severity=P1 product="API Gateway" <describe the issue>
/support <describe the issue>
---logs
[paste log lines here]
```

## What Runs

In sequence, with each result feeding the next:

1. **🗂  Triage Specialist** — severity, SLA, scope, escalation decision
2. **🔍 Log Investigator** — timeline, patterns, metrics, anomalies (if logs provided)
3. **📚 KB Engineer** — runbooks, precedents, gaps (if KB docs loaded)
4. **🧠 Root Cause Analyst** — causal chain, contributing factors, confidence
5. **🔧 Solutions Architect** — immediate actions with CLI commands, short+long-term fix
6. **📋 Incident Reporter** — full incident report with action items
7. **📣 Customer Comms** — customer message drafts for each incident stage

## Parameters (all optional — auto-detected from description)

| Param | Options | Example |
|-------|---------|---------|
| `severity` | P1 P2 P3 P4 | `severity=P1` |
| `product` | any string | `product="Auth Service"` |
| `env` | Production Staging Development | `env=staging` |
| `customer` | any string | `customer="ACME Corp"` |
| `style` | enterprise startup devfirst managed selfservice | `style=devfirst` |

## Examples

```
/support Users are getting 503 errors on POST /api/v2/orders in EU-West, started 2h ago

/support severity=P1 product="Auth" Login page completely down for all users

/support Database queries timing out — production
---logs
[ERROR] 14:23:11 - query timeout after 30000ms table=orders
[WARN]  14:23:09 - connection pool: 95/100 active
[ERROR] 14:22:58 - deadlock detected on table orders txn_id=8821

/support style=selfservice How do I reset my 2FA on my account?
```

## Output

Full pipeline output with labeled sections per agent.
Saves `incident-<id>.md` to current directory.
