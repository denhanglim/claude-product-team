# PRD — Sample Output

> This is an example of the artefact `product-manager` writes to `_team/prds/`. Based on the brief: "add a CSV export command to expense tracker".

---

```markdown
---
type: prd
brief: _team/briefs/2026-06-01-expense-tracker-csv-export.md
product: expense-tracker
feature: csv-export
date: 2026-06-01
status: draft
---

# PRD: CSV Export

## Problem

Users have no way to get their expense data out of the tool. They cannot import
into Excel, share with an accountant, or back up their ledger as a human-readable
file. The only exit path today is copying terminal output by hand.

## Users

Primary: the tool's owner. Secondary: anyone they share the CSV with (accountant,
partner reviewing household spending).

## Success metrics

- `expense export --csv` produces a valid CSV in under 200ms for ledgers up to 10k entries.
- The CSV opens in Excel/Google Sheets without encoding errors (UTF-8 BOM).
- All existing entries round-trip: import back in and the ledger is identical.
- No new dependencies added (stdlib `csv` module only).

## Scope

- `expense export --csv [--out FILE] [--from YYYY-MM] [--to YYYY-MM]`
- Default output: stdout (pipe-friendly)
- `--out FILE`: write to file, print confirmation to stderr
- Date range filters (both optional; default = all time)
- Column order: date, amount, category, note, archived

## Non-scope

- JSON export (separate brief)
- Import from CSV (separate brief)
- Cloud upload or sync
- Formatting options (currency symbol, decimal separator)

## User stories

- As an owner, I can run `expense export --csv` to get my full ledger as CSV so I can open it in Excel.
- As an owner, I can pipe CSV output to a file so I can automate weekly backups.
- As an owner, I can filter by `--from` and `--to` so I can share a month's spending with my accountant.
- As an owner, I can use `--out expenses.csv` so I get a named file without shell redirects.
- As a consumer of the CSV, I can trust that amounts are decimal and notes are correctly quoted so the data imports cleanly into any tool.

## Risks

- Large ledgers (>100k rows) loaded into memory before streaming → mitigation: use a generator-based approach in `ledger.py`.
- UTF-8 BOM required for Excel but may surprise Unix tools that treat it as content → mitigation: document in help text.

## Open questions

1. Should archived entries be included by default or require `--include-archived`?
   → Recommendation: include by default (the `archived` column tells the consumer).
2. Should the date column be ISO-8601 (`2026-01-15`) or the display format (`15 Jan 2026`)?
   → ISO-8601 for machine readability.

## Strategic briefing diff

Updated `docs/products/expense-tracker.md` to note CSV export as a shipped capability under "Features". No structural changes to the brief.

## SKILLS_INVOKED

- superpowers:brainstorming (yes — surfaced open questions 1 and 2 before writing scope)
- superpowers:writing-plans (yes — structured scope, non-scope, and user stories)
```
