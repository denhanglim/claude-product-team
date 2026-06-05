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

### In

- `expense export --csv [--out FILE] [--from YYYY-MM] [--to YYYY-MM]`
- Default output: stdout (pipe-friendly)
- `--out FILE`: write to file, print confirmation to stderr
- Date range filters (both optional; default = all time)
- Column order: date, amount, category, note, archived

### Out of scope

- JSON export (separate brief)
- Import from CSV (separate brief)
- Cloud upload
- Formatting options (currency symbol, decimal separator)

## Acceptance criteria

1. Running `expense export --csv` prints a valid CSV to stdout.
2. The first row is a header: `date,amount,category,note,archived`.
3. Amounts are decimal (e.g. `12.50`), not integer cents.
4. Notes containing commas or newlines are correctly quoted per RFC 4180.
5. `--from 2026-01 --to 2026-03` returns only entries in that range (inclusive).
6. `--out expenses.csv` writes the file and prints `Exported 42 entries to expenses.csv` to stderr.
7. An empty ledger exports a header-only CSV without error.
8. Exit code 0 on success, 1 on any error.

## Open questions

1. Should archived entries be included by default or require `--include-archived`?
   → Recommendation: include by default (the `archived` column tells the consumer).
2. Should the date column be ISO-8601 (`2026-01-15`) or the display format (`15 Jan 2026`)?
   → ISO-8601 for machine readability.

SKILLS_INVOKED: superpowers:brainstorming (surfaced open questions 1 and 2),
superpowers:writing-plans (structured the scope table)
```
