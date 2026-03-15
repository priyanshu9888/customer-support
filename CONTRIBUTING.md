# Contributing to Customer Support

## Adding a new specialist role
1. Create `skills/support/references/<role-name>.md`
2. Add the role to the roster table in `skills/support/SKILL.md`
3. Add an activation rule in the "Adaptive Staffing" section
4. Add an eval case in `evals/evals.json`

## Adding a new command
1. Create `commands/<name>.md` with Usage, Output, and Examples sections
2. Register it in `.claude-plugin/plugin.json` under `"commands"`

## Adding a new background agent
1. Create `agents/<name>.md` with Type, Triggers, and Output Format sections
2. Register it in `.claude-plugin/plugin.json` under `"agents"`

## Pull Request checklist
- [ ] New role/command has at least one eval case
- [ ] README updated if new command added
- [ ] Tested locally with `claude plugin load .`
