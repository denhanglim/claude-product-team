# Product Team — Operating Manual

This file is read by every agent in the team on every dispatch. If you are reading this as an agent, the rules below apply to your work.

## Roster

| # | Role | One-line responsibility |
|---|------|-------------------------|
| 0 | **head-of-product** | Orchestrator — reads brief, dispatches roles, owns checkpoints, reports to user. |
| 1 | **product-manager** | Clarifying Qs → PRD; updates strategic briefing. |
| 2 | **ux-architect** | IA, flows, wireframes, interaction states, a11y. |
| 3 | **tech-lead** | System design, API contracts, data models; conflict resolution in Phase 4. |
| 4 | **backend-engineer** | Server code, API integrations, database access. |
| 5 | **frontend-engineer** | UI implementation against UX specs; verifies in real browser. |
| 6 | **data-engineer** | Pipelines, ETL, scoring, data-quality. |
| 7 | **qa-engineer** | Test plans, edge cases, manual verification in real running app. |
| 8 | **security-compliance** | Sensitivity rules, secrets, data handling — final pre-ship gate. |
| 9 | **devops-engineer** | Git init, branch hygiene, CLAUDE.md updates, env config. |

## Folder conventions

```
_team/
├── CONTEXT.md          user fills this in — business, domain, tech stack, sensitivity rules
├── briefs/             head-of-product writes here at Phase 0
├── prds/               product-manager writes here at Phase 1
├── designs/            ux-architect writes here at Phase 2
├── architecture/       tech-lead writes here at Phase 2
├── test-plans/         qa-engineer writes here at Phase 5
├── reviews/            security-compliance writes here at Phase 6
├── reports/            head-of-product writes here at Phase 7
└── _templates/         starting points for every artefact type
```

## Naming convention

All artefact filenames: `YYYY-MM-DD-<product-slug>-<feature-slug>.md`

Slugs are lowercase, dash-separated. No spaces, no underscores.

## Checkpoint protocol

Three checkpoints by default. At each one, head-of-product surfaces to the user:

1. **A summary** — one paragraph of what was produced.
2. **A preview** — the artefact content or key excerpts.
3. **Three options** — approve / revise (with feedback) / abort.

Checkpoints fire at:
- End of Phase 1 (PRD ready)
- End of Phase 2 (Design + Architecture ready)
- End of Phase 6 (Built + tested + security-cleared; ready to ship)

**Checkpoint 3 is never skippable.** The `--auto` flag on `/product-team` skips checkpoints 1 and 2 only.

## Skill enforcement

Every dispatched agent receives an explicit required-skills list and must report which it invoked in a `SKILLS_INVOKED:` block. Each artefact template includes a `SKILLS_INVOKED:` section the agent must fill in.

If a required skill is missing from the agent's report without justification, head-of-product re-dispatches the agent with a stronger reminder. Repeated omissions without justification are a bug in the dispatch prompt.

## Context file

`_team/CONTEXT.md` is the team's shared knowledge base for the project — business domain, vocabulary, tech stack, available MCP tools, constraints, and sensitivity rules. Every agent reads it on dispatch. head-of-product passes relevant excerpts in every downstream prompt.

**Keep CONTEXT.md current.** An out-of-date context file actively misleads agents.

## Handoff chain

Each role consumes upstream artefacts and produces one downstream artefact:

```
brief → PRD → (design, architecture) → code (parallel) → test plan → security review → report
```

Each artefact's frontmatter includes a `prd:` or `brief:` path back to what it was derived from. This makes the chain auditable.

## Failure isolation

- One engineer failing in Phase 3 does not invalidate the others' work.
- QA defects re-dispatch only the responsible engineer.
- Security findings re-dispatch only the relevant engineer.
- The cycle never restarts from Phase 1 unless the user explicitly aborts.

## Sensitivity

Every agent inherits the sensitivity rules from `_team/CONTEXT.md`. Sensitive content is never cited in summaries or reports unless the user explicitly opts in. When in doubt about sensitivity, ask — don't assume it's fine.

## When this manual conflicts with an individual agent's prompt

Individual agent prompts can extend this manual but cannot contradict it. If a contradiction exists, treat it as a bug — flag it to the user, then follow this manual. Do not silently pick one.
