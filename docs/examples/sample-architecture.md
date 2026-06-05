# Architecture Doc — Sample Output

> This is an example of the artefact `tech-lead` writes to `_team/architecture/`. Based on the same CSV export brief.

---

```markdown
---
type: architecture
prd: _team/prds/2026-06-01-expense-tracker-csv-export.md
product: expense-tracker
feature: csv-export
date: 2026-06-01
---

# Architecture: CSV Export

## Decision summary

Use stdlib `csv` module with `DictWriter`. No new dependency. Export via a new
`export.py` module that queries `ledger.py` (existing data layer) and streams
rows. CLI command added to `cli.py`.

## System design

```
cli.py               ← new `export` command wired here
  ↓ calls
export.py            ← new module: query + serialise
  ↓ reads via
ledger.py            ← existing: get_entries(from_date, to_date) method (to add)
  ↓ reads
~/.local/share/expense-tracker/ledger.db   ← existing SQLite file
```

No new files for tests — tests go in `tests/test_export.py`.

## API contracts

### `ledger.get_entries(from_date=None, to_date=None)`

Returns `list[Entry]` where `Entry` is the existing dataclass:

```python
@dataclass
class Entry:
    id: int
    date: date
    amount: Decimal
    category: str
    note: str
    archived: bool
```

`from_date` / `to_date`: `datetime.date | None`. Both inclusive. Existing method
`get_entries()` already exists (returns all); add optional params.

### `export.to_csv(entries, file=sys.stdout)`

```python
def to_csv(entries: list[Entry], file=sys.stdout) -> int:
    """Write entries as CSV. Returns row count written."""
```

Writes UTF-8 BOM (`﻿`) as first byte for Excel compatibility.

## File-level breakdown

| File | Owner | Change |
|------|-------|--------|
| `src/expense_tracker/cli.py` | backend-engineer | Add `export` Click command |
| `src/expense_tracker/export.py` | backend-engineer | New: `to_csv()` function |
| `src/expense_tracker/ledger.py` | backend-engineer | Add `from_date`/`to_date` params to `get_entries()` |
| `tests/test_export.py` | backend-engineer | New: unit + integration tests |

No frontend. No data-engineer (no pipeline). ux-architect sits out (CLI only, no UI surface).

## Risk and constraints

- Large ledgers (>100k rows): stream rather than load all into memory. Use
  `ledger.iter_entries()` (add alongside `get_entries`).
- RFC 4180 compliance: `csv.DictWriter` handles this correctly out of the box.
- Excel UTF-8 BOM: write `﻿` manually before `writer.writeheader()`.

## Integration notes

No integration phase needed — single engineer owns all three files. head-of-product
can skip Phase 4 conflict resolution for this feature.

SKILLS_INVOKED: superpowers:writing-plans (yes — structured file-level breakdown and API contracts),
superpowers:requesting-code-review (yes — framed review prompt for backend-engineer)
```
