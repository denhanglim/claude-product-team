#!/usr/bin/env bash
# Product team progress tracker.
#
# Usage:
#   ./scripts/progress.sh set <stage> "<label>"   update current phase
#   ./scripts/progress.sh done                    clear progress
#   ./scripts/progress.sh status                  print current phase
#
# Stage numbers:
#   0  Intake
#   1  Discovery
#   2  Design + Architecture
#   3  Build
#   4  Integration
#   5  QA
#   6  Security
#   7  Ship
#
# The status is written to ~/.claude/product-team-progress.
# Wire it up to your Claude Code status line or read it from another terminal:
#   watch -n 2 cat ~/.claude/product-team-progress

STAGE_NAMES=("Intake" "Discovery" "Design+Architecture" "Build" "Integration" "QA" "Security" "Ship")
STATUS_FILE="${HOME}/.claude/product-team-progress"

# Ensure the directory exists (Claude Code creates ~/.claude/, but guard anyway)
mkdir -p "$(dirname "$STATUS_FILE")"

case "$1" in
  set)
    stage="${2:-0}"
    label="${3:-}"
    name="${STAGE_NAMES[$stage]:-Phase $stage}"
    if [[ -n "$label" ]]; then
      echo "Phase ${stage} — ${name}: ${label}" > "$STATUS_FILE"
    else
      echo "Phase ${stage} — ${name}" > "$STATUS_FILE"
    fi
    ;;
  done)
    rm -f "$STATUS_FILE"
    ;;
  status)
    if [[ -f "$STATUS_FILE" ]]; then
      cat "$STATUS_FILE"
    else
      echo "idle"
    fi
    ;;
  *)
    echo "Usage: progress.sh set <stage> <label> | progress.sh done | progress.sh status" >&2
    exit 1
    ;;
esac
