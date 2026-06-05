# Setup

## Option A — Use this repo as your project root

Clone this repo, put your product code alongside `_team/`, and open Claude Code here.

```
your-project/
├── .claude/          ← agents + commands (from this repo)
├── _team/            ← team workspace (from this repo)
├── scripts/          ← progress script (from this repo)
├── my-app/           ← your actual product code
└── docs/             ← optional: products/, brand/, etc.
```

Claude Code automatically picks up `.claude/agents/` and `.claude/commands/` from the working directory.

## Option B — Drop into an existing project

Copy these three directories into your existing project root:

```bash
cp -r .claude/   /path/to/your-project/.claude/
cp -r _team/     /path/to/your-project/_team/
cp -r scripts/   /path/to/your-project/scripts/
cp -r docs/      /path/to/your-project/docs/
```

`docs/` includes `docs/brand/_template.md` and `docs/products/_template.md`, which agents reference when generating brand guidelines and product briefings.

Then open Claude Code from your project root as usual.

## Step 1 — Fill in CONTEXT.md

Open `_team/CONTEXT.md` and fill in what applies:
- Project / company overview
- Your role
- Domain vocabulary (the terms your project uses)
- Tech stack
- MCP tools (if any are connected)
- Constraints
- Sensitivity rules

This file flows into every agent on every dispatch. A well-filled CONTEXT.md dramatically improves output quality — agents use your domain vocabulary, match your stack, and respect your constraints without being told each time.

## Step 2 — (Optional) Enable the progress bar

The progress script shows which build phase is running, updated live in a separate terminal window. It is not required — the build runs fine without it.

```bash
chmod +x scripts/progress.sh
```

To watch it during a run, open a second terminal and run:

```bash
watch -n 2 cat ~/.claude/product-team-progress
```

(Only needed if you downloaded a zip — `git clone` preserves execute bits. See `docs/customization.md` for wiring it to the Claude Code status line.)

## Step 3 — Install prerequisites

See `docs/prerequisites.md` for required skill packages.

## Step 4 — Run your first build

```
/product-team build a login page with email + password
```

Or with `--auto` to skip the first two approval checkpoints:

```
/product-team --auto add a CSV export button to the dashboard
```

