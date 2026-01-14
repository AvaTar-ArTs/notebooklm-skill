# NotebookLM `nlm` Command Setup

**Created:** January 14, 2026  
**Status:** Simple standalone script approach

---

## ✅ What's Set Up

I've created a simple `nlm` wrapper script that handles:
- Auto Python version detection (3.12 → 3.11 → 3)
- Auto cleanup (pycache, .pyc files)
- Direct pass-through to skill scripts

---

## 📍 Location

```bash
~/notebooklm/nlm.sh
```

---

## 🚀 Usage

```bash
# Direct script usage
~/notebooklm/nlm.sh ask_question.py --question "What is this?"
~/notebooklm/nlm.sh notebook_manager.py list
~/notebooklm/nlm.sh auth_manager.py status

# Create alias in your shell (add to .zshrc when syntax is fixed)
alias nlm="$HOME/notebooklm/nlm.sh"

# Then use it simply
nlm ask_question.py --question "What is POD?"
nlm notebook_manager.py list
nlm auth_manager.py stats
```

---

## 📝 Script Contents

```bash
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
```

---

## ⚙️ Features

✅ **Auto Python Detection:**
- Tries python3.12 first
- Falls back to python3.11
- Falls back to system python3

✅ **Auto Cleanup:**
- Removes `__pycache__` directories
- Deletes `.pyc` files
- Runs after each command

✅ **Simple & Reliable:**
- No complex zsh functions
- No dependency on .zshrc parsing
- Just works!

---

## 🔧 Common Commands

```bash
# Authentication
nlm auth_manager.py setup
nlm auth_manager.py status

# Notebooks
nlm notebook_manager.py list
nlm notebook_manager.py add
nlm notebook_manager.py stats

# Queries
nlm ask_question.py --question "What is POD?"
nlm batch_query.py run --questions-file questions.txt

# History
nlm query_history.py list
nlm query_history.py stats

# Export
nlm export_manager.py summary <notebook-id>
nlm export_manager.py export-all

# Cleanup
nlm cleanup_manager.py --confirm
```

---

## 🎯 Quick Aliases (Optional)

Add these to your shell config once .zshrc syntax is fixed:

```bash
# Main command
alias nlm="$HOME/notebooklm/nlm.sh"
export NLM_DIR="$HOME/.claude/skills/notebooklm"

# Quick shortcuts
alias nlm-list='nlm notebook_manager.py list'
alias nlm-stats='nlm notebook_manager.py stats'
alias nlm-ask='nlm ask_question.py --question'
alias nlm-auth='nlm auth_manager.py status'
alias nlm-cd='cd $NLM_DIR'
```

---

## 🐛 Note About .zshrc

Your `.zshrc` has a pre-existing syntax error that prevents adding the NotebookLM shortcuts directly to it. The error appears to be related to embedded Python code in the `scan()` function or mismatched conditional statements.

**Error:** `/Users/steven/.zshrc:1764: parse error near \n`

**Solutions:**
1. **Use the standalone script** (recommended, works now!)
2. Fix the `.zshrc` syntax error (requires debugging the file)
3. Add aliases to a separate file like `~/.zsh_aliases` and source it

---

## ✅ Testing

```bash
# Test the script directly
~/notebooklm/nlm.sh notebook_manager.py stats

# Test with alias (once added)
nlm notebook_manager.py stats
```

---

**Status:** ✅ Working standalone script created!  
**Next Step:** Just use `~/notebooklm/nlm.sh` or add the alias when convenient.
