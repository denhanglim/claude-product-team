# Customisation

## Recommended session settings

### Extended thinking (effort level)

Enable extended thinking (max effort) in Claude Code before starting a build. In the desktop app, open Settings → Model; in the CLI, use `/config`.

Why it matters: the four Opus agents — head-of-product, product-manager, tech-lead, security-compliance — produce the documents everything else builds from. Extended thinking lets them reason through edge cases in scope, catch architectural conflicts before code is written, and surface non-obvious security issues. The six Sonnet agents (engineers, QA, devops) execute against those documents; thinking budget is less critical there.

**Effort is a session-level setting.** There is no per-agent thinking budget in Claude Code agent definitions. Set it once before typing `/product-team` — it applies to the full run. You can change it with `/config` mid-session, but the expensive reasoning phases (1, 2, 6) run before the build phases (3, 5, 7), so reducing effort midway gains little.

---

## The only file you should regularly edit

**`_team/CONTEXT.md`** — keep it current as your project evolves. If you add a new integration, add it to MCP Tools. If you standardise on a new pattern, add it to Constraints. If you introduce new domain terms, add them to the vocabulary table.

## Adding MCP integrations

If you connect MCP servers to your Claude Code session, list them in `_team/CONTEXT.md` under "MCP Tools Available". Then update the relevant agent's `tools:` frontmatter to include the MCP wildcard.

Example — adding a database MCP to `backend-engineer.md`:
```yaml
tools: Read, Edit, Write, Bash, mcp__mydb__*
```

Agents will then use those tools for live schema introspection instead of guessing.

## Adding a product-specific strategic briefing

Create `docs/products/<product-slug>.md` with sections:
- What it does
- Current status
- Key decisions made
- Recent changes

`product-manager` and `devops-engineer` will update this file as part of their work.

## Adding brand guidelines

Create `docs/brand/` with files covering tone of voice, colour palette, and component patterns. `ux-architect` reads `docs/brand/` if it exists.

## Adjusting skill requirements

Each agent's "Required skills" section lists what it must invoke. If you want to remove or add a skill for a specific role, edit the agent file directly. The agent will include it in `SKILLS_INVOKED:` reporting — if missing without justification, head-of-product re-dispatches.

## Using pair mode

Instead of running the full pipeline, ask two roles to debate a design question:

```
/product-team have product-manager and tech-lead discuss whether auth should be its own service
```

head-of-product runs a structured 2-role debate (≤3 turns) and synthesises the result to you.

## Wiring up the progress bar

The progress bar script writes to `~/.claude/product-team-progress`. To see it in your terminal during a run:

```bash
# In a separate terminal
watch -n 2 cat ~/.claude/product-team-progress
```

Or integrate it with your Claude Code status line configuration — see Claude Code docs for status line customisation.

## Adapting for a non-Python stack

The agents default to Python conventions because that's common for internal tools. To adapt:
1. Update `_team/CONTEXT.md` — Tech Stack section
2. Update the relevant product's `<product>/CLAUDE.md`

Agents read both and will match the documented stack. No other changes needed.
