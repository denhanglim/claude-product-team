# Prerequisites

The product team agents require several Claude Code skill packages. Install these before running `/product-team`.

## Required skill packages

### superpowers

Core orchestration and engineering-discipline skills used across every agent.

```bash
# Install via Claude Code skill manager (if available)
# Or follow the superpowers package installation instructions
```

Skills used:
- `superpowers:brainstorming` — surface ambiguities before building
- `superpowers:writing-plans` — structured plan output
- `superpowers:test-driven-development` — failing test first
- `superpowers:systematic-debugging` — evidence-based debugging
- `superpowers:verification-before-completion` — verify before declaring done
- `superpowers:dispatching-parallel-agents` — run agents in parallel correctly
- `superpowers:subagent-driven-development` — overall orchestration pattern
- `superpowers:using-git-worktrees` — worktree management
- `superpowers:finishing-a-development-branch` — clean branch wrap-up
- `superpowers:requesting-code-review` — frame code-review prompts

### andrej-karpathy-skills

Principles for surgical, non-over-engineered code changes.

Skills used:
- `andrej-karpathy-skills:karpathy-guidelines`

### ui-ux-pro-max

UI/UX design patterns, component conventions, Tailwind/shadcn discipline.

Skills used:
- `ui-ux-pro-max:ui-ux-pro-max`

### chrome-devtools-mcp

Browser automation and accessibility auditing via Chrome DevTools.

Skills used:
- `chrome-devtools-mcp:chrome-devtools`
- `chrome-devtools-mcp:a11y-debugging`

## Built-in skills (no installation needed)

These are standard Claude Code skills:
- `code-review` — `/code-review` slash command
- `security-review` — `/security-review` slash command
- `verify` — `/verify` slash command

## Optional: MCP servers

The agents are designed to work with or without MCP integrations. If you have MCP servers connected to your Claude Code session (Figma, a CRM, a database, etc.), list them in `_team/CONTEXT.md` under "MCP Tools Available". Agents will use them for live schema verification and external API calls rather than hallucinating.

## Optional: Figma MCP

The `ux-architect` and `frontend-engineer` can use the Figma MCP for design work. It is optional — text wireframes work fine for most internal tools.
