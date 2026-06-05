# Claude Product Team

A drop-in multi-agent software team for Claude Code. Write a brief → the team ships it.

## What it is

Thirteen specialist AI agents that behave like a real product team — each with a defined role, bounded scope, and explicit quality gates. Built on Claude Code's native agent and worktree capabilities.

```
Brief → PM → UX + Tech Lead (parallel) → Engineers (parallel) → QA → Security → Ship
```

Three human checkpoints. One context file. Zero repeated instructions.

## The two teams

### Product team — builds features

Triggered by `/product-team <brief>`. Runs 8 phases:

| Phase | Who | What |
|-------|-----|------|
| 0 | head-of-product | Intake, CLAUDE.md generation, build worktree |
| 1 | product-manager | PRD with problem, scope, success metrics ⏸️ |
| 2 | ux-architect + tech-lead | Design + architecture (parallel) ⏸️ |
| 3 | backend + frontend + data | Build in isolated worktrees (parallel) |
| 4 | head-of-product + tech-lead | Integration + conflict resolution |
| 5 | qa-engineer | Test plan, golden path, edge cases, defect loop |
| 6 | security-compliance | Security gate — findings are blocking ⏸️ |
| 7 | devops-engineer | Branch finish, CLAUDE.md update, merge |

⏸️ = human checkpoint. Checkpoint 3 is never skippable.

### Engineering team — audits codebases

Triggered by `/engineering-team <codebase>`. Diagnoses existing code for **robustness, efficiency, and effectiveness** — read-only. Returns one prioritised report. Optional remediation phase dispatches builders to fix approved findings.

| Reviewer | Axis |
|----------|------|
| code-reviewer | Correctness, dead code, edge cases |
| performance-engineer | Complexity, wasted I/O, API call patterns |
| reliability-engineer | Test coverage, meaningful assertions, LLM evals |
| security-compliance | Secrets, PII, external data flow |
| tech-lead | Architecture, coupling, API contracts |

## What makes this different

**Role discipline.** Every agent has an explicit "You do NOT" section. The backend engineer doesn't touch UI; the security reviewer doesn't fix code; the QA engineer doesn't trust the engineers' own pass/fail claims.

**Sit-out rule.** Unused roles are announced as sitting out with a reason — never silently omitted. A tiny script doesn't need a performance review; a pure local CLI doesn't need security-compliance. Only active roles run.

**Skill enforcement.** Every agent receives a required-skills list and must report `SKILLS_INVOKED:` in every artefact. Missing a required skill without justification triggers an automatic re-dispatch.

**Failure isolation.** One engineer failing in Phase 3 doesn't restart the pipeline. QA defects re-dispatch only the responsible engineer. Security findings block only until the specific finding is fixed.

**Context flows, not instructions.** Fill in `_team/CONTEXT.md` once — business domain, tech stack, vocabulary, MCP tools, constraints, sensitivity rules. head-of-product passes relevant excerpts to every downstream agent automatically.

## Quick start

```bash
# 1. Clone
git clone https://github.com/<you>/claude-product-team.git
cd claude-product-team

# 2. Make the progress script executable
chmod +x scripts/progress.sh

# 3. Fill in your project context
# Edit _team/CONTEXT.md

# 4. Put your product code here (or symlink it)
# e.g. my-app/

# 5. Open Claude Code and run
# /product-team add a user authentication flow to my-app
```

See `docs/setup.md` for both setup options (new project or drop-in to existing).

## Prerequisites

Several Claude Code skill packages are required. See `docs/prerequisites.md` for the full list and installation notes.

## File structure

```
claude-product-team/
├── .claude/
│   ├── agents/         14 agent definitions
│   └── commands/       /product-team and /engineering-team slash commands
├── _team/
│   ├── CONTEXT.md      ← fill this in first
│   ├── README.md       team operating manual (agents read this)
│   ├── ENGINEERING.md  engineering team manual (agents read this)
│   ├── _templates/     artefact templates (brief, PRD, design, architecture, ...)
│   ├── briefs/         Phase 0 outputs
│   ├── prds/           Phase 1 outputs
│   ├── designs/        Phase 2 outputs
│   ├── architecture/   Phase 2 outputs
│   ├── test-plans/     Phase 5 outputs
│   ├── reviews/        Phase 6 outputs
│   ├── reports/        Phase 7 outputs
│   └── audits/         Engineering team sweep outputs
├── scripts/
│   └── progress.sh     phase progress tracker
└── docs/
    ├── prerequisites.md
    ├── setup.md
    └── customization.md
```

## Usage examples

```
# Full pipeline with approval checkpoints
/product-team add a dark mode toggle to settings

# Skip first two checkpoints (PRD + design/arch approval)
/product-team --auto fix the pagination bug on the dashboard

# Two-role debate without running the full pipeline
/product-team have product-manager and tech-lead discuss whether notifications should be async

# Audit a codebase
/engineering-team audit my-app

# Security-only sweep
/engineering-team security only on payments-service
```

## License

MIT
