# NotebookLM Skill Enhancements

**Enhanced:** 2026-01-14
**Version:** 2.0

---

## 🎯 Overview

The NotebookLM skill has been significantly enhanced with powerful new features for export management, query tracking, batch processing, and analytics. These improvements transform the skill from a simple query interface into a comprehensive research and knowledge management system.

---

## ✨ New Features

### 1. Export Manager (`export_manager.py`)

Comprehensive export and reporting capabilities for your NotebookLM data.

**Features:**
- **Notebook Summaries:** Export detailed JSON summaries of individual notebooks
- **Complete Library Export:** Full backup of all notebooks and query history
- **Markdown Reports:** Human-readable reports in markdown format
- **Source Lists:** Query and export all source documents in a notebook
- **Statistics:** Detailed usage analytics and insights

**Commands:**

```bash
# Export summary for a single notebook
python scripts/run.py export_manager.py summary --notebook-id NOTEBOOK_ID

# Export entire library
python scripts/run.py export_manager.py export-all

# Generate markdown report
python scripts/run.py export_manager.py report --notebook-id NOTEBOOK_ID

# Export sources list
python scripts/run.py export_manager.py sources --notebook-id NOTEBOOK_ID
```

**Output Location:** `exports/` directory

**Use Cases:**
- Backup your notebook metadata
- Create shareable reports
- Analyze usage patterns
- Document your research process
- Generate handoffs for team members

---

### 2. Query History Tracker (`query_history.py`)

Tracks every query made to your notebooks for analytics and insights.

**Features:**
- **Automatic Tracking:** Records all queries with timestamps
- **Search History:** Find past queries by keyword
- **Statistics:** Success rates, average answer lengths, usage patterns
- **Filtering:** View queries by notebook, date range, or status
- **Analytics:** Today's queries, this week's queries, trends

**Commands:**

```bash
# List recent queries
python scripts/run.py query_history.py list --limit 20

# Show statistics
python scripts/run.py query_history.py stats

# Filter by notebook
python scripts/run.py query_history.py list --notebook-id NOTEBOOK_ID

# Search queries
python scripts/run.py query_history.py search --keyword "keyword"

# Clear history
python scripts/run.py query_history.py clear
```

**Data Storage:** `data/query_history.json`

**Use Cases:**
- Track your research journey
- Identify frequently asked questions
- Analyze query patterns
- Audit notebook usage
- Optimize query strategies

---

### 3. Batch Query Manager (`batch_query.py`)

Run multiple queries in sequence and compile comprehensive results.

**Features:**
- **Bulk Querying:** Ask multiple questions in one session
- **File Input:** Load questions from text file
- **Command Line:** Provide questions directly
- **Comprehensive Results:** Compiled JSON output with all Q&A
- **Report Generation:** Markdown reports from batch results
- **Error Handling:** Graceful failure with detailed error logs

**Commands:**

```bash
# Run from file (one question per line)
python scripts/run.py batch_query.py run \
  --questions-file questions.txt \
  --notebook-id NOTEBOOK_ID

# Run from command line
python scripts/run.py batch_query.py run \
  --questions "Question 1" "Question 2" "Question 3" \
  --notebook-id NOTEBOOK_ID

# Generate report from results
python scripts/run.py batch_query.py report \
  --results-file exports/batch_query_20260114_123456.json
```

**Output:**
- `batch_query_TIMESTAMP.json` - Structured results
- `batch_query_TIMESTAMP.md` - Human-readable report

**Use Cases:**
- Deep research sessions with multiple related questions
- Comprehensive notebook exploration
- Automated documentation generation
- Content creation workflows
- Research report compilation

---

## 🔄 Integration

### Query History Integration

The query history system can be integrated with `ask_question.py` for automatic tracking:

```python
# In ask_question.py, after successful query:
from query_history import QueryHistory
history = QueryHistory()
history.add_query(
    question=question,
    notebook_id=notebook_id,
    answer_length=len(answer),
    success=True
)
```

### Export Automation

Combine export manager with batch queries for comprehensive research sessions:

```bash
# 1. Run batch queries
python scripts/run.py batch_query.py run \
  --questions-file research_questions.txt \
  --notebook-id my-notebook

# 2. Generate report
python scripts/run.py export_manager.py report --notebook-id my-notebook

# 3. Export complete summary
python scripts/run.py export_manager.py summary --notebook-id my-notebook
```

---

## 📊 Enhanced Workflows

### Workflow 1: Comprehensive Research Session

```bash
# 1. Check notebook library
python scripts/run.py notebook_manager.py list

# 2. Activate target notebook
python scripts/run.py notebook_manager.py activate --id NOTEBOOK_ID

# 3. Run batch queries
python scripts/run.py batch_query.py run \
  --questions-file questions.txt \
  --notebook-id NOTEBOOK_ID

# 4. Review query history
python scripts/run.py query_history.py list --notebook-id NOTEBOOK_ID

# 5. Generate comprehensive report
python scripts/run.py export_manager.py report --notebook-id NOTEBOOK_ID

# 6. Export sources
python scripts/run.py export_manager.py sources --notebook-id NOTEBOOK_ID
```

### Workflow 2: Weekly Research Review

```bash
# View this week's activity
python scripts/run.py query_history.py stats

# Generate weekly report
python scripts/run.py export_manager.py report

# Backup everything
python scripts/run.py export_manager.py export-all
```

### Workflow 3: New Notebook Deep Dive

```bash
# 1. Add notebook with smart discovery
python scripts/run.py ask_question.py \
  --question "What is this notebook about?" \
  --notebook-url URL

python scripts/run.py notebook_manager.py add \
  --url URL \
  --name "Name" \
  --description "Description" \
  --topics "topic1,topic2"

# 2. Comprehensive exploration
python scripts/run.py batch_query.py run \
  --questions "What sources are in this notebook?" \
          "What are the main topics covered?" \
          "What frameworks or methodologies are discussed?" \
          "What are practical applications?" \
  --notebook-id NOTEBOOK_ID

# 3. Generate initial report
python scripts/run.py export_manager.py report --notebook-id NOTEBOOK_ID
```

---

## 📁 File Structure

```
notebooklm/
├── scripts/
│   ├── export_manager.py       # NEW: Export & reporting
│   ├── query_history.py        # NEW: Query tracking
│   ├── batch_query.py          # NEW: Batch queries
│   ├── ask_question.py         # Existing: Single queries
│   ├── notebook_manager.py     # Existing: Library management
│   ├── auth_manager.py         # Existing: Authentication
│   └── run.py                  # Wrapper script
├── data/
│   ├── library.json            # Notebook metadata
│   ├── query_history.json      # NEW: Query tracking data
│   ├── auth_info.json          # Authentication status
│   └── browser_state/          # Browser session
└── exports/                    # NEW: Export output directory
    ├── *_summary_*.json        # Notebook summaries
    ├── *_report_*.md           # Markdown reports
    ├── batch_query_*.json      # Batch query results
    └── notebooklm_complete_export_*.json  # Full backups
```

---

## 🎓 Example: Creating Detailed Source Narratives

Based on our session, here's how to replicate the comprehensive source narrative generation:

```bash
# 1. Query for source overview
python scripts/run.py ask_question.py \
  --question "List all source documents with names and descriptions" \
  --notebook-id NOTEBOOK_ID

# 2. Create batch questions for detailed narratives
cat > narrative_questions.txt << EOF
Provide comprehensive description of [SOURCE_1] with technical details
Provide comprehensive description of [SOURCE_2] with technical details
Provide comprehensive description of [SOURCE_3] with technical details
EOF

# 3. Run batch queries
python scripts/run.py batch_query.py run \
  --questions-file narrative_questions.txt \
  --notebook-id NOTEBOOK_ID

# 4. Generate comprehensive report
python scripts/run.py batch_query.py report \
  --results-file exports/batch_query_*.json

# 5. Export complete summary
python scripts/run.py export_manager.py export-all
```

---

## 🔍 Advanced Features

### JSON Processing

All exports are valid JSON and can be processed with `jq`:

```bash
# Extract all questions from history
cat data/query_history.json | jq '.[].question'

# Get queries for specific notebook
cat data/query_history.json | jq '.[] | select(.notebook_id=="NOTEBOOK_ID")'

# Calculate total queries
cat data/query_history.json | jq 'length'
```

### Automation Scripts

Create automated research sessions:

```bash
#!/bin/bash
# daily_research.sh

NOTEBOOK_ID="my-research-notebook"

# Run today's questions
python scripts/run.py batch_query.py run \
  --questions-file daily_questions_$(date +%Y%m%d).txt \
  --notebook-id $NOTEBOOK_ID \
  --output exports/daily_$(date +%Y%m%d).json

# Generate report
python scripts/run.py export_manager.py report --notebook-id $NOTEBOOK_ID

# Send summary email (example)
python scripts/run.py query_history.py stats --notebook-id $NOTEBOOK_ID | \
  mail -s "Research Summary $(date +%Y-%m-%d)" user@example.com
```

---

## 📈 Analytics Insights

The enhanced skill provides rich analytics:

### Query Patterns
- Most queried topics
- Peak usage times
- Success rates
- Average answer lengths

### Notebook Insights
- Most active notebooks
- Topic coverage
- Source density
- Usage trends

### Research Efficiency
- Questions per session
- Follow-up frequency
- Query refinement patterns
- Content discovery paths

---

## 🚀 Performance Improvements

1. **Batch Processing:** Query multiple questions without browser restart overhead
2. **History Caching:** Fast lookups without re-querying notebooks
3. **Export Optimization:** Structured data for quick analysis
4. **Reporting:** Pre-compiled insights without manual synthesis

---

## 🛠️ Maintenance

### Regular Backups

```bash
# Weekly backup
python scripts/run.py export_manager.py export-all
```

### History Management

```bash
# Clear old history (if needed)
python scripts/run.py query_history.py clear

# Or keep history but archive
cp data/query_history.json archives/query_history_$(date +%Y%m%d).json
```

### Export Cleanup

```bash
# Archive old exports
mkdir -p archives/exports_$(date +%Y%m)
mv exports/* archives/exports_$(date +%Y%m)/
```

---

## 📚 Additional Resources

- `SKILL.md` - Core skill documentation
- `references/` - Extended documentation
- `exports/` - Generated reports and data
- `data/` - Active data files

---

## 🎯 Future Enhancements

Potential additions for v3.0:

- **Query Templates:** Pre-built question sets for common research patterns
- **Auto-Tagging:** ML-based topic extraction from queries
- **Visualization:** Graph your research journey
- **Integration:** Export to Obsidian, Roam, Notion
- **Collaboration:** Share query histories and reports
- **Scheduling:** Automated periodic queries
- **Alerts:** Notify when new sources added to notebook

---

## 🤝 Contributing

To add new features:

1. Create new script in `scripts/`
2. Follow existing naming conventions
3. Add comprehensive docstrings
4. Update `SKILL.md` and `ENHANCEMENTS.md`
5. Test with `run.py` wrapper
6. Document in `references/`

---

*Enhanced NotebookLM skill - Transforming research into actionable intelligence*
