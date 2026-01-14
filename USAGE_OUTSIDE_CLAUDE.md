# Using NotebookLM Outside of Claude

You now have **THREE ways** to use NotebookLM automation without talking to me (Claude):

---

## 🎯 Option 1: Command Line Interface (Simplest!)

I've created a simple CLI tool called `nlm` that you can use from any terminal.

### Quick Start

```bash
# Check authentication
nlm auth

# List your notebooks
nlm list

# Ask a question
nlm ask What are the main features of this notebook?

# Get help
nlm help
```

### Available Commands

| Command | What it does |
|---------|--------------|
| `nlm ask <question>` | Ask a question to your active notebook |
| `nlm list` | Show all your notebooks |
| `nlm search <keyword>` | Search notebooks by topic/name |
| `nlm activate <id>` | Set which notebook is active |
| `nlm stats` | Show query statistics |
| `nlm history [N]` | Show last N queries (default 20) |
| `nlm report [id]` | Generate markdown report |
| `nlm backup` | Backup entire library |
| `nlm auth` | Check authentication status |

### Your Current Notebooks

```
• notebooklm-automation-manual [ACTIVE]
• digital-empire-blueprint-2025  
• digital-empire-operations-manual
```

### Examples

```bash
# Quick research
nlm ask What tools are mentioned in this documentation?

# Switch notebooks
nlm activate digital-empire-blueprint-2025
nlm ask What are the revenue strategies?

# Generate a report
nlm report notebooklm-automation-manual

# Check what you've been researching
nlm stats
nlm history 30

# Backup everything
nlm backup
```

---

## 🔌 Option 2: MCP Server (Use with Cursor, Codex, etc.)

The **Model Context Protocol (MCP) server** is now installed and works with:

- ✅ **Claude Desktop** - Configured in `~/.claude.json`
- ✅ **Cursor** - Configured in `~/.cursor/mcp.json`
- 🔧 **Codex** - Run: `codex mcp add notebooklm -- npx notebooklm-mcp@latest`
- 🔧 **VS Code** - Run: `code --add-mcp '{"name":"notebooklm","command":"npx","args":["notebooklm-mcp@latest"]}'`

### How to Use

1. **Restart the application** (Claude Desktop, Cursor, etc.)
2. The MCP tools will appear automatically
3. In your chat, just mention NotebookLM or ask questions like:
   - "Log me in to NotebookLM" (first time only)
   - "Add this notebook to my library: [URL]"
   - "Ask my API docs about authentication"
   - "Query my React notebook about hooks"

### MCP vs CLI

| Feature | MCP Server | CLI Tool |
|---------|------------|----------|
| **Use with AI** | ✅ Works with any MCP client | ❌ Manual only |
| **Persistent sessions** | ✅ Yes | ❌ No |
| **Direct terminal use** | ❌ No | ✅ Yes |
| **Automation/scripts** | ❌ No | ✅ Perfect for it |
| **Cross-tool support** | ✅ Cursor, Claude, Codex, VS Code | ⚠️ CLI only |

---

## 🐍 Option 3: Direct Python Scripts (Maximum Control)

For automation, scripting, or integration with your own tools.

### Basic Usage

```bash
cd ~/.claude/skills/notebooklm

# Query
python scripts/run.py ask_question.py --question "Your question here"

# Manage notebooks
python scripts/run.py notebook_manager.py list
python scripts/run.py notebook_manager.py add --url "..." --name "..." --description "..." --topics "a,b,c"

# Generate reports
python scripts/run.py export_manager.py report --notebook-id ID

# Batch queries
python scripts/run.py batch_query.py run --questions-file questions.txt --notebook-id ID
```

### Integration Examples

#### Shell Script
```bash
#!/bin/bash
# research.sh - Automate research

questions=(
  "What are the main features?"
  "What are best practices?"
  "What are common pitfalls?"
)

for q in "${questions[@]}"; do
  echo "Researching: $q"
  nlm ask "$q" >> research_results.txt
done
```

#### Python Integration
```python
import subprocess

def query_notebook(question, notebook_id):
    cmd = [
        'python',
        '/Users/steven/.claude/skills/notebooklm/scripts/run.py',
        'ask_question.py',
        '--question', question,
        '--notebook-id', notebook_id
    ]
    result = subprocess.run(cmd, capture_output=True, text=True)
    return result.stdout

# Use it
answer = query_notebook("What is this about?", "notebooklm-automation-manual")
print(answer)
```

#### Makefile Integration
```makefile
NOTEBOOKLM = cd ~/.claude/skills/notebooklm && python scripts/run.py

research:
	$(NOTEBOOKLM) ask_question.py --question "What are the key features?"

docs:
	$(NOTEBOOKLM) export_manager.py report

stats:
	$(NOTEBOOKLM) query_history.py stats
```

---

## 🚀 Quick Start Guide

### 1. Test the CLI (easiest)
```bash
nlm auth
nlm list
nlm ask Tell me about the main topics in this notebook
```

### 2. Use in Cursor (if you have it)
```
1. Restart Cursor
2. Open a chat
3. Type: "Query my notebooklm-automation-manual notebook about automation features"
```

### 3. Use in Scripts
```bash
# Create a research script
cat > ~/research.sh << 'EOF'
#!/bin/bash
nlm ask "What are the main features?" > research.txt
nlm ask "What are best practices?" >> research.txt
nlm ask "What are common issues?" >> research.txt
EOF

chmod +x ~/research.sh
./research.sh
```

---

## 📚 Full Documentation

- **CLI Reference**: `~/.claude/skills/notebooklm/USE_FROM_CLI.md`
- **Script Reference**: `~/.claude/skills/notebooklm/references/api_reference.md`
- **Troubleshooting**: `~/.claude/skills/notebooklm/references/troubleshooting.md`
- **MCP Details**: Check `/tmp/notebooklm-mcp/README.md`

---

## 🎯 Recommended Workflow

### For Quick Questions
Use the **CLI**:
```bash
nlm ask What does this say about X?
```

### For Research Sessions with AI
Use **Cursor or Claude Desktop** (MCP):
- Open Cursor/Claude
- "Query my React docs about hooks"
- AI automatically uses NotebookLM and gets grounded answers

### For Automation/Scripts
Use **Python scripts directly**:
```bash
python scripts/run.py batch_query.py run --questions-file questions.txt --notebook-id ID
```

---

## ✅ Current Status

Your setup:
- ✅ Authenticated to NotebookLM
- ✅ 3 notebooks in library
- ✅ CLI tool ready: `nlm`
- ✅ MCP server installed (Claude Desktop + Cursor)
- ✅ Python scripts ready for automation

Test it now:
```bash
nlm ask What is the main purpose of this notebook?
```

---

## 🆘 Help & Support

### Quick Help
```bash
nlm help
```

### Check Status
```bash
nlm auth
nlm list
nlm stats
```

### Full Documentation
```bash
cat ~/.claude/skills/notebooklm/USE_FROM_CLI.md
cat ~/.claude/skills/notebooklm/QUICK_REFERENCE.md
```

### Troubleshooting

| Problem | Solution |
|---------|----------|
| `nlm: command not found` | Run: `export PATH="$HOME/bin:$PATH"` or add to ~/.zshrc |
| Authentication expired | Run: `nlm auth` then re-authenticate if needed |
| Wrong notebook | Run: `nlm activate <notebook-id>` |
| Need fresh start | Run: `cd ~/.claude/skills/notebooklm && python scripts/run.py cleanup_manager.py --confirm --preserve-library` |

---

**You're all set!** You can now use NotebookLM from:
1. ✅ Terminal (`nlm` command)
2. ✅ Cursor (MCP server)
3. ✅ Claude Desktop (MCP server)
4. ✅ Python scripts (automation)
5. ✅ Shell scripts (integration)

No more dependency on me for NotebookLM queries! 🎉
