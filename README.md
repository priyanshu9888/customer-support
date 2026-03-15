```
   ____          _                              ____                              _
  / ___|   _ ___| |_ ___  _ __ ___   ___ _ __ / ___| _   _ _ __  _ __   ___  _ _| |_
 | |  | | | / __| __/ _ \| '_ ` _ \ / _ \ '__| \___ \| | | | '_ \| '_ \ / _ \| '__| __|
 | |__| |_| \__ \ || (_) | | | | | |  __/ |   ___) | |_| | |_) | |_) | (_) | |  | |_
  \____\__,_|___/\__\___/|_| |_| |_|\___|_|  |____/ \__,_| .__/| .__/ \___/|_|   \__|
                                                           |_|   |_|
```

### A Virtual Support Engineering Team for Claude Code

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Claude Code](https://img.shields.io/badge/Claude_Code-Plugin-blueviolet)](https://claude.ai/claude-code)
[![Roles](https://img.shields.io/badge/Specialist_Roles-13-orange)]()
[![Commands](https://img.shields.io/badge/Slash_Commands-7-green)]()

---

## Key Features

- **🤖 Multi-LLM Specialists (New in v3)**: Dedicated experts for:
  - **OpenAI**: GPT-4o, o1, rate limits, and function calling.
  - **Claude**: Anthropic API, prompt caching, and streaming.
  - **Gemini**: Vertex AI, multi-modality, and context management.
- **🛡️ Tiered Escalation (v2)**: Structured workflow from **L1** (Intake) ⇢ **L2** (Technical) ⇢ **L3** (Code Fixes).
- **🎭 Multi-Role Orchestration**: Automatically staffs Triage, Log Investigation, RCA, and Specialist roles.
- **🔍 Background Intelligence**: Automated `log-analyzer` and `kb-matcher` provide context while you work.
- **📚 KB Integration**: Load runbooks, incident reports, and docs into the agents' context.
- **🎭 Multi-Role Orchestration**: Automatically staffs Triage, Log Investigation, RCA, and Specialist roles.
- **🔍 Background Intelligence**: Automated `log-analyzer` and `kb-matcher` provide context while you work.
- **📚 Knowledge Base Integration**: Load runbooks, past incident reports, and docs directly into the agents' context.
- **⚡ Performance-Ready**: Built for speed and precision in high-pressure support environments.

[Installation](#installation) · [Commands](#commands) · [The Team](#the-team) · [How It Works](#how-it-works)

---

## Quick Start

```bash
claude plugin add https://github.com/priyanshu9888/customer-support.git
```

Then try:

```
/support Users are getting 503 errors on our API — EU region — started 2h ago
```

---

## The Team

The Support Manager dynamically assembles your team from 13 specialist roles:

| Category | Roles |
| :--- | :--- |
| **Core Workflow** | Support Manager, Triage Specialist, Incident Reporter, KB Engineer, Customer Comms |
| **Escalation Tiers** | L1 Support (Intake), L2 Support (Technical), L3 Support (Code Fixes) |
| **Technical Specialists**| Log Investigator, Root Cause Analyst, Solutions Architect |
| **LLM Providers** | OpenAI Specialist, Claude Specialist, Gemini Specialist |

---

## Commands

### `/support <task>` — Full Support Pipeline

Assembles all relevant specialists and runs the complete pipeline:

```
/support Users getting 503 errors on POST /api/v2/orders — EU-West — 2h
/support severity=P1 Auth service completely down for all users
/support Database queries timing out — production
---logs
[ERROR] 14:23:11 - query timeout after 30000ms
[ERROR] 14:22:58 - connection pool exhausted: max=100
```

### `/triage <ticket>` — Fast Classification

Classify a ticket in seconds: severity, SLA, scope, escalation decision.

```
/triage API intermittent 503s in EU-West, started 2h ago
/triage Billing webhook stopped firing — 30 minutes ago
```

### `/investigate <logs>` — Log Analysis

Deep investigation of any log output, error trace, or exception.

```
/investigate
[ERROR] 14:23:11 upstream timeout 30000ms
[WARN]  14:22:58 connection pool: 100/100
[INFO]  14:20:00 deployment api-gateway v2.14.3 complete
```

### `/rca <description>` — Root Cause Analysis

5-Whys + causal chain analysis.

```
/rca Connection pool exhausted 2h after v2.14.3 deployed — EU-West only
```

### `/fix <description>` — Resolution Plan

Immediate actions with CLI commands, short-term fix, permanent fix, rollback plan.

```
/fix Missing await in connection handler causing pool exhaustion — rollback v2.14.3
/fix style=devfirst OOM on Node.js service — suspected event listener leak
```

### `/report <summary>` — Incident Report

Status updates, resolution notices, or full post-mortems.

```
/report type=postmortem P2 API Gateway EU-West — 43 min — connection pool exhaustion
/report type=status API degraded EU-West — rollback in progress — ETA 15 min
```

### `/kb <action>` — Knowledge Base

Load company runbooks, past incidents, SOPs into every agent.

```
/kb add ./runbooks/api-gateway.md
/kb add ./incidents/2024-incidents.xlsx
/kb add ./docs/escalation-matrix.pdf
/kb search "connection pool"
/kb list
```

---

## Background Agents

| Agent | What It Does | Triggers |
|-------|-------------|----------|
| **log-analyzer** | Deep log scan: error frequency, spike detection, service dependency map, correlated events | `.log` file present or logs pasted |
| **kb-matcher** | Scans KB for matching runbooks, past incidents, escalation paths | KB docs loaded |

Both run in parallel with the main pipeline — no waiting.

---

## How It Works

```
                    Your Request
                         │
                         ▼
               ┌──────────────────┐
               │  Support Manager │ ← reads task, selects roles
               └────────┬─────────┘
                        │
          ┌─────────────┼─────────────┐
          ▼             ▼             ▼
    ┌──────────┐  ┌──────────┐  ┌──────────┐
    │  Triage  │  │   Logs   │  │    KB    │ ← only needed roles
    └─────┬────┘  └─────┬────┘  └─────┬────┘   are activated
          │             │             │
          └─────────────┼─────────────┘
                        ▼
               ┌──────────────────┐
               │   Root Cause     │ ← synthesizes all findings
               └────────┬─────────┘
                        ▼
               ┌──────────────────┐
               │    Solutions     │ ← CLI commands + fix plan
               └────────┬─────────┘
                        ▼
               ┌──────────────────┐
               │     Report +     │ ← post-mortem + customer comms
               │   Customer Comms │
               └──────────────────┘
```

**Adaptive staffing:** A quick "how do I fix X" question activates 1 role.
A P1 with logs and KB activates all 7 roles with the full pipeline.

---

## Auto-Detection

At session start, the plugin detects your workspace:

| Detects | How |
|---------|-----|
| Stack | `package.json`, `requirements.txt`, `go.mod`, `docker-compose.yml` |
| Log files | `*.log`, `logs/`, `/var/log/` |
| KB documents | `runbooks/`, `docs/`, `kb/`, `wiki/` directories |
| Past incidents | `incident-*.md`, `incident-*.json` files |
| Environment | `.env`, `.env.production` (keys only, never values) |

Recommended support style is set automatically based on detected context.

---

## Support Styles

| Style | Behavior |
|-------|----------|
| `enterprise` | Formal, SLA-referenced, escalation-matrix-aware |
| `startup` | Fast, direct, no ceremony — fix it now |
| `devfirst` | Deep technical: CLI commands, diffs, traces (default) |
| `managed` | Hands-on — as if you will SSH in and execute the fix |
| `selfservice` | Step-by-step guides, assume minimal access |

Set per-command: `style=devfirst` or globally in session.

---

## What's Inside

```
customer-support/
├── .claude-plugin/
│   └── plugin.json                    # Plugin manifest
├── skills/support/
│   ├── SKILL.md                       # Support Manager orchestration
│   └── references/
│       ├── triage-specialist.md       # P1–P4 matrix, SLA, escalation
│       ├── log-investigator.md        # Error patterns, timeline, metrics
│       ├── root-cause-analyst.md      # 5 Whys, causal chain, confidence
│       ├── solutions-architect.md     # Fix playbooks, CLI commands
│       ├── incident-reporter.md       # Post-mortem template, blameless culture
│       ├── kb-engineer.md             # KB search, runbook matching, gaps
│       ├── customer-comms.md          # Message templates, tone by tier
│       ├── l1-support.md              # Intake, info gathering, SLA
│       ├── l2-support.md              # Technical investigation, repro
│       ├── l3-support.md              # Code fixes, hotfixes, rollback
│       ├── openai-specialist.md       # OpenAI API, GPT-4, o1, rate limits [NEW]
│       ├── claude-specialist.md       # Anthropic API, Prompt Caching [NEW]
│       └── gemini-specialist.md       # Gemini, Vertex AI, Multi-modal [NEW]
├── commands/
│   ├── support.md                     # /support — full pipeline
│   ├── triage.md                      # /triage — classification only
│   ├── investigate.md                 # /investigate — log analysis
│   ├── rca.md                         # /rca — root cause analysis
│   ├── fix.md                         # /fix — resolution plan
│   ├── report.md                      # /report — incident report
│   └── kb.md                          # /kb — knowledge base management
├── agents/
│   ├── log-analyzer.md                # Background: deep log analysis
│   └── kb-matcher.md                  # Background: KB relevance matching
├── hooks/
│   └── hooks.json                     # SessionStart context detection
├── scripts/
│   ├── detect-support-context.sh      # Workspace auto-detection
│   └── generate-incident-id.sh        # INC-YYYYMMDD-XXXXXX generator
└── evals/
    └── evals.json                     # 6 test cases with assertions
```

---

## Installation

### One-liner
```bash
claude plugin add https://github.com/priyanshu9888/customer-support.git
```

### Manual
```bash
git clone https://github.com/priyanshu9888/customer-support.git ~/.claude/plugins/customer-support
```

Restart Claude Code to load the plugin.

---

## Requirements

- [Claude Code](https://claude.ai/claude-code) CLI
- No additional dependencies

---

**Built with Claude Code**
