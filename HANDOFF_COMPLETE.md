# NotebookLM Skill - Complete Handoff Document

**Version:** 2.0
**Date:** 2026-01-14
**For:** Cursor IDE / Claude Code CLI
**Status:** Production Ready

---

## 📋 Table of Contents

1. [What This Is](#what-this-is)
2. [System Requirements](#system-requirements)
3. [Directory Structure](#directory-structure)
4. [Initial Setup](#initial-setup)
5. [Core Concepts](#core-concepts)
6. [Using in Claude Code](#using-in-claude-code)
7. [Using in Cursor](#using-in-cursor)
8. [Feature Reference](#feature-reference)
9. [Practical Workflows](#practical-workflows)
10. [Troubleshooting](#troubleshooting)
11. [Advanced Usage](#advanced-usage)
12. [Maintenance](#maintenance)

---

## 🎯 What This Is

### The Problem It Solves

You have valuable documentation, research, and knowledge stored in Google NotebookLM notebooks. You want to:
- Query these notebooks from your development environment
- Get source-grounded, citation-backed answers
- Avoid hallucinations by grounding AI responses in your actual documents
- Manage multiple notebooks efficiently
- Track your research queries
- Generate reports and exports

### The Solution

This NotebookLM skill is a comprehensive CLI tool that:
1. **Authenticates** with Google NotebookLM (one-time setup)
2. **Manages** a library of your notebooks with metadata
3. **Queries** notebooks and gets Gemini-powered answers grounded in your docs
4. **Tracks** all queries with analytics
5. **Exports** data in multiple formats (JSON, Markdown)
6. **Batch processes** multiple queries efficiently

### Key Benefits

- **Source-Grounded:** Answers come exclusively from your uploaded documents
- **No Hallucinations:** Gemini can only cite what's actually in your notebooks
- **Citation-Backed:** Every answer includes source references
- **Persistent Auth:** Login once, use forever (until you clear it)
- **Comprehensive:** Full research management system, not just queries
- **Integrated:** Works seamlessly in Cursor and Claude Code

---

## 💻 System Requirements

### Prerequisites

- **Python:** 3.8+ (included with macOS)
- **Operating System:** macOS, Linux, or Windows
- **Google Account:** With access to NotebookLM
- **NotebookLM Notebooks:** At least one notebook created
- **Development Environment:** Cursor IDE or Claude Code CLI

### What Gets Installed Automatically

When you first run any script, it automatically:
1. Creates a Python virtual environment (`.venv`)
2. Installs all required dependencies
3. Installs Chromium browser for automation
4. Sets up data directories

**You don't need to install anything manually** - it's all handled by the `run.py` wrapper.

---

## 📁 Directory Structure

```
~/.claude/skills/notebooklm/
├── scripts/                          # All Python scripts
│   ├── run.py                        # Wrapper script (handles venv)
│   ├── ask_question.py               # Single query interface
│   ├── auth_manager.py               # Authentication management
│   ├── notebook_manager.py           # Notebook library management
│   ├── export_manager.py             # Export & reporting (v2.0)
│   ├── query_history.py              # Query tracking (v2.0)
│   ├── batch_query.py                # Batch queries (v2.0)
│   ├── cleanup_manager.py            # Data cleanup
│   ├── browser_session.py            # Browser automation
│   ├── browser_utils.py              # Browser utilities
│   ├── config.py                     # Configuration
│   └── setup_environment.py          # Environment setup
│
├── data/                             # Persistent data storage
│   ├── library.json                  # Notebook metadata
│   ├── query_history.json            # Query tracking data (v2.0)
│   ├── auth_info.json                # Auth status
│   └── browser_state/                # Browser cookies/session
│       ├── state.json
│       └── browser_profile/
│
├── exports/                          # Generated exports (v2.0)
│   ├── *_summary_*.json              # Notebook summaries
│   ├── *_report_*.md                 # Markdown reports
│   ├── batch_query_*.json            # Batch results
│   └── notebooklm_complete_export_*.json  # Full backups
│
├── references/                       # Documentation
│   ├── api_reference.md
│   ├── troubleshooting.md
│   └── usage_patterns.md
│
├── .venv/                            # Python virtual environment (auto-created)
│
├── SKILL.md                          # Core documentation
├── ENHANCEMENTS.md                   # v2.0 feature documentation
├── QUICKSTART_V2.md                  # Quick start guide
├── IMPROVEMENTS_SUMMARY.md           # Enhancement summary
├── HANDOFF_COMPLETE.md               # This file
├── requirements.txt                  # Python dependencies
├── .gitignore                        # Protects sensitive data
└── README.md                         # Project overview
```

### Important Files to Know

| File | Purpose | When to Use |
|------|---------|-------------|
| `data/library.json` | Your notebook metadata | View/backup your notebooks |
| `data/query_history.json` | All your queries | Review research history |
| `exports/*.md` | Generated reports | Share/document findings |
| `data/browser_state/` | Authentication session | Troubleshoot auth issues |

---

## 🚀 Initial Setup

### Step 1: Verify Installation

The skill should already be installed at:
```bash
~/.claude/skills/notebooklm/
```

Navigate to it:
```bash
cd ~/.claude/skills/notebooklm
```

### Step 2: First-Time Authentication

**IMPORTANT:** Authentication requires a VISIBLE browser window where you manually log in to Google.

Run authentication setup:
```bash
python scripts/run.py auth_manager.py setup
```

**What happens:**
1. A Chrome browser window opens automatically
2. You navigate to NotebookLM and log in with your Google account
3. The system saves your authentication state
4. Browser closes automatically when done

**Expected output:**
```
🔐 Starting authentication setup...
  ⏳ Please log in to your Google account...
  ✅ Login successful!
  💾 Saved browser state
✅ Authentication setup complete!
```

**If you see errors:**
- Make sure the browser window is visible (not headless)
- Ensure you have a stable internet connection
- Try: `python scripts/run.py auth_manager.py reauth`

### Step 3: Verify Authentication

Check that authentication worked:
```bash
python scripts/run.py auth_manager.py status
```

**Expected output:**
```
🔐 Authentication Status:
  Authenticated: Yes
  State age: 0.0 hours
  Last auth: 2026-01-14 01:36:24
```

### Step 4: Add Your First Notebook

You need at least one notebook in your library.

**Option A: Smart Add (Recommended)**

Let the system discover notebook content automatically:

```bash
# Step 1: Query the notebook to discover what's in it
python scripts/run.py ask_question.py \
  --question "What is the content of this notebook? What topics are covered? Provide a complete overview briefly and concisely" \
  --notebook-url "https://notebooklm.google.com/notebook/YOUR-NOTEBOOK-ID?authuser=1"

# Step 2: Based on the answer, add it with proper metadata
python scripts/run.py notebook_manager.py add \
  --url "https://notebooklm.google.com/notebook/YOUR-NOTEBOOK-ID?authuser=1" \
  --name "My Research Notebook" \
  --description "Contains research on AI automation and content creation" \
  --topics "ai,automation,research,content"
```

**Option B: Manual Add**

If you already know what's in the notebook:

```bash
python scripts/run.py notebook_manager.py add \
  --url "YOUR_NOTEBOOK_URL" \
  --name "Descriptive Name" \
  --description "What this notebook contains" \
  --topics "topic1,topic2,topic3"
```

### Step 5: Verify Notebook Library

List all notebooks:
```bash
python scripts/run.py notebook_manager.py list
```

**Expected output:**
```
📚 Loaded library with 1 notebooks

📚 Notebook Library:

  📓 My Research Notebook [ACTIVE]
     ID: my-research-notebook
     Topics: ai, automation, research, content
     Uses: 0
```

### Step 6: Test a Query

Ask your first question:
```bash
python scripts/run.py ask_question.py \
  --question "What are the main topics in this notebook?" \
  --notebook-id my-research-notebook
```

**If successful, you'll see:**
- Browser opening (briefly)
- Question being processed
- Detailed answer from NotebookLM
- Browser closing

**You're now fully set up!** ✅

---

## 🧠 Core Concepts

### Authentication Flow

```
First Time:
User → auth_manager.py setup → Browser Opens → Manual Google Login → State Saved

Subsequent Uses:
User → any script → Loads saved state → Accesses NotebookLM
```

**Key Points:**
- Authentication persists across sessions
- No need to log in again unless you clear state
- State stored securely in `data/browser_state/`

### Notebook Library System

```
Notebook Entry:
{
  "id": "my-notebook",
  "url": "https://notebooklm.google.com/notebook/...",
  "name": "My Notebook",
  "description": "What it contains",
  "topics": ["topic1", "topic2"],
  "created_at": "2026-01-14T...",
  "use_count": 5
}
```

**Key Points:**
- Each notebook has metadata (name, description, topics)
- IDs are auto-generated from names (lowercase, hyphens)
- One notebook can be "active" (used by default)
- Metadata is searchable and exportable

### Query Mechanism

```
Question Flow:
Question → Browser Automation → NotebookLM → Gemini Processing → Answer → Citation
```

**Key Points:**
- Each query opens a fresh browser session
- Answers are grounded exclusively in your uploaded documents
- Citations reference specific sources
- No cross-contamination between queries

### Data Persistence

```
Persistent Data:
- Notebook library (data/library.json)
- Query history (data/query_history.json)
- Authentication state (data/browser_state/)
- Exports (exports/ directory)
```

**Key Points:**
- All data stored locally
- Protected by .gitignore (not committed to git)
- Can be backed up via export commands
- Can be cleared/reset if needed

---

## 🖥️ Using in Claude Code

### What is Claude Code?

Claude Code is the official CLI tool from Anthropic that lets you interact with Claude from your terminal. The NotebookLM skill is installed as a Claude Code skill.

### Basic Usage

**In your terminal:**

```bash
# Start Claude Code session
claude

# In Claude Code, mention NotebookLM
> Query my notebooklm about AI frameworks

# Claude will automatically use the skill
```

**Claude Code will:**
1. Detect you mentioned NotebookLM
2. Check authentication status
3. List your notebooks
4. Run the appropriate script
5. Return the answer to you

### Advanced Usage

**Direct Script Execution:**

You can also run scripts directly:

```bash
# From anywhere, using the skill directly
python ~/.claude/skills/notebooklm/scripts/run.py ask_question.py \
  --question "Your question" \
  --notebook-id YOUR_ID

# Or navigate to the skill directory first
cd ~/.claude/skills/notebooklm
python scripts/run.py ask_question.py --question "Your question"
```

### Example Session in Claude Code

```
You: I need to query my NotebookLM about content frameworks

Claude: I'll query your NotebookLM notebook. Let me first check your library.

[Runs: python scripts/run.py notebook_manager.py list]

Claude: I see you have "NotebookLM Automation Manual" active. Let me query it.

[Runs: python scripts/run.py ask_question.py --question "What are the content frameworks discussed?" --notebook-id notebooklm-automation-manual]

Claude: Here's what I found:

The notebook discusses several content frameworks:
1. Goldie 6-in-1 Content Multiplier Framework...
2. Source-to-Asset Framework...
[etc.]

You: Can you export a report on this notebook?

Claude: I'll generate a comprehensive report.

[Runs: python scripts/run.py export_manager.py report --notebook-id notebooklm-automation-manual]

Claude: ✅ Report generated at: exports/notebooklm-automation-manual_report_20260114_031110.md

The report includes notebook metadata, usage statistics, and insights.
```

---

## 📝 Using in Cursor

### What is Cursor?

Cursor is an AI-powered IDE based on VS Code. You can use the NotebookLM skill through Cursor's terminal or via Claude integration.

### Method 1: Using Cursor Terminal

**Open terminal in Cursor** (Ctrl+` or Cmd+`)

```bash
# Navigate to skill directory
cd ~/.claude/skills/notebooklm

# Run any command
python scripts/run.py ask_question.py --question "Your question"
```

### Method 2: Using Cursor AI

If Cursor has Claude integration:

```
Cursor AI: "Query my NotebookLM about X"

[Cursor executes the skill commands via Claude]
```

### Method 3: Creating Cursor Tasks

Create a `.cursor/tasks.json` for quick access:

```json
{
  "tasks": [
    {
      "label": "NotebookLM: Query",
      "type": "shell",
      "command": "cd ~/.claude/skills/notebooklm && python scripts/run.py ask_question.py --question '${input:question}'"
    },
    {
      "label": "NotebookLM: Export Report",
      "type": "shell",
      "command": "cd ~/.claude/skills/notebooklm && python scripts/run.py export_manager.py report"
    },
    {
      "label": "NotebookLM: List Notebooks",
      "type": "shell",
      "command": "cd ~/.claude/skills/notebooklm && python scripts/run.py notebook_manager.py list"
    }
  ]
}
```

**Run tasks:** Cmd+Shift+P → "Tasks: Run Task" → Select task

### Method 4: VS Code Snippets

Create snippets in `.vscode/settings.json`:

```json
{
  "terminal.integrated.shellArgs.osx": ["-l"],
  "tasks": {
    "notebooklm-query": "cd ~/.claude/skills/notebooklm && python scripts/run.py ask_question.py"
  }
}
```

---

## 📚 Feature Reference

### Feature 1: Ask Question (Core)

**Purpose:** Query a notebook with a single question

**Command:**
```bash
python scripts/run.py ask_question.py \
  --question "Your question here" \
  [--notebook-id ID or --notebook-url URL] \
  [--show-browser]
```

**Options:**
- `--question`: The question to ask (required)
- `--notebook-id`: ID from your library (optional if active notebook set)
- `--notebook-url`: Direct URL (optional, bypasses library)
- `--show-browser`: Show browser window for debugging

**Example:**
```bash
python scripts/run.py ask_question.py \
  --question "What frameworks are discussed?" \
  --notebook-id my-notebook
```

**Output:**
- Text answer from NotebookLM
- Citations and sources
- "Is that ALL you need to know?" prompt for follow-ups

**When to use:**
- Single, focused questions
- Quick lookups
- Testing notebook content

---

### Feature 2: Notebook Manager (Core)

**Purpose:** Manage your notebook library

**Commands:**

**Add notebook:**
```bash
python scripts/run.py notebook_manager.py add \
  --url "NOTEBOOK_URL" \
  --name "Name" \
  --description "Description" \
  --topics "topic1,topic2"
```

**List notebooks:**
```bash
python scripts/run.py notebook_manager.py list
```

**Search notebooks:**
```bash
python scripts/run.py notebook_manager.py search --query "keyword"
```

**Activate notebook:**
```bash
python scripts/run.py notebook_manager.py activate --id NOTEBOOK_ID
```

**Remove notebook:**
```bash
python scripts/run.py notebook_manager.py remove --id NOTEBOOK_ID
```

**Show statistics:**
```bash
python scripts/run.py notebook_manager.py stats
```

**When to use:**
- Setting up your library
- Organizing multiple notebooks
- Finding the right notebook for a query

---

### Feature 3: Export Manager (v2.0)

**Purpose:** Export data and generate reports

**Commands:**

**Export notebook summary:**
```bash
python scripts/run.py export_manager.py summary --notebook-id ID
```

**Export all notebooks:**
```bash
python scripts/run.py export_manager.py export-all
```

**Generate markdown report:**
```bash
python scripts/run.py export_manager.py report [--notebook-id ID]
```

**Export source documents:**
```bash
python scripts/run.py export_manager.py sources --notebook-id ID
```

**Output locations:**
- JSON exports: `exports/*_summary_*.json`
- Markdown reports: `exports/*_report_*.md`
- Complete backups: `exports/notebooklm_complete_export_*.json`

**When to use:**
- Creating backups
- Sharing research with team
- Documenting findings
- Generating handoff reports

**Example output (report):**
```markdown
# NotebookLM Report: My Research

**Generated:** 2026-01-14 03:11:10

## Notebook Information
- ID: my-research
- Topics: ai, automation, research
- Total Queries: 15

## Usage Statistics
- Success Rate: 95%
- Queries Per Day: 2.5

## Query History
[List of recent queries...]

## Insights
- Active notebook with consistent usage
- Focus on technical frameworks
```

---

### Feature 4: Query History (v2.0)

**Purpose:** Track and analyze your queries

**Commands:**

**List recent queries:**
```bash
python scripts/run.py query_history.py list [--limit 20] [--notebook-id ID]
```

**Show statistics:**
```bash
python scripts/run.py query_history.py stats [--notebook-id ID]
```

**Search queries:**
```bash
python scripts/run.py query_history.py search --keyword "framework"
```

**Clear history:**
```bash
python scripts/run.py query_history.py clear [--notebook-id ID]
```

**Data format:**
```json
{
  "id": 1,
  "timestamp": "2026-01-14T03:00:00",
  "question": "What are the frameworks?",
  "notebook_id": "my-notebook",
  "answer_length": 2500,
  "success": true
}
```

**When to use:**
- Reviewing your research journey
- Finding previously asked questions
- Analyzing query patterns
- Understanding what you've explored

**Example output:**
```
📊 Query Statistics:

  Total Queries: 25
  Successful: 24
  Failed: 1
  Success Rate: 96.0%
  Avg Answer Length: 1850 chars
  First Query: 2026-01-10T08:30:00
  Last Query: 2026-01-14T15:45:00
```

---

### Feature 5: Batch Query (v2.0)

**Purpose:** Run multiple queries in one session

**Commands:**

**From file:**
```bash
python scripts/run.py batch_query.py run \
  --questions-file questions.txt \
  --notebook-id ID
```

**From command line:**
```bash
python scripts/run.py batch_query.py run \
  --questions "Question 1" "Question 2" "Question 3" \
  --notebook-id ID
```

**Generate report from results:**
```bash
python scripts/run.py batch_query.py report \
  --results-file exports/batch_query_TIMESTAMP.json
```

**Questions file format:**
```
What are the main topics?
What frameworks are discussed?
What are practical applications?
# Comments start with #
```

**Output:**
- `batch_query_TIMESTAMP.json` - Structured results
- `batch_query_TIMESTAMP.md` - Markdown report (if generated)

**When to use:**
- Deep research sessions
- Comprehensive notebook exploration
- Automated documentation generation
- Multiple related questions

**Example workflow:**
```bash
# 1. Create questions file
cat > deep_dive.txt << EOF
What is this notebook about?
What are the key concepts?
What are practical examples?
EOF

# 2. Run batch queries
python scripts/run.py batch_query.py run \
  --questions-file deep_dive.txt \
  --notebook-id my-notebook

# 3. Generate report
python scripts/run.py batch_query.py report \
  --results-file exports/batch_query_20260114_150000.json

# 4. Review outputs
open exports/batch_query_20260114_150000.md
```

---

## 🎯 Practical Workflows

### Workflow 1: First-Time Notebook Setup

**Goal:** Add and explore a new notebook

```bash
# Step 1: Discover content (Smart Add)
python scripts/run.py ask_question.py \
  --question "What is the content of this notebook? What topics are covered?" \
  --notebook-url "YOUR_NOTEBOOK_URL"

# Step 2: Add to library with discovered metadata
python scripts/run.py notebook_manager.py add \
  --url "YOUR_NOTEBOOK_URL" \
  --name "Research Notebook" \
  --description "[Based on step 1 answer]" \
  --topics "[Based on step 1 answer]"

# Step 3: Activate it
python scripts/run.py notebook_manager.py activate --id research-notebook

# Step 4: Explore with batch queries
cat > explore.txt << EOF
What sources are in this notebook?
What are the main frameworks or methodologies?
What are practical applications?
Who is the target audience?
EOF

python scripts/run.py batch_query.py run \
  --questions-file explore.txt \
  --notebook-id research-notebook

# Step 5: Generate initial report
python scripts/run.py export_manager.py report --notebook-id research-notebook

# Step 6: Review
open exports/research-notebook_report_*.md
open exports/batch_query_*.md
```

**Time:** ~10 minutes
**Output:** Fully configured notebook with comprehensive documentation

---

### Workflow 2: Daily Research Session

**Goal:** Query notebook, track progress, generate summary

```bash
# Morning: Check what you worked on yesterday
python scripts/run.py query_history.py list --limit 10

# Research: Ask questions as needed
python scripts/run.py ask_question.py \
  --question "How does X integrate with Y?"

python scripts/run.py ask_question.py \
  --question "What are best practices for Z?"

# End of day: Generate summary
python scripts/run.py export_manager.py report --notebook-id today-notebook
python scripts/run.py query_history.py stats --notebook-id today-notebook

# Review daily progress
open exports/today-notebook_report_*.md
```

**Time:** Ongoing throughout day
**Output:** Daily research summary and statistics

---

### Workflow 3: Comprehensive Research Report

**Goal:** Create detailed documentation from notebook

```bash
# Step 1: Plan your research questions
cat > comprehensive_research.txt << EOF
What is the purpose and scope of this system?
What are the key technical components?
What frameworks or methodologies are used?
What are implementation requirements?
What are practical examples and use cases?
How does this integrate with other systems?
What are best practices and recommendations?
What are limitations and considerations?
EOF

# Step 2: Run batch queries
python scripts/run.py batch_query.py run \
  --questions-file comprehensive_research.txt \
  --notebook-id TARGET_NOTEBOOK \
  --output exports/research_session_$(date +%Y%m%d).json

# Step 3: Generate multiple reports
python scripts/run.py batch_query.py report \
  --results-file exports/research_session_*.json

python scripts/run.py export_manager.py report \
  --notebook-id TARGET_NOTEBOOK

python scripts/run.py export_manager.py sources \
  --notebook-id TARGET_NOTEBOOK

# Step 4: Compile final report (manual)
cat exports/batch_query_*.md \
    exports/TARGET_NOTEBOOK_report_*.md \
    > final_comprehensive_report.md

# Step 5: Open and review
open final_comprehensive_report.md
```

**Time:** 15-30 minutes
**Output:** Multi-layered comprehensive research documentation

---

### Workflow 4: Weekly Backup and Review

**Goal:** Backup data and review usage patterns

```bash
# Weekly backup script
#!/bin/bash
# weekly_backup.sh

DATE=$(date +%Y%m%d)

# Export everything
python scripts/run.py export_manager.py export-all

# Generate reports for all notebooks
python scripts/run.py export_manager.py report

# Copy to backup location
mkdir -p ~/backups/notebooklm/$DATE
cp exports/* ~/backups/notebooklm/$DATE/
cp data/library.json ~/backups/notebooklm/$DATE/
cp data/query_history.json ~/backups/notebooklm/$DATE/

# Generate statistics
python scripts/run.py query_history.py stats > ~/backups/notebooklm/$DATE/stats.txt

echo "✅ Backup complete: ~/backups/notebooklm/$DATE"
```

**Run weekly:**
```bash
chmod +x weekly_backup.sh
./weekly_backup.sh
```

**Time:** 2 minutes (automated)
**Output:** Complete backup of all data and reports

---

### Workflow 5: Team Handoff Generation

**Goal:** Create comprehensive handoff for team member

```bash
# Step 1: Export complete library
python scripts/run.py export_manager.py export-all

# Step 2: Generate reports for all notebooks
for notebook in $(python scripts/run.py notebook_manager.py list | grep "ID:" | awk '{print $2}'); do
  python scripts/run.py export_manager.py report --notebook-id $notebook
  python scripts/run.py export_manager.py sources --notebook-id $notebook
done

# Step 3: Generate usage statistics
python scripts/run.py query_history.py stats > exports/usage_statistics.txt

# Step 4: Create handoff package
mkdir -p handoff_$(date +%Y%m%d)
cp exports/*.md handoff_$(date +%Y%m%d)/
cp exports/notebooklm_complete_export_*.json handoff_$(date +%Y%m%d)/
cp SKILL.md ENHANCEMENTS.md QUICKSTART_V2.md handoff_$(date +%Y%m%d)/

# Step 5: Create README for handoff
cat > handoff_$(date +%Y%m%d)/README.md << EOF
# NotebookLM Research Handoff

**Date:** $(date +%Y-%m-%d)
**Notebooks:** [List from library.json]

## Contents
- Complete notebook library export
- Individual notebook reports
- Source document lists
- Usage statistics
- Documentation

## Getting Started
1. Review QUICKSTART_V2.md
2. Read individual notebook reports
3. Check usage_statistics.txt for patterns
4. Follow SKILL.md for daily usage

## Questions?
See ENHANCEMENTS.md for complete feature documentation.
EOF

# Step 6: Package it
zip -r handoff_$(date +%Y%m%d).zip handoff_$(date +%Y%m%d)

echo "✅ Handoff package created: handoff_$(date +%Y%m%d).zip"
```

**Time:** 5-10 minutes
**Output:** Complete handoff package ready to share

---

## 🔧 Troubleshooting

### Issue 1: Authentication Fails

**Symptoms:**
- Browser doesn't open
- "Authentication failed" error
- Can't access notebooks

**Solutions:**

```bash
# 1. Check current status
python scripts/run.py auth_manager.py status

# 2. Clear and re-authenticate
python scripts/run.py auth_manager.py clear
python scripts/run.py auth_manager.py setup

# 3. If browser doesn't appear, try with visible browser
python scripts/run.py auth_manager.py setup --show-browser

# 4. Check browser state directory
ls -la data/browser_state/

# 5. If all else fails, delete browser state and start over
rm -rf data/browser_state/
python scripts/run.py auth_manager.py setup
```

**Prevention:**
- Don't clear browser cookies manually
- Keep internet connection stable during auth
- Ensure browser window stays open during login

---

### Issue 2: "Notebook Not Found" Error

**Symptoms:**
- Error when querying: "Notebook 'xyz' not found"
- Empty library when listing

**Solutions:**

```bash
# 1. List all notebooks to check IDs
python scripts/run.py notebook_manager.py list

# 2. Check the exact ID (case-sensitive, uses hyphens)
# ID is generated from name: "My Notebook" → "my-notebook"

# 3. If notebook missing, re-add it
python scripts/run.py notebook_manager.py add \
  --url "NOTEBOOK_URL" \
  --name "My Notebook" \
  --description "Description" \
  --topics "topics"

# 4. Set as active if needed
python scripts/run.py notebook_manager.py activate --id my-notebook

# 5. Verify library file
cat data/library.json | jq '.'
```

**Prevention:**
- Always use `notebook_manager.py list` to get correct IDs
- Don't manually edit `library.json`
- Use tab completion if your shell supports it

---

### Issue 3: Scripts Won't Run / ModuleNotFoundError

**Symptoms:**
- `ModuleNotFoundError: No module named 'playwright'`
- Scripts fail immediately
- Import errors

**Solutions:**

```bash
# 1. ALWAYS use run.py wrapper, never call scripts directly
# ❌ WRONG:
python scripts/auth_manager.py status

# ✅ CORRECT:
python scripts/run.py auth_manager.py status

# 2. If still failing, manually rebuild venv
cd ~/.claude/skills/notebooklm
rm -rf .venv
python scripts/run.py auth_manager.py status  # Will rebuild

# 3. Check Python version
python --version  # Should be 3.8+

# 4. Manual venv setup (last resort)
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
python -m patchright install chromium
```

**Prevention:**
- Always use `python scripts/run.py [script]` format
- Don't activate venv manually
- Let run.py handle environment

---

### Issue 4: Queries Timeout or Fail

**Symptoms:**
- "Timed out waiting for answer"
- Browser crashes
- No response after long wait

**Solutions:**

```bash
# 1. Check internet connection
ping google.com

# 2. Increase timeout (for complex questions)
# Edit scripts/ask_question.py timeout parameter

# 3. Try with visible browser to see what's happening
python scripts/run.py ask_question.py \
  --question "Your question" \
  --show-browser

# 4. Simplify the question
# Instead of: "Provide comprehensive analysis..."
# Try: "What are the main topics?"

# 5. Clear browser state and re-auth
python scripts/run.py cleanup_manager.py --confirm
python scripts/run.py auth_manager.py setup

# 6. Check NotebookLM directly in browser
# Make sure the notebook loads and queries work manually
```

**Prevention:**
- Keep questions focused and specific
- Check NotebookLM is working in regular browser first
- Monitor rate limits (50 queries/day on free tier)

---

### Issue 5: Exports/Reports Not Generated

**Symptoms:**
- "No such file or directory" for exports
- Reports command succeeds but no file created
- Empty exports directory

**Solutions:**

```bash
# 1. Check exports directory exists
ls -la ~/.claude/skills/notebooklm/exports/

# 2. Create if missing
mkdir -p ~/.claude/skills/notebooklm/exports

# 3. Check permissions
chmod 755 ~/.claude/skills/notebooklm/exports

# 4. Run export with full path
cd ~/.claude/skills/notebooklm
python scripts/run.py export_manager.py report --notebook-id ID

# 5. Check for error messages in output
python scripts/run.py export_manager.py report --notebook-id ID 2>&1 | tee export.log

# 6. Verify notebook ID is correct
python scripts/run.py notebook_manager.py list
```

**Prevention:**
- Use correct notebook IDs
- Ensure exports directory isn't deleted
- Run scripts from skill directory or use full paths

---

### Issue 6: Rate Limit Errors

**Symptoms:**
- "Rate limit exceeded"
- "Too many requests"
- Queries start failing after many successes

**Solutions:**

```bash
# 1. Check how many queries you've made today
python scripts/run.py query_history.py stats

# 2. Wait or switch Google accounts
# Free NotebookLM: 50 queries/day limit

# 3. Use batch queries more efficiently
# Instead of 20 individual queries, batch them:
python scripts/run.py batch_query.py run \
  --questions "Q1" "Q2" "Q3" [...]

# 4. Plan queries ahead of time
# Create question files to avoid wasted queries
cat > planned_questions.txt << EOF
[List all questions before running]
EOF

# 5. Consider NotebookLM Plus for higher limits
```

**Prevention:**
- Track queries with query_history
- Plan research sessions ahead
- Use batch queries for efficiency
- Consider upgrading NotebookLM plan

---

## 🎓 Advanced Usage

### Custom Automation Scripts

Create your own automation scripts:

```bash
#!/bin/bash
# auto_research.sh

NOTEBOOK_ID="my-research"
DATE=$(date +%Y%m%d)

# Run daily questions
python scripts/run.py batch_query.py run \
  --questions-file daily_questions_$DATE.txt \
  --notebook-id $NOTEBOOK_ID

# Generate report
python scripts/run.py export_manager.py report --notebook-id $NOTEBOOK_ID

# Email summary (example)
python scripts/run.py query_history.py stats --notebook-id $NOTEBOOK_ID | \
  mail -s "Research Summary $DATE" user@example.com
```

### JSON Processing with jq

Process exports programmatically:

```bash
# Extract all questions from history
cat data/query_history.json | jq '.[].question'

# Get queries for specific notebook
cat data/query_history.json | jq '.[] | select(.notebook_id=="my-notebook")'

# Calculate success rate
cat data/query_history.json | jq '[.[] | select(.success==true)] | length'

# Export to CSV
cat data/query_history.json | jq -r '.[] | [.timestamp, .question, .success] | @csv'

# Find failed queries
cat data/query_history.json | jq '.[] | select(.success==false)'
```

### Integration with Other Tools

**Obsidian Integration:**
```bash
# Export to Obsidian vault
python scripts/run.py export_manager.py report --notebook-id ID
cp exports/*_report_*.md ~/ObsidianVault/NotebookLM/
```

**Git Integration:**
```bash
# Auto-commit research progress
cd ~/.claude/skills/notebooklm
git add exports/*_report_*.md
git commit -m "Research update $(date +%Y%m%d)"
```

**Slack Integration:**
```bash
# Post research summary to Slack
SUMMARY=$(python scripts/run.py query_history.py stats)
curl -X POST -H 'Content-type: application/json' \
  --data "{\"text\":\"$SUMMARY\"}" \
  YOUR_SLACK_WEBHOOK_URL
```

### Environment Variables

Create `.env` file for custom configuration:

```bash
# .env in skill directory
HEADLESS=false           # Show browser
SHOW_BROWSER=false       # Default browser display
STEALTH_ENABLED=true     # Human-like behavior
TYPING_WPM_MIN=160       # Typing speed
TYPING_WPM_MAX=240
DEFAULT_NOTEBOOK_ID=my-research  # Default notebook
```

### Programmatic Usage

Use the scripts in your own Python code:

```python
#!/usr/bin/env python3
import sys
sys.path.append('/Users/steven/.claude/skills/notebooklm/scripts')

from notebook_manager import NotebookLibrary
from query_history import QueryHistory

# Load library
library = NotebookLibrary()
notebooks = library.list_notebooks()

# Check history
history = QueryHistory()
stats = history.get_stats()

print(f"You have {len(notebooks)} notebooks")
print(f"Total queries: {stats['total_queries']}")
```

---

## 🛠️ Maintenance

### Regular Maintenance Tasks

**Weekly:**
```bash
# Backup data
python scripts/run.py export_manager.py export-all

# Review statistics
python scripts/run.py query_history.py stats

# Check authentication
python scripts/run.py auth_manager.py status
```

**Monthly:**
```bash
# Archive old exports
mkdir -p archives/exports_$(date +%Y%m)
mv exports/* archives/exports_$(date +%Y%m)/

# Review and clean query history if too large
# (optional - history is useful for analytics)
```

**As Needed:**
```bash
# Clear browser cache if experiencing issues
python scripts/run.py cleanup_manager.py --preserve-library

# Re-authenticate if session expires
python scripts/run.py auth_manager.py reauth

# Update notebook metadata
python scripts/run.py notebook_manager.py remove --id old-id
python scripts/run.py notebook_manager.py add [new metadata]
```

### Updating the Skill

If updates are released:

```bash
cd ~/.claude/skills/notebooklm

# Backup your data first
cp -r data data_backup_$(date +%Y%m%d)
cp -r exports exports_backup_$(date +%Y%m%d)

# Pull updates (if using git)
git pull

# Reinstall dependencies
rm -rf .venv
python scripts/run.py auth_manager.py status  # Rebuilds venv

# Restore data if needed
cp -r data_backup_*/library.json data/
cp -r data_backup_*/query_history.json data/
```

### Data Management

**View data sizes:**
```bash
du -sh data/
du -sh exports/
du -sh .venv/
```

**Cleanup old exports:**
```bash
# Keep last 30 days only
find exports/ -type f -mtime +30 -delete
```

**Backup to cloud:**
```bash
# Example: Backup to Dropbox
cp -r data ~/Dropbox/notebooklm_backup_$(date +%Y%m%d)
```

---

## 📖 Quick Reference Card

### Most Common Commands

```bash
# Authentication
python scripts/run.py auth_manager.py status
python scripts/run.py auth_manager.py setup

# Library Management
python scripts/run.py notebook_manager.py list
python scripts/run.py notebook_manager.py add --url URL --name NAME --description DESC --topics TOPICS

# Querying
python scripts/run.py ask_question.py --question "QUESTION" --notebook-id ID

# Exporting
python scripts/run.py export_manager.py report --notebook-id ID
python scripts/run.py export_manager.py export-all

# Analytics
python scripts/run.py query_history.py list
python scripts/run.py query_history.py stats

# Batch Processing
python scripts/run.py batch_query.py run --questions-file FILE --notebook-id ID
```

### File Locations

```bash
# Skill directory
~/.claude/skills/notebooklm/

# Your data
~/.claude/skills/notebooklm/data/library.json
~/.claude/skills/notebooklm/data/query_history.json

# Exports
~/.claude/skills/notebooklm/exports/

# Documentation
~/.claude/skills/notebooklm/SKILL.md
~/.claude/skills/notebooklm/ENHANCEMENTS.md
```

### Getting Help

- **Core Docs:** `SKILL.md`
- **New Features:** `ENHANCEMENTS.md`
- **Quick Start:** `QUICKSTART_V2.md`
- **This Guide:** `HANDOFF_COMPLETE.md`
- **Troubleshooting:** `references/troubleshooting.md`

---

## 🎯 Next Steps

1. **Complete Initial Setup** (15 minutes)
   - Authenticate
   - Add first notebook
   - Run test query

2. **Try Each Feature** (30 minutes)
   - Export a report
   - Check query history
   - Run batch queries

3. **Create Your Workflow** (1 hour)
   - Identify your research patterns
   - Build question templates
   - Set up automation scripts

4. **Integrate with Your Tools** (ongoing)
   - Add to Cursor tasks
   - Create shortcuts
   - Build custom scripts

---

## 🤝 Support and Community

### Getting Help

1. Read documentation in order:
   - `QUICKSTART_V2.md` → `SKILL.md` → `ENHANCEMENTS.md` → This file

2. Check troubleshooting section above

3. Review inline code documentation:
   ```bash
   python scripts/run.py ask_question.py --help
   ```

4. Search query history for similar questions:
   ```bash
   python scripts/run.py query_history.py search --keyword "your issue"
   ```

### Contributing

If you enhance the skill:
1. Document changes in script comments
2. Update relevant .md files
3. Test thoroughly
4. Create examples in `references/`

---

## 📊 Success Metrics

You'll know the skill is working well when:

✅ Authentication persists across sessions
✅ Queries return accurate, source-grounded answers
✅ Export reports are comprehensive and useful
✅ Query history tracks all activity
✅ Batch queries complete without errors
✅ Integration with Claude Code/Cursor is seamless

---

## 🎓 Learning Path

### Week 1: Basics
- [ ] Complete initial setup
- [ ] Add 2-3 notebooks
- [ ] Run 10+ queries
- [ ] Generate first report

### Week 2: Features
- [ ] Try all export features
- [ ] Review query history
- [ ] Run first batch query
- [ ] Create question templates

### Week 3: Automation
- [ ] Build custom scripts
- [ ] Set up regular backups
- [ ] Create Cursor/Code tasks
- [ ] Optimize workflows

### Week 4: Mastery
- [ ] Full research session with exports
- [ ] Team handoff generation
- [ ] Advanced JSON processing
- [ ] Custom integrations

---

## 🎉 Conclusion

You now have everything you need to:
- ✅ Use the NotebookLM skill in Claude Code or Cursor
- ✅ Query notebooks effectively
- ✅ Track and analyze research
- ✅ Generate comprehensive reports
- ✅ Automate research workflows
- ✅ Integrate with your development environment

**This is a production-ready research management system.**

Start with `QUICKSTART_V2.md` for your first 5 minutes, then dive deeper into features as needed.

---

**Version:** 2.0
**Last Updated:** 2026-01-14
**Maintained By:** Steven Chaplinski Digital Empire
**Powered By:** NotebookLM + Gemini + Patchright + Python

*Transforming research into actionable intelligence* 🚀
