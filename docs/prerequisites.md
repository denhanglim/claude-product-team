# Prerequisites

The product team agents require several Claude Code skill packages. Install these before running `/product-team`.

---

## Required skill packages

### superpowers — [github.com/obra/superpowers](https://github.com/obra/superpowers)

Core orchestration and engineering-discipline skills used across every agent.

```
/plugin marketplace add obra/superpowers
/plugin install superpowers
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

### andrej-karpathy-skills — [github.com/multica-ai/andrej-karpathy-skills](https://github.com/multica-ai/andrej-karpathy-skills)

Principles for surgical, non-over-engineered code changes. Encodes Karpathy's four coding-agent principles: think before coding, simplicity first, surgical changes, goal-driven execution.

```
/plugin marketplace add multica-ai/andrej-karpathy-skills
/plugin install andrej-karpathy-skills
```

Skills used:
- `andrej-karpathy-skills:karpathy-guidelines`

### ui-ux-pro-max — [github.com/nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill)

UI/UX design patterns, component conventions, Tailwind/shadcn discipline, design system generation across 10+ frameworks.

```
/plugin marketplace add nextlevelbuilder/ui-ux-pro-max-skill
/plugin install ui-ux-pro-max
```

Skills used:
- `ui-ux-pro-max:ui-ux-pro-max`

### chrome-devtools-mcp — [github.com/ChromeDevTools/chrome-devtools-mcp](https://github.com/ChromeDevTools/chrome-devtools-mcp)

Browser automation and accessibility auditing via Chrome DevTools Protocol. Used by `frontend-engineer` and `qa-engineer` to verify in a real browser.

```
# As a Claude Code plugin (skills + MCP server):
/plugin marketplace add ChromeDevTools/chrome-devtools-mcp
/plugin install chrome-devtools-mcp
```

Or MCP-only (no skills, not recommended):

```bash
claude mcp add chrome-devtools --scope user npx chrome-devtools-mcp@latest
```

Skills used:
- `chrome-devtools-mcp:chrome-devtools`
- `chrome-devtools-mcp:a11y-debugging`

---

## Built-in skills (no installation needed)

Standard Claude Code skills — available without any plugin install:

- `code-review` — structured code review
- `security-review` — security-focused code review
- `verify` — verify a change actually works before declaring done

---

## Optional: Figma MCP

`ux-architect` and `frontend-engineer` can use the Figma MCP for design work. Without it, they produce text wireframes, which work fine for most internal tools.

To enable: connect the Figma MCP server in your Claude Code settings. The agents detect its presence from `_team/CONTEXT.md` → "MCP Tools Available".

---

> **Verify install commands on each repo's README.** Plugin install syntax can change between Claude Code releases.
