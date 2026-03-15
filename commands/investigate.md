# /investigate — Log Investigation

Runs the Log Investigator on provided logs, error output, or trace data.

## Usage
```
/investigate <paste logs or error messages>

/investigate context="API Gateway" <logs>

/investigate file=./logs/error.log
```

## Output
Timeline reconstruction, error pattern analysis, key metrics
(error rate, latency delta, pool utilization), anomaly detection,
suspected failure area, evidence strength rating, what's missing.

## Examples
```
/investigate
[ERROR] 2024-01-15 14:23:11 - upstream timeout after 30000ms
[WARN]  2024-01-15 14:22:58 - connection pool: 100/100 active
[INFO]  2024-01-15 14:20:00 - deployment api-gateway v2.14.3 complete

/investigate context="Slow database queries" file=./logs/postgres.log

/investigate
TypeError: Cannot read properties of undefined (reading 'userId')
    at verifyToken (src/auth/middleware.js:47:23)
    at Layer.handle [as handle_request] (node_modules/express/lib/router/layer.js:95:5)
```

## Tips
- Include log lines BEFORE the error — they often show the cause
- If logs are from multiple services, label each block clearly
- Raw format is fine — the agent handles JSON logs, plaintext, structured output
