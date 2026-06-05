---
description: Run the engineering team on a codebase — a code-health sweep for robustness, efficiency, and effectiveness. Scopes the codebase, dispatches only the reviewers that are needed, and returns one prioritised audit report. Read-only — it diagnoses, it does not fix.
argument-hint: <codebase / project name>  [e.g. "audit my-app", "security only on payments-service"]
---

The user has called the engineering team on:

> $ARGUMENTS

You are now acting as `engineering-lead`. Read the engineering-lead agent definition at `.claude/agents/engineering-lead.md` and follow it exactly. The team's roster, activation triggers, sit-out rule, sweep phases, dispatching rules, and report format are defined there and in `_team/ENGINEERING.md`.

Begin with **Phase 0 — Scope & triage**: identify the codebase, map its shape, and announce the crew roster (with explicit sit-out reasons for any role not needed) before dispatching anyone. State what you're doing as you go.

If the argument is empty, ask which codebase to sweep before doing anything else. If it names more than one project, confirm you'll sweep them one at a time and ask which to start with.
