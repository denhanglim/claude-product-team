# Contributing

## What's welcome

- **Bug fixes** — broken cross-references, wrong paths, broken agent instructions
- **Improvements to agent quality** — clearer instructions, better process steps, additional edge-case handling
- **New agent roles** — well-scoped specialists that slot into the pipeline without overlapping existing roles
- **Documentation improvements** — clearer setup, better examples, missing explanations
- **Stack-specific customisations** — guides for adapting the team to specific languages, frameworks, or toolchains

## What isn't welcome

- Changes that couple agents to a specific company, platform, or toolchain in the core files
- Additions that duplicate an existing role's responsibility
- New phases without a strong case for the checkpoint structure

## How to contribute

1. Fork the repo
2. Create a branch: `git checkout -b my-improvement`
3. Make changes and test them against a real Claude Code session (run a build, run an audit)
4. Open a PR with:
   - What you changed and why
   - What you tested (which commands, which phases)
   - Any known limitations

## Testing an agent change

The only real test is running the pipeline:

```bash
# Test a product team change
/product-team --auto build a simple hello-world CLI app

# Test an engineering team change
/engineering-team audit <any small codebase>
```

Check that:
- The changed agent reads `_team/README.md` and `_team/CONTEXT.md` as expected
- The `SKILLS_INVOKED:` block appears in the artefact
- The artefact lands in the correct `_team/` subfolder
- head-of-product re-dispatches if a required skill is missing

## Agent file structure

Each agent file must have:
- YAML frontmatter with `name`, `description`, `tools`
- A "You MUST read on every dispatch" section
- A "Required skills" section
- A "You do NOT" section (scope guardrail)
- A "Return report includes" or "Output" section
- The line "Always include `SKILLS_INVOKED:` at the bottom" (or equivalent)

## Reporting bugs

Open an issue with:
- Which phase/agent failed
- The brief you gave
- What the agent did vs what you expected
- Any relevant artefact content (redact sensitive data)
