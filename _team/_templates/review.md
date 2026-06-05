---
type: review
date: YYYY-MM-DD
product: <product-slug>
author: security-compliance
status: blocked | approved
prd: <path to prd>
---

# Security review: <feature name>

## Scope reviewed

Files and diff range examined. Commands run.

## Findings

Numbered list. Each finding:
- **Severity:** blocking | warn | info
- **Where:** `file:line`
- **What:** description of the issue
- **Fix:** specific remediation required

## Verdict

✅ approved — no blocking findings.

OR

⛔ blocked — engineer `<role>` must address finding(s) #N before re-review.

## Commands run

- `security-review` skill — result summary
- `code-review --high` skill — result summary

## SKILLS_INVOKED

- security-review skill (yes | no — reason)
- code-review skill --high (yes | no — reason)
- superpowers:requesting-code-review (yes | no — reason)
