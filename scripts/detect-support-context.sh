#!/bin/bash
# ─────────────────────────────────────────────────────────────────────────────
# Customer Support — Session Start Context Detector
# Runs automatically when Claude Code session starts
# Outputs context hints that the Support Manager reads before first response
# ─────────────────────────────────────────────────────────────────────────────

echo "┌─────────────────────────────────────────────────────┐"
echo "│  Customer Support — Workspace Context Detection       │"
echo "└─────────────────────────────────────────────────────┘"
echo ""

# ── Stack Detection ──────────────────────────────────────────────────────────
echo "STACK:"
if [ -f "package.json" ]; then
  echo "  ✓ Node.js project detected"
  if grep -q '"express"' package.json 2>/dev/null; then echo "    → Express.js"; fi
  if grep -q '"fastify"' package.json 2>/dev/null; then echo "    → Fastify"; fi
  if grep -q '"next"' package.json 2>/dev/null; then echo "    → Next.js"; fi
  if grep -q '"@nestjs"' package.json 2>/dev/null; then echo "    → NestJS"; fi
fi
if [ -f "requirements.txt" ] || [ -f "pyproject.toml" ] || [ -f "setup.py" ]; then
  echo "  ✓ Python project detected"
  if grep -q "fastapi\|flask\|django" requirements.txt 2>/dev/null; then
    echo "    → Web framework found in requirements.txt"
  fi
fi
if [ -f "go.mod" ]; then echo "  ✓ Go project detected"; fi
if [ -f "Cargo.toml" ]; then echo "  ✓ Rust project detected"; fi
if [ -f "pom.xml" ] || [ -f "build.gradle" ]; then echo "  ✓ Java project detected"; fi
if [ -f "docker-compose.yml" ] || [ -f "docker-compose.yaml" ]; then
  echo "  ✓ Docker Compose detected"
  echo "    Services: $(grep "^  [a-z]" docker-compose.yml 2>/dev/null | tr -d ' :' | tr '\n' ', ')"
fi
if [ -f "Dockerfile" ]; then echo "  ✓ Dockerfile present"; fi
if [ -d ".kubernetes" ] || [ -f "k8s.yml" ] || [ -d "k8s" ]; then
  echo "  ✓ Kubernetes manifests detected"
fi
echo ""

# ── Log Files ────────────────────────────────────────────────────────────────
echo "LOG FILES:"
LOG_COUNT=0
for f in *.log logs/*.log log/*.log /var/log/*.log 2>/dev/null; do
  if [ -f "$f" ]; then
    SIZE=$(du -sh "$f" 2>/dev/null | cut -f1)
    LINES=$(wc -l < "$f" 2>/dev/null)
    echo "  ✓ $f ($SIZE, $LINES lines)"
    LOG_COUNT=$((LOG_COUNT+1))
  fi
done
if [ $LOG_COUNT -eq 0 ]; then echo "  — No log files found in workspace"; fi
echo ""

# ── Knowledge Base ───────────────────────────────────────────────────────────
echo "KNOWLEDGE BASE:"
KB_COUNT=0
for dir in kb/ docs/ runbooks/ knowledge/ wiki/ playbooks/; do
  if [ -d "$dir" ]; then
    COUNT=$(find "$dir" -type f \( -name "*.md" -o -name "*.txt" -o -name "*.pdf" \) 2>/dev/null | wc -l)
    echo "  ✓ $dir — $COUNT files"
    KB_COUNT=$((KB_COUNT+COUNT))
  fi
done
for f in runbook.md runbooks.md escalation.md escalation-matrix.md sop.md playbook.md; do
  if [ -f "$f" ]; then
    echo "  ✓ $f"
    KB_COUNT=$((KB_COUNT+1))
  fi
done
if [ $KB_COUNT -eq 0 ]; then echo "  — No KB documents found (use /kb add <file> to load)"; fi
echo ""

# ── Past Incidents ───────────────────────────────────────────────────────────
echo "PAST INCIDENTS:"
INC_COUNT=0
for f in incident-*.md incident-*.json incidents/*.json post-mortem*.md postmortem*.md; do
  if [ -f "$f" ]; then
    echo "  ✓ $f"
    INC_COUNT=$((INC_COUNT+1))
  fi
done
if [ $INC_COUNT -eq 0 ]; then echo "  — No past incident files found"; fi
echo ""

# ── Environment ──────────────────────────────────────────────────────────────
echo "ENVIRONMENT:"
if [ -f ".env" ]; then
  echo "  ✓ .env file present"
  # Show keys but never values
  KEYS=$(grep -v '^#' .env 2>/dev/null | grep '=' | cut -d= -f1 | head -10 | tr '\n' ', ')
  if [ -n "$KEYS" ]; then echo "    Keys: $KEYS"; fi
fi
if [ -f ".env.production" ]; then echo "  ✓ .env.production present"; fi
if [ -f ".env.staging" ]; then echo "  ✓ .env.staging present"; fi
echo ""

# ── Support Style Hint ───────────────────────────────────────────────────────
echo "RECOMMENDED SUPPORT STYLE:"
if [ -f "package.json" ] && grep -q '"scripts"' package.json 2>/dev/null; then
  echo "  → devfirst (Node.js developer project)"
elif [ $LOG_COUNT -gt 0 ]; then
  echo "  → devfirst (log files present — likely technical context)"
elif [ $KB_COUNT -gt 5 ]; then
  echo "  → enterprise (large KB suggests established support process)"
else
  echo "  → devfirst (default for Claude Code context)"
fi
echo ""
echo "────────────────────────────────────────────────────────"
echo "  Customer Support ready. Try: /support <describe the issue>"
echo "────────────────────────────────────────────────────────"
