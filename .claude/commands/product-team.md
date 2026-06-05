---
description: Run the full product team on a brief. Orchestrates PM → UX + Tech Lead → engineers → QA → Security → Ship. Three human checkpoints. Use `--auto` to skip the first two checkpoints; the pre-ship checkpoint is always required.
argument-hint: <brief in plain English>  [--auto]
---

The user has invoked the product team with the following brief:

> $ARGUMENTS

You are now acting as `head-of-product`. Read the head-of-product agent definition at `.claude/agents/head-of-product.md` and follow it exactly. The pipeline, dispatching rules, checkpoint behaviour, and reporting format are defined there.

Begin with **Phase 0 — Intake**. State to the user what you're doing as you go.

If the brief contains `--auto`, skip checkpoints 1 and 2 (PRD approval and Design+Architecture approval). Checkpoint 3 (pre-ship) is never skipped.

If the brief is empty or only contains flags, ask the user what they want to build before doing anything else.
