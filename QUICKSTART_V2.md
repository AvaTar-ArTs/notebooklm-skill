# NotebookLM Skill v2.0 - Quick Start Guide

**Get started with the enhanced NotebookLM skill in 5 minutes!**

---

## ⚡ Quick Setup

1. **Check Authentication** (if not already done):
   ```bash
   python scripts/run.py auth_manager.py status
   ```

2. **Add a Notebook** (if none exist):
   ```bash
   python scripts/run.py notebook_manager.py add \
     --url "YOUR_NOTEBOOK_URL" \
     --name "My Research" \
     --description "My research notebook" \
     --topics "research,notes"
   ```

3. **You're ready to use the new features!**

---

## 🚀 Try the New Features

### Feature 1: Generate a Report (30 seconds)

```bash
python scripts/run.py export_manager.py report \
  --notebook-id YOUR_NOTEBOOK_ID
```

**What you get:** A professional markdown report with notebook metadata, topics, and insights.

**Output:** `exports/YOUR_NOTEBOOK_ID_report_TIMESTAMP.md`

---

### Feature 2: Check Your Query History (10 seconds)

```bash
python scripts/run.py query_history.py stats
```

**What you get:** Statistics on your queries including success rate, total queries, and usage patterns.

---

### Feature 3: Run Batch Queries (2 minutes)

**Step 1:** Create a questions file:
```bash
cat > questions.txt << EOF
What are the main topics in this notebook?
What sources are included?
What are practical applications?
EOF
```

**Step 2:** Run the batch query:
```bash
python scripts/run.py batch_query.py run \
  --questions-file questions.txt \
  --notebook-id YOUR_NOTEBOOK_ID
```

**What you get:** All answers in one JSON file, plus a markdown report.

**Output:** `exports/batch_query_TIMESTAMP.json` and `exports/batch_query_TIMESTAMP.md`

---

## 🎯 Common Workflows

### Workflow 1: Comprehensive Notebook Export

```bash
# Export everything about a notebook
python scripts/run.py export_manager.py summary \
  --notebook-id YOUR_NOTEBOOK_ID
```

**Use case:** Backup, sharing with team, documentation

---

### Workflow 2: Research Session Documentation

```bash
# After a research session, generate report
python scripts/run.py export_manager.py report

# Check what you queried
python scripts/run.py query_history.py list --limit 10
```

**Use case:** Document your research process, review findings

---

### Workflow 3: Deep Dive Exploration

```bash
# 1. Create comprehensive questions
cat > deep_dive.txt << EOF
What is the purpose of this notebook?
What frameworks or methodologies are discussed?
What are the key concepts?
What are implementation details?
What are practical examples?
EOF

# 2. Run batch queries
python scripts/run.py batch_query.py run \
  --questions-file deep_dive.txt \
  --notebook-id YOUR_NOTEBOOK_ID

# 3. Generate report
python scripts/run.py batch_query.py report \
  --results-file exports/batch_query_*.json
```

**Use case:** First-time notebook exploration, comprehensive research

---

## 📋 Command Cheat Sheet

### Export Commands
```bash
# Single notebook summary
python scripts/run.py export_manager.py summary --notebook-id ID

# All notebooks backup
python scripts/run.py export_manager.py export-all

# Markdown report
python scripts/run.py export_manager.py report [--notebook-id ID]

# Source documents list
python scripts/run.py export_manager.py sources --notebook-id ID
```

### Query History Commands
```bash
# List recent queries
python scripts/run.py query_history.py list [--limit 20]

# Show statistics
python scripts/run.py query_history.py stats [--notebook-id ID]

# Search queries
python scripts/run.py query_history.py search --keyword WORD

# Clear history
python scripts/run.py query_history.py clear
```

### Batch Query Commands
```bash
# From file
python scripts/run.py batch_query.py run \
  --questions-file FILE --notebook-id ID

# From command line
python scripts/run.py batch_query.py run \
  --questions "Q1" "Q2" "Q3" --notebook-id ID

# Generate report
python scripts/run.py batch_query.py report --results-file FILE
```

---

## 💡 Pro Tips

### Tip 1: Automate Regular Exports

Create a daily backup script:
```bash
#!/bin/bash
# daily_backup.sh
python scripts/run.py export_manager.py export-all
python scripts/run.py query_history.py stats > daily_stats.txt
```

### Tip 2: Use Batch Queries for Templates

Create question templates for different research types:
- `questions_technical.txt` - Technical deep dives
- `questions_overview.txt` - High-level summaries
- `questions_practical.txt` - Implementation details

### Tip 3: Combine Features

```bash
# Complete research workflow
python scripts/run.py batch_query.py run --questions-file q.txt --notebook-id ID
python scripts/run.py export_manager.py report --notebook-id ID
python scripts/run.py query_history.py stats --notebook-id ID
```

---

## 🔍 Where Files Are Saved

- **Exports:** `~/.claude/skills/notebooklm/exports/`
- **Query History:** `~/.claude/skills/notebooklm/data/query_history.json`
- **Notebook Library:** `~/.claude/skills/notebooklm/data/library.json`

---

## 📚 Next Steps

1. **Try all three new features** (takes 5 minutes total)
2. **Read** `ENHANCEMENTS.md` for complete documentation
3. **Explore** advanced workflows and automation
4. **Customize** to fit your research needs

---

## ❓ Need Help?

- **Core documentation:** `SKILL.md`
- **New features:** `ENHANCEMENTS.md`
- **Troubleshooting:** `references/troubleshooting.md`
- **Examples:** `references/usage_patterns.md`

---

**Welcome to NotebookLM v2.0!** 🎉

*Transforming research into actionable intelligence*
