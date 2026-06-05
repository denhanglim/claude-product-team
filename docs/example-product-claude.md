# Example: `<product>/CLAUDE.md`

head-of-product auto-generates this file at Phase 0 if it's missing. This is the format it follows. Keep it ≤ 60 lines.

---

```markdown
# my-app — CLAUDE.md

## What this product does

A CLI tool that processes CSV files and generates summary reports. Used by the ops team
to reconcile monthly billing data without touching the web dashboard.

## Tech stack

- Language: Python 3.11
- Framework: none (stdlib only, plus `rich` for terminal output)
- Database: none — reads/writes local CSV files
- Testing: pytest
- Package manager: pip / pyproject.toml

## Entry points

- `python main.py <input.csv>` — run the processor
- `python main.py --help` — show usage
- `pytest` — run the test suite
- `pytest --cov=src` — run tests with coverage report

## Key files

- `main.py` — CLI entry point, argument parsing
- `src/processor.py` — core transformation logic
- `src/reporter.py` — output formatting
- `src/models.py` — data models (dataclasses)
- `tests/test_processor.py` — main test suite
- `pyproject.toml` — dependencies and tool config

## Constraints

- Must run on Python 3.11+; no walrus operator or match/case below that
- Do not add new dependencies without updating `pyproject.toml` and `requirements.txt`
- Output must remain human-readable in a standard 80-char terminal
- No network calls — this is an offline tool
```
