# Run Report — Sample Output

> This is an example of the Phase 7 report `head-of-product` writes to `_team/reports/`. Based on the same CSV export brief.

---

```markdown
---
type: report
brief: _team/briefs/2026-06-01-expense-tracker-csv-export.md
prd: _team/prds/2026-06-01-expense-tracker-csv-export.md
product: expense-tracker
feature: csv-export
date: 2026-06-01
shipped: true
branch: feature/csv-export
---

# Run Report: CSV Export

## What shipped

`expense export --csv` command. Writes UTF-8 BOM CSV to stdout or a file.
Supports `--from` / `--to` date range filters. Streams large ledgers without
loading all rows into memory.

## Phase log

| Phase | Agent | Duration | Outcome |
|-------|-------|----------|---------|
| 0 | head-of-product | 2m | Brief intake, CLAUDE.md generated |
| 1 | product-manager | 8m | PRD written; 2 open questions resolved |
| 2 | tech-lead | 6m | Architecture scoped to 3 files; UX + data sat out |
| 3 | backend-engineer | 22m | All 3 files implemented, 14 tests passing |
| 4 | head-of-product | 1m | Single engineer — no conflicts to resolve |
| 5 | qa-engineer | 11m | 2 defects found, 1 re-dispatch, all cleared |
| 6 | security-compliance | 5m | No findings. No secrets, no network, no PII |
| 7 | devops-engineer | 4m | Branch finished, CLAUDE.md updated, merged |

**Total: ~59 minutes wall clock.**

## Defects found in QA

1. **Empty ledger → IndexError** (fixed in re-dispatch): `get_entries()` returned
   empty list; `to_csv()` called `entries[0]` to get field names. Fixed: use
   `Entry.__dataclass_fields__` for headers regardless of row count.

2. **Note with embedded newline split across CSV rows** (fixed in re-dispatch):
   `csv.DictWriter` was opened without `lineterminator='\r\n'`. RFC 4180 requires
   CRLF. Fixed.

## Security findings

None. Tool is fully offline, no credentials, no user-supplied paths executed as
shell commands.

## Open threads

- `--json` export: next brief (not in scope for this run).
- Import from CSV: next brief.
- Budget overage warnings on export: raised by QA as out-of-scope observation.
  Logged in `_team/briefs/` as a future idea.

## Artefacts produced

- Brief: `_team/briefs/2026-06-01-expense-tracker-csv-export.md`
- PRD: `_team/prds/2026-06-01-expense-tracker-csv-export.md`
- Design: n/a — ux-architect sat out (CLI-only feature, no UI surface)
- Architecture: `_team/architecture/2026-06-01-expense-tracker-csv-export.md`
- Test plan: `_team/test-plans/2026-06-01-expense-tracker-csv-export.md`
- Security review: `_team/reviews/2026-06-01-expense-tracker-csv-export-security.md`
- Branch merged: `feature/csv-export` → `main`
```
