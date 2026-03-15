# /fix — Resolution Plan

Runs the Solutions Architect. Generates immediate actions with CLI commands,
short-term fix, permanent fix, rollback plan, and monitoring checklist.

## Usage
```
/fix <describe the problem and what caused it>

/fix style=devfirst <description>       # full CLI commands, technical depth
/fix style=managed <description>        # step-by-step execution instructions
/fix style=selfservice <description>    # guide for non-technical users
```

## Output
Immediate actions (numbered, with exact CLI commands and ETA),
short-term fix with rollback plan, permanent fix with timeline,
customer workaround, post-fix verification checklist, caveats.

## Examples
```
/fix Connection pool exhausted in api-gateway — missing await in v2.14.3.
Roll back to v2.14.2, then patch the async handler.

/fix style=devfirst OOM kill on Node.js service — heap growing unbounded.
Suspected memory leak in event listener not being cleaned up.

/fix Database running out of connections — postgres pool at max.
Need immediate relief and long-term connection management fix.

/fix style=selfservice My account is locked and I can't log in.
2FA device was lost.
```
