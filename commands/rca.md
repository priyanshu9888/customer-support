# /rca — Root Cause Analysis

Runs the Root Cause Analyst. Provide a description of what happened,
optionally with investigation output.

## Usage
```
/rca <describe what happened and what you found>

/rca <description> + paste /investigate output
```

## Output
Primary root cause, causal chain (trigger → mechanism → failure → impact),
confidence level, contributing factors, alternative hypotheses ruled out,
detection gaps.

## Examples
```
/rca API gateway connection pool exhausted after deployment.
Logs show pool hit 100/100 exactly 2h after v2.14.3 deployed.
No errors in US/APAC regions.

/rca Database deadlocks on orders table during peak load.
Started when new background job was deployed 6h ago.

/rca Auth service returning 401 for all users.
Certificate was rotated yesterday. No code changes.
```
