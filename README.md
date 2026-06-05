# Claude Product Team

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

A drop-in multi-agent software team for Claude Code. Write a brief → the team ships it.

## What it is

Ten specialist AI agents that behave like a real product team — each with a defined role, bounded scope, and explicit quality gates. Built on Claude Code's native agent and worktree capabilities.

```
Brief → PM → UX + Tech Lead (parallel) → Engineers (parallel) → QA → Security → Ship
```

Three human checkpoints. One context file. Zero repeated instructions.

## The pipeline

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

## The roster

| Role | Responsibility |
|------|---------------|
| **head-of-product** | Orchestrator — reads brief, dispatches roles, owns checkpoints |
| **product-manager** | Clarifying questions → PRD |
| **ux-architect** | IA, flows, wireframes, interaction states, a11y |
| **tech-lead** | System design, API contracts, data models, conflict resolution |
| **backend-engineer** | Server code, APIs, database access |
| **frontend-engineer** | UI implementation — verifies in real browser |
| **data-engineer** | Pipelines, ETL, scoring, data quality |
| **qa-engineer** | Test plans, edge cases, manual verification in real app |
| **security-compliance** | Secrets, PII, data handling — final pre-ship gate |
| **devops-engineer** | Git hygiene, CLAUDE.md updates, env config |

## What makes this different

**Role discipline.** Every agent has an explicit "You do NOT" section. The backend engineer doesn't touch UI. QA doesn't fix code. Security doesn't lower a finding's severity to move faster.

**Skill enforcement.** Every agent receives a required-skills list and must report `SKILLS_INVOKED:` in every artefact. Missing a required skill without justification triggers an automatic re-dispatch.

**Failure isolation.** One engineer failing in Phase 3 doesn't restart the pipeline. QA finding a bug re-dispatches only the responsible engineer. Security blocking only pauses until the specific finding is fixed.

**Context flows, not instructions.** Fill in `_team/CONTEXT.md` once — business domain, tech stack, vocabulary, MCP tools, constraints, sensitivity rules. head-of-product reads it at Phase 0 and passes relevant excerpts to every downstream agent. You never repeat yourself.

**Three checkpoints.** You stay in control at PRD approval, design+architecture approval, and pre-ship sign-off. At each one: approve, revise (feedback goes to the specific responsible role), or abort cleanly.

## Quick start

```bash
# 1. Clone
git clone https://github.com/<you>/claude-product-team.git
cd claude-product-team

# 2. Make the progress script executable
chmod +x scripts/progress.sh

# 3. Fill in your project context
# Edit _team/CONTEXT.md

# 4. Put your product code here
# e.g. my-app/

# 5. Open Claude Code and run
# /product-team add a user authentication flow to my-app
```

See `docs/setup.md` for both setup options (new project or drop-in to existing).

## Prerequisites

Several Claude Code skill packages are required. See `docs/prerequisites.md`.

## File structure

```
claude-product-team/
├── .claude/
│   ├── agents/         10 agent definitions
│   └── commands/
│       └── product-team.md
├── _team/
│   ├── CONTEXT.md      ← fill this in first
│   ├── README.md       team operating manual
│   ├── _templates/     artefact templates
│   ├── briefs/         Phase 0 outputs
│   ├── prds/           Phase 1 outputs
│   ├── designs/        Phase 2 outputs
│   ├── architecture/   Phase 2 outputs
│   ├── test-plans/     Phase 5 outputs
│   ├── reviews/        Phase 6 outputs
│   └── reports/        Phase 7 outputs
├── scripts/
│   └── progress.sh
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

# Two-role discussion without running the full pipeline
/product-team have product-manager and tech-lead discuss whether notifications should be async
```

## Why not just prompt Claude directly?

Prompting Claude works for simple, one-shot tasks. It breaks down when the task has multiple stakeholders, discipline gaps, or failure modes.

**Role discipline.** When one AI handles everything, it writes code without a spec, skips tests when time-pressured, and reviews its own work. Separate roles with explicit "You do NOT" guardrails make the boundaries real.

**Skill enforcement.** Skills are the mechanism that makes discipline stick. `superpowers:test-driven-development` isn't a suggestion — the agent is required to invoke it and report that it did. Missing a required skill triggers re-dispatch. A prompt reminder does not.

**Failure isolation.** If the backend fails, the frontend work is already done in its worktree. A QA bug re-dispatches one engineer, not the whole pipeline. A bare prompt collapses everything into one conversation where any mistake sends you back to the start.

**Structured human control.** Three checkpoints with approve / revise / abort. The PRD is a contract the user signs off on. The pre-ship checkpoint is never skippable. Prompting gives you output; the team gives you a process you can steer.

**Context once.** Fill `_team/CONTEXT.md` once and every agent on every future build gets your domain vocabulary, tech stack, and constraints. No repeated instructions.

---

## Examples

See `docs/examples/` for:
- `filled-context.md` — a completed CONTEXT.md for a real project
- `sample-prd.md` — what a Phase 1 PRD looks like
- `sample-architecture.md` — what a Phase 2 architecture doc looks like
- `sample-run-report.md` — what a Phase 7 completion report looks like

## License

MIT
