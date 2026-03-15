# /report — Incident Report

Runs the Incident Reporter. Generates status updates, resolution notices,
or full post-mortems.

## Usage
```
/report <incident summary>

/report type=status <summary>       # live status update (during incident)
/report type=resolved <summary>     # resolution notice
/report type=postmortem <summary>   # full post-mortem document
```

## Output varies by type:
- **status** — concise update with impact, ETA, next-update time
- **resolved** — resolution notice with duration, scope, data impact
- **postmortem** — full document: exec summary, timeline, RCA, what went well/poorly, action items, metrics, lessons learned

## Examples
```
/report type=status API Gateway degraded in EU-West — 503 errors — rollback in progress

/report type=resolved API Gateway EU-West incident resolved after 43 minutes.
Connection pool exhaustion caused by missing await in v2.14.3. Rolled back.

/report type=postmortem P2 — API Gateway EU-West — 43 min — connection pool exhaustion
from code bug in v2.14.3. Rollback fixed it. Need pool alerts and canary deploys.
```
