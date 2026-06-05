## What this changes

<!-- One paragraph. What agent, phase, or doc did you change and why? -->

## Which phase/agent did you test

<!-- The only real test is running the pipeline. What did you run? -->

```
/product-team --auto <brief you used>
```

## Checklist

- [ ] Tested against a real Claude Code session (not just a syntax check)
- [ ] The changed agent reads `_team/README.md` and `_team/CONTEXT.md` on dispatch
- [ ] The `SKILLS_INVOKED:` block appears in the agent's artefact
- [ ] Artefact lands in the correct `_team/` subfolder
- [ ] No VAI Finance or other company-specific content in core agent files
- [ ] No new role that duplicates an existing role's responsibility

## Known limitations

<!-- Anything that still doesn't work perfectly, or scope you deliberately left out. -->
