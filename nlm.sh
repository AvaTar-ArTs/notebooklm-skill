#!/usr/bin/env zsh
# Simple NotebookLM wrapper script

NLM_DIR="${NLM_DIR:-$HOME/.claude/skills/notebooklm}"
PYTHON_CMD=$(command -v python3.12 || command -v python3.11 || command -v python3)

if [[ ! -d "$NLM_DIR" ]]; then
  echo "❌ NotebookLM skill not found at: $NLM_DIR"
  exit 1
fi

cd "$NLM_DIR" || exit 1
$PYTHON_CMD scripts/run.py "$@"

# Auto cleanup
find "$NLM_DIR" -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null
find "$NLM_DIR" -type f -name "*.pyc" -delete 2>/dev/null

