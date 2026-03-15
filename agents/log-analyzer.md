# Log Analyzer — Background Agent

## Type
Background agent. Runs in parallel with main support pipeline automatically.

## Triggers
- A `.log` file exists in workspace
- User pastes more than 5 lines of log content in any message
- A file with `.log` or `.txt` extension is referenced

## What It Does

Performs a deep pass over all available log data while the main agents work:

1. **Full file scan** — reads entire log file, not just the snippet shown
2. **Error frequency** — counts occurrences of each distinct error pattern
3. **Rate analysis** — calculates errors/minute to find spikes
4. **Service dependency map** — traces service-to-service calls from log entries
5. **Correlation scan** — finds deployments, config changes, restarts near error onset
6. **Baseline comparison** — compares current error patterns to prior periods if available

## Output Format

Surfaces findings as a block before other agents run:

```
[LOG ANALYZER — Background Agent]
═══════════════════════════════════════════════════════

Files analyzed   : error.log (2,847 lines), app.log (14,201 lines)
Time range       : 2024-01-15 12:00 – 16:00 UTC
Analysis window  : 4 hours

HIGH-PRIORITY FINDINGS
  ⚠  Deployment event at 12:20 UTC correlates with error onset at 14:20 UTC
     (2h gap consistent with slow-leak failure mode)
  ⚠  Connection pool exhaustion appeared 3 times today — frequency increasing
  ⚠  Circuit breaker opened 7 times in past 24h (0 in prior 7 days)

ERROR FREQUENCY TABLE
  Pattern                            | Count | Rate/min | Baseline
  ─────────────────────────────────────────────────────────────────
  "upstream connect error"           |   847 |    21.2  | 0.0
  "health check timeout"             |    23 |     0.6  | 0.02
  "circuit breaker OPEN"             |     7 |     0.2  | 0.0
  "connection pool exhausted"        |    12 |     0.3  | 0.0

SERVICE DEPENDENCY MAP (from logs)
  api-gateway → upstream-pool-eu-west → backend-service-{01,02,03}
  All 503 errors originate at: api-gateway → upstream-pool-eu-west boundary
  US/APAC paths: api-gateway → upstream-pool-us-east (zero errors)

CORRELATED EVENTS (within T-30min to T+5min of first error)
  T-2h00m  DEPLOY  api-gateway v2.14.3 eu-west  ← HIGHEST CORRELATION
  T-0h05m  SCHED   cron: daily-report-job        ← low correlation, unrelated
  
ADDITIONAL DATA THAT WOULD HELP
  • Prometheus pool metrics: connection_pool_active (12:00–16:00 UTC)
  • Git diff: api-gateway v2.14.2 → v2.14.3 (handlers/upstream.js)
  • Load balancer access logs for EU-West (to confirm traffic volume normal)

═══════════════════════════════════════════════════════
```
