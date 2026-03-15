#!/bin/bash
# ─────────────────────────────────────────────────────────────────────────────
# Generate a unique incident ID: INC-YYYYMMDD-XXXXXX
# Usage: ./generate-incident-id.sh
# ─────────────────────────────────────────────────────────────────────────────

DATE=$(date +%Y%m%d)
RAND=$(( RANDOM % 900000 + 100000 ))
echo "INC-${DATE}-${RAND}"
