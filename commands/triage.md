# /triage — Ticket Triage

Runs only the Triage Specialist. Fast classification without full pipeline.

## Usage
```
/triage <ticket description>
/triage severity=P1 <description>
```

## Output
Severity, issue type, impact scope, SLA targets, escalation decision,
tags, related components, deployment correlation notes.

## Examples
```
/triage API returning 503 errors intermittently — EU-West region

/triage severity=P2 Billing webhook stopped firing 30 minutes ago

/triage Payment processing is slow — transactions taking 45+ seconds
```

## When to Use
- Quick initial classification before escalating
- Validating a severity label before paging someone
- Bulk triage of queued tickets
