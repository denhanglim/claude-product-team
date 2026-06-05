# Team Context — Example (Expense Tracker CLI)

> This is a filled-in example of `_team/CONTEXT.md`. Copy the blank template at `_team/CONTEXT.md` for your own project.

---

## Project / Company Overview

A CLI tool for tracking personal expenses. Runs locally — no accounts, no cloud sync. Target users: developers who prefer terminal over GUI budgeting apps.

Key differentiators: fast entry (one command), plain-text export (CSV/JSON), monthly report with category breakdowns.

## Your Role

Sole developer. Responsible for features, testing, packaging (PyPI), and the GitHub repo. No team. Make decisions fast, document the non-obvious ones in code comments.

## Domain Vocabulary

| Term | Definition |
|------|-----------|
| Entry | A single expense: amount, category, date, optional note |
| Category | User-defined label (e.g. "Food", "Travel"). Free text, not a fixed enum |
| Period | A month (YYYY-MM). Reports always aggregate by period |
| Budget | Optional per-category monthly limit. Warn if over |
| Archive | Mark entries as archived (hidden from default view, still in DB) |
| Ledger | The SQLite database holding all entries. One per machine |

## Tech Stack

- **Language:** Python 3.11
- **CLI framework:** Click 8.x
- **Terminal output:** Rich (tables, progress, colour)
- **Database:** SQLite via `sqlite3` stdlib (no ORM)
- **Testing:** pytest + pytest-cov
- **Packaging:** pyproject.toml (Hatch)
- **CI:** GitHub Actions (lint + test on push)

## MCP Tools Available

None. Fully offline tool. No external API calls.

## Constraints & Preferences

- Output must be readable in an 80-column terminal. No wide tables.
- No network calls — tool must work fully offline.
- Do not add dependencies without updating both `pyproject.toml` and the install docs.
- Prefer stdlib over third-party packages where equivalent.
- All DB writes go through a single `ledger.py` module — no raw SQL scattered across commands.
- CLI entry point: `expense` (not `expense-tracker`, not `exp`).

## Sensitivity Rules

- No sensitive data in this project — all data is local.
- Do not log or print full file paths (they may reveal the user's system username).
- If adding any future cloud sync feature, treat all financial data as `confidential`.
