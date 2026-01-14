# NotebookLM skill — local index

This folder is the **NotebookLM Claude Code skill** (Python + Patchright) currently installed at `~/.claude/skills/notebooklm/`.

## Quick start (commands you actually run)

All commands should use the wrapper:

```bash
python scripts/run.py <script>.py [args...]
```

Minimum flow:

```bash
# 1) Check auth
python scripts/run.py auth_manager.py status

# 2) Authenticate (browser visible; you log in manually)
python scripts/run.py auth_manager.py setup

# 3) List notebooks in local library
python scripts/run.py notebook_manager.py list

# 4) Ask a question (uses active notebook if set)
python scripts/run.py ask_question.py --question "..."
```

## How it works (mental model)

- **Auth**: `scripts/auth_manager.py` launches Chrome, you log in, then it saves cookies + local storage to `data/browser_state/state.json` and keeps a persistent Chrome profile under `data/browser_state/browser_profile/`.
- **Queries**: `scripts/ask_question.py` opens a notebook URL, types your question, waits until the streamed answer stabilizes, prints the answer, and exits. It appends a “follow-up reminder” to encourage asking the next question (stateless sessions).
- **Library**: `scripts/notebook_manager.py` stores notebook metadata in `data/library.json` (ID, URL, topics, etc.), with an optional “active notebook”.

## Script map

- **`scripts/run.py`**: runner that bootstraps `.venv` and executes other scripts with venv Python.
- **`scripts/setup_environment.py`**: creates `.venv`, installs deps, installs Patchright Chrome.
- **`scripts/auth_manager.py`**: Google auth setup/status/validate/clear/reauth; writes `data/auth_info.json` + `data/browser_state/state.json`.
- **`scripts/notebook_manager.py`**: add/list/search/activate/remove/stats; reads/writes `data/library.json`.
- **`scripts/ask_question.py`**: ask a question against a notebook by `--notebook-id` or `--notebook-url`.
- **`scripts/cleanup_manager.py`**: cleanup preview + delete (optionally preserve library).
- **`scripts/query_history.py`**: query history log + stats in `data/query_history.json`.
- **`scripts/export_manager.py`**: exports/reports from `library.json` + `query_history.json`; also can query a notebook for “sources list”.
- **`scripts/batch_query.py`**: runs a sequence of questions via `ask_question.py` and saves results to `exports/`.
- **`scripts/browser_utils.py`**: `BrowserFactory` (persistent Chrome context + cookie injection), `StealthUtils` (typing/click helpers).
- **`scripts/browser_session.py`**: lower-level “persistent session” abstraction (not the main path when using `ask_question.py`).

## Data + sensitive files (don’t commit)

These contain personal notebook URLs and Google auth state (already gitignored):

- `data/library.json`
- `data/auth_info.json`
- `data/query_history.json`
- `data/browser_state/state.json`
- `data/browser_state/browser_profile/` (Chrome profile data)

## “Read this next” (docs)

- **`README.md`**: high-level overview + why this exists.
- **`SKILL.md`**: the skill contract Claude Code follows (when to trigger, smart-add workflow, etc.).
- **`AUTHENTICATION.md`**: rationale for the hybrid auth approach (persistent profile + cookie injection).
- **`references/api_reference.md`**: command reference.
- **`references/usage_patterns.md`**: workflows + best practices.
- **`references/troubleshooting.md`**: common failure modes + recovery steps.
- **`CHANGELOG.md`**: what changed between versions.

## Known gotchas (from code review)

- **`scripts/batch_query.py` likely crashes**: it annotates `Optional[...]` but does not import `Optional` (no `from __future__ import annotations`), so on Python 3.12 this will raise `NameError` at import/definition time.
- **Chrome vs Chromium mismatch**: runtime uses `channel="chrome"` and `setup_environment.py` installs Chrome, but `scripts/__init__.py` still tries to install Chromium on import (and has surprising side effects).
- **`scripts/run.py` help text mentions `session_manager.py`**, but there is no `scripts/session_manager.py` in this folder.

If you want, I can fix the above issues (safe, small patches) so batch/export tooling works reliably.

