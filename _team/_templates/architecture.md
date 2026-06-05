---
type: architecture
date: YYYY-MM-DD
product: <product-slug>
author: tech-lead
status: draft | approved
prd: <path to prd>
---

# Architecture: <feature name>

## System overview

2–3 paragraphs describing how the feature fits into the product. Include a component diagram (ASCII) if it clarifies relationships.

## Engineers needed

Which of backend / frontend / data are required for this feature, and why. Unused engineers sit out.

## API contract

For each new or modified interface: method/path, request schema, response schema, error cases. This is the integration seam — engineers must not need to read each other's code to understand it.

## Data model

Tables/collections affected. New fields, indices, migrations. If external API schemas are involved, note that field types were verified (not assumed).

## Stack choices

Any new libraries or frameworks introduced. Justify each one. Default: stay with the existing stack.

## File-level breakdown

For each engineer, the exact files they will touch:

**Backend:**
- `path/to/file.py` — responsibility

**Frontend:**
- `path/to/file.js` — responsibility

**Data:**
- `path/to/file.py` — responsibility

## Integration seams

Where the engineers' work meets. Explicit interfaces between the file-level breakdowns.

## Risks & tradeoffs

Architectural decisions with their consequences. Include any that were considered and rejected.

## SKILLS_INVOKED

- superpowers:writing-plans (yes | no — reason)
- superpowers:requesting-code-review (yes | no — reason)
