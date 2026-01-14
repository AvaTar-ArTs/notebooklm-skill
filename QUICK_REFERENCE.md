# NotebookLM Skill - Quick Reference Card

**Version:** v2.0 | **Updated:** Jan 14, 2026  
**Print this page or pin it for quick access!**

---

## ⚡ Most Common Commands

### Query a Notebook
```bash
# Use active notebook
python scripts/run.py ask_question.py --question "Your question here"

# Specific notebook
python scripts/run.py ask_question.py --question "..." --notebook-id NOTEBOOK_ID

# Show browser (debugging)
python scripts/run.py ask_question.py --question "..." --show-browser
```

### Manage Notebooks
```bash
# List all notebooks
python scripts/run.py notebook_manager.py list

# Add notebook (smart discovery)
python scripts/run.py ask_question.py \
  --question "What is this notebook about? Brief overview." \
  --notebook-url "https://notebooklm.google.com/notebook/..."
# Then use discovered info to add:
python scripts/run.py notebook_manager.py add \
  --url "..." --name "..." --description "..." --topics "a,b,c"

# Search notebooks
python scripts/run.py notebook_manager.py search --query "keyword"

# Set active notebook
python scripts/run.py notebook_manager.py activate --id NOTEBOOK_ID

# Show stats
python scripts/run.py notebook_manager.py stats
```

### Authentication
```bash
# Check status
python scripts/run.py auth_manager.py status

# Setup (first time - browser opens)
python scripts/run.py auth_manager.py setup

# Re-authenticate
python scripts/run.py auth_manager.py reauth

# Clear auth data
python scripts/run.py auth_manager.py clear
```

---

## 📊 v2.0 Features (New!)

### Generate Reports
```bash
# Notebook summary (JSON)
python scripts/run.py export_manager.py summary --notebook-id ID

# Markdown report
python scripts/run.py export_manager.py report --notebook-id ID

# Library-wide report
python scripts/run.py export_manager.py report

# Full backup
python scripts/run.py export_manager.py export-all
```

### Query History
```bash
# Recent queries
python scripts/run.py query_history.py list --limit 20

# Statistics
python scripts/run.py query_history.py stats

# Search history
python scripts/run.py query_history.py search --keyword "automation"

# Clear history
python scripts/run.py query_history.py clear
```

### Batch Queries
```bash
# From file
cat > questions.txt << EOF
Question 1 here
Question 2 here
Question 3 here
EOF
python scripts/run.py batch_query.py run \
  --questions-file questions.txt \
  --notebook-id ID

# From command line
python scripts/run.py batch_query.py run \
  --questions "Q1" "Q2" "Q3" \
  --notebook-id ID

# Generate report from batch results
python scripts/run.py batch_query.py report \
  --results-file exports/batch_query_TIMESTAMP.json
```

---

## 🗂️ File Locations

### Data Storage
```
~/.claude/skills/notebooklm/data/
├── library.json            # Your notebook library
├── query_history.json      # All queries tracked
├── auth_info.json          # Auth metadata
└── browser_state/          # Browser cookies
```

### Generated Files
```
~/.claude/skills/notebooklm/exports/
├── *_report_*.md           # Markdown reports
├── *_summary_*.json        # Notebook summaries
├── batch_query_*.json      # Batch results
└── notebooklm_complete_export_*.json
```

---

## 🔧 Maintenance

### Cleanup
```bash
# Preview what will be deleted
python scripts/run.py cleanup_manager.py

# Delete everything except library
python scripts/run.py cleanup_manager.py --confirm --preserve-library

# Nuclear option (everything)
python scripts/run.py cleanup_manager.py --confirm
```

### Environment
```bash
# Check venv status
python scripts/run.py setup_environment.py --check

# Recreate venv (if corrupted)
cd ~/.claude/skills/notebooklm
rm -rf .venv
python scripts/run.py setup_environment.py
```

---

## 🚨 Troubleshooting

| Problem | Solution |
|---------|----------|
| **ModuleNotFoundError** | Always use `python scripts/run.py [script]` |
| **Auth expired** | `python scripts/run.py auth_manager.py reauth` |
| **Browser crashes** | `python scripts/run.py cleanup_manager.py --confirm` |
| **Notebook not found** | Check: `python scripts/run.py notebook_manager.py list` |
| **Rate limit (50/day)** | Wait 24 hours or use different Google account |

---

## 📁 Your Current Notebooks

```
1. notebooklm-automation-manual [ACTIVE]
   ID: notebooklm-automation-manual
   Topics: notebooklm, ai-automation, content-creation

2. digital-empire-blueprint-2025
   ID: digital-empire-blueprint-2025
   Topics: aeo, quantum-ml, scalability

3. digital-empire-operations-manual
   ID: digital-empire-operations-manual
   Topics: revenue-orchestration, automation, mcp
```

---

## 💡 Pro Tips

1. **Include context in questions** - Each query is independent (stateless)
2. **Ask follow-ups** - When answer says "Is that ALL you need?", ask more!
3. **Use batch queries** - For comprehensive research (5+ related questions)
4. **Generate reports** - Document your research automatically
5. **Set active notebook** - Skip `--notebook-id` for common notebook

---

## 🎯 Common Workflows

### Research Session
```bash
# 1. Activate your notebook
python scripts/run.py notebook_manager.py activate --id my-notebook

# 2. Ask questions (no --notebook-id needed)
python scripts/run.py ask_question.py --question "..."
python scripts/run.py ask_question.py --question "Follow-up question..."

# 3. Generate report when done
python scripts/run.py export_manager.py report --notebook-id my-notebook

# 4. Check your stats
python scripts/run.py query_history.py stats
```

### Comprehensive Notebook Exploration
```bash
# 1. Create questions file
cat > deep_dive.txt << EOF
What is this notebook about?
What are the key concepts covered?
What are practical examples or case studies?
What are best practices mentioned?
What tools or resources are referenced?
EOF

# 2. Run batch query
python scripts/run.py batch_query.py run \
  --questions-file deep_dive.txt \
  --notebook-id my-notebook

# 3. Results saved to exports/batch_query_TIMESTAMP.json
```

### Weekly Review
```bash
# Generate reports for all notebooks
python scripts/run.py export_manager.py report

# Check usage stats
python scripts/run.py query_history.py stats

# List recent queries
python scripts/run.py query_history.py list --limit 50

# Backup library
python scripts/run.py export_manager.py export-all
```

---

## 🎨 Custom Templates

### Create Template for POD Research
```bash
mkdir -p ~/.claude/skills/notebooklm/templates

cat > ~/.claude/skills/notebooklm/templates/pod-design.txt << EOF
What are current trending keywords for print-on-demand?
What typography styles work best for viral designs?
What are successful POD campaign examples from the sources?
What design mistakes should I avoid?
What tools are recommended for POD creators?
What are the best practices for SEO optimization?
EOF

# Use template
python scripts/run.py batch_query.py run \
  --questions-file templates/pod-design.txt \
  --notebook-id notebooklm-automation-manual
```

### Create Template for Automation Strategy
```bash
cat > ~/.claude/skills/notebooklm/templates/automation-strategy.txt << EOF
What are the core automation strategies discussed?
What tools and platforms are recommended?
What are the implementation steps for automation?
What are common pitfalls to avoid?
What ROI metrics should I track?
EOF
```

---

## ⌨️ Keyboard Shortcuts (if interactive menu implemented)

```
Main Menu:
  1-6 : Select menu option
  q   : Quit
  h   : Help
  r   : Refresh

Query Interface:
  Ctrl+C : Cancel query
  Ctrl+D : Exit
  ↑/↓    : Command history
```

---

## 📞 Getting Help

1. **Documentation**
   - `README.md` - User guide
   - `SKILL.md` - Claude instructions
   - `references/troubleshooting.md` - Common issues

2. **Analysis Reports** (NEW!)
   - `HANDOFF_ANALYSIS.md` - Executive summary
   - `IMPROVEMENT_ROADMAP.md` - Detailed enhancement specs

3. **GitHub**
   - Issues: https://github.com/PleasePrompto/notebooklm-skill/issues
   - Discussions: https://github.com/PleasePrompto/notebooklm-skill/discussions

---

## 🔄 Update Skill

```bash
cd ~/.claude/skills/notebooklm
git pull origin master

# If dependencies updated
python scripts/run.py setup_environment.py
```

---

## 📊 One-Liner Status Check

```bash
python scripts/run.py auth_manager.py status && \
python scripts/run.py notebook_manager.py list && \
python scripts/run.py query_history.py stats
```

**Output:**
```
🔐 Authentication Status:
  Authenticated: Yes
  State age: 1.4 hours
  ...

📚 Notebook Library:
  1. notebooklm-automation-manual [ACTIVE]
  2. digital-empire-blueprint-2025
  3. digital-empire-operations-manual

📊 Query Statistics:
  Total Queries: 47
  Success Rate: 95.7%
  ...
```

---

## 🎓 Command Syntax Reference

### Always use the runner
```bash
# ✅ CORRECT
python scripts/run.py [script_name] [args...]

# ❌ WRONG (missing venv!)
python scripts/[script_name] [args...]
```

### Common Arguments
```
--question "..."        # Query text
--notebook-id ID        # Specific notebook
--notebook-url URL      # Direct URL (bypass library)
--show-browser          # Visible browser (debugging)
--limit N               # Limit results
--output FILE           # Output file path
--confirm               # Skip confirmation prompts
```

---

**Keep this reference handy!**  
**Most used:** `ask_question.py`, `notebook_manager.py list`, `query_history.py stats`

---

*Quick Reference Card - NotebookLM Skill v2.0*  
*Last updated: Jan 14, 2026*
