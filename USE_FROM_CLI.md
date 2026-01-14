# Using NotebookLM from Command Line

You can use NotebookLM automation **directly from your terminal** without any AI assistant!

## Quick Commands

### Query a Notebook
```bash
cd ~/.claude/skills/notebooklm

# Ask a question (uses active notebook)
python scripts/run.py ask_question.py --question "What does this say about X?"

# Query specific notebook
python scripts/run.py ask_question.py \
  --question "Your question here" \
  --notebook-id notebooklm-automation-manual

# Query with direct URL
python scripts/run.py ask_question.py \
  --question "What is this about?" \
  --notebook-url "https://notebooklm.google.com/notebook/..."
```

### Manage Your Library
```bash
# List all notebooks
python scripts/run.py notebook_manager.py list

# Add a new notebook
python scripts/run.py notebook_manager.py add \
  --url "https://notebooklm.google.com/notebook/..." \
  --name "My Docs" \
  --description "Technical documentation" \
  --topics "api,reference,docs"

# Search notebooks
python scripts/run.py notebook_manager.py search --query "api"

# Set active notebook (so you don't need --notebook-id)
python scripts/run.py notebook_manager.py activate --id notebooklm-automation-manual

# Show stats
python scripts/run.py notebook_manager.py stats
```

### Batch Queries
```bash
# Create a questions file
cat > questions.txt << EOF
What is the main topic of this notebook?
What are the key concepts?
What tools are mentioned?
EOF

# Run batch query
python scripts/run.py batch_query.py run \
  --questions-file questions.txt \
  --notebook-id notebooklm-automation-manual

# Results saved to exports/batch_query_TIMESTAMP.json
```

### Generate Reports
```bash
# Markdown report for a notebook
python scripts/run.py export_manager.py report \
  --notebook-id notebooklm-automation-manual

# Report saved to exports/notebooklm-automation-manual_report_TIMESTAMP.md

# Full library backup
python scripts/run.py export_manager.py export-all

# Summary as JSON
python scripts/run.py export_manager.py summary \
  --notebook-id notebooklm-automation-manual
```

### Query History
```bash
# See recent queries
python scripts/run.py query_history.py list --limit 20

# Get statistics
python scripts/run.py query_history.py stats

# Search history
python scripts/run.py query_history.py search --keyword "api"
```

## Create Aliases for Easy Use

Add to your `~/.zshrc`:

```bash
# NotebookLM shortcuts
alias nlm='cd ~/.claude/skills/notebooklm && python scripts/run.py'
alias nlm-ask='nlm ask_question.py --question'
alias nlm-list='nlm notebook_manager.py list'
alias nlm-stats='nlm query_history.py stats'
```

Then reload: `source ~/.zshrc`

Now you can use:
```bash
# Simple queries
nlm-ask "What does this say about authentication?"

# List notebooks
nlm-list

# Check stats
nlm-stats
```

## Create a Wrapper Script

For even easier use, create `~/bin/nlm`:

```bash
#!/bin/bash
cd ~/.claude/skills/notebooklm
python scripts/run.py ask_question.py --question "$*"
```

Make it executable:
```bash
chmod +x ~/bin/nlm
```

Now just:
```bash
nlm What is this notebook about?
```

## Integration with Your Tools

### Use in Shell Scripts
```bash
#!/bin/bash
# research.sh - Automated research script

NOTEBOOK_ID="notebooklm-automation-manual"
QUESTIONS=(
  "What are the main features?"
  "What are best practices?"
  "What are common issues?"
)

for q in "${QUESTIONS[@]}"; do
  echo "Q: $q"
  python ~/.claude/skills/notebooklm/scripts/run.py \
    ask_question.py \
    --question "$q" \
    --notebook-id "$NOTEBOOK_ID"
  echo "---"
done
```

### Use in Python Scripts
```python
#!/usr/bin/env python3
import subprocess
import json

def query_notebooklm(question, notebook_id=None):
    """Query NotebookLM and return response"""
    cmd = [
        'python',
        '~/.claude/skills/notebooklm/scripts/run.py',
        'ask_question.py',
        '--question', question
    ]
    
    if notebook_id:
        cmd.extend(['--notebook-id', notebook_id])
    
    result = subprocess.run(cmd, capture_output=True, text=True)
    return result.stdout

# Use it
answer = query_notebooklm("What is this about?", "notebooklm-automation-manual")
print(answer)
```

### Use with Make
```makefile
# Makefile
NOTEBOOKLM = cd ~/.claude/skills/notebooklm && python scripts/run.py

research:
	$(NOTEBOOKLM) ask_question.py --question "What are the features?"

report:
	$(NOTEBOOKLM) export_manager.py report

stats:
	$(NOTEBOOKLM) query_history.py stats
```

Then: `make research`, `make report`, `make stats`

## API-Style Usage

You can even create a simple HTTP API wrapper:

```python
#!/usr/bin/env python3
# api.py - Simple NotebookLM HTTP API
from flask import Flask, request, jsonify
import subprocess

app = Flask(__name__)

@app.route('/query', methods=['POST'])
def query():
    data = request.json
    question = data.get('question')
    notebook_id = data.get('notebook_id')
    
    cmd = [
        'python', 'scripts/run.py', 'ask_question.py',
        '--question', question
    ]
    if notebook_id:
        cmd.extend(['--notebook-id', notebook_id])
    
    result = subprocess.run(cmd, capture_output=True, text=True)
    return jsonify({'answer': result.stdout})

if __name__ == '__main__':
    app.run(port=5000)
```

Then query via HTTP:
```bash
curl -X POST http://localhost:5000/query \
  -H "Content-Type: application/json" \
  -d '{"question": "What is this about?", "notebook_id": "notebooklm-automation-manual"}'
```

## Your Current Setup

You're already authenticated and have 3 notebooks:

1. **notebooklm-automation-manual** [ACTIVE]
2. **digital-empire-blueprint-2025**
3. **digital-empire-operations-manual**

Try it now:
```bash
cd ~/.claude/skills/notebooklm
python scripts/run.py ask_question.py --question "What are the main topics in this notebook?"
```

## Documentation

- Full reference: `references/api_reference.md`
- Troubleshooting: `references/troubleshooting.md`
- Usage patterns: `references/usage_patterns.md`
