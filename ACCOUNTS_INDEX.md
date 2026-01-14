# NotebookLM Multi-Account Index

**Last Updated:** January 14, 2026

---

## 📋 Your Accounts & Commands

| Command | Profile | Email | GitHub Username | Description |
|---------|---------|-------|-----------------|-------------|
| **`nlma`** | avatararts | me@avatararts.org | **AvaTar-ArTs** | AvatarArts business - Digital Empire, POD, Creative |
| **`nlmcho`** | ichoake | sjchaplinski@gmail.com | **ichoake** | Personal account - Research, learning, personal projects |
| **`nlm`** | default | (current auth) | N/A | Manual profile switching |

---

## 🎯 Quick Usage

### AvatarArts Account (AvaTar-ArTs)
```bash
nlma list               # List AvatarArts notebooks
nlma ask "question"     # Query AvatarArts notebooks
nlma add                # Add notebook to AvatarArts
nlma auth               # Check/setup AvatarArts authentication
nlma profile current    # Show current profile (auto-switches to avatararts)
```

### Personal Account (ichoake)
```bash
nlmcho list             # List personal notebooks
nlmcho ask "question"   # Query personal notebooks
nlmcho add              # Add notebook to personal
nlmcho auth             # Check/setup personal authentication
nlmcho profile current  # Show current profile (auto-switches to ichoake)
```

### Manual Switching
```bash
nlm profile list        # List all profiles
nlm profile switch avatararts
nlm profile switch ichoake
nlm profile current
```

---

## 🔐 Account Details

### 1. AvatarArts Business (AvaTar-ArTs)

**Email:** me@avatararts.org  
**GitHub:** AvaTar-ArTs  
**Command:** `nlma`  
**Profile:** avatararts

**Purpose:**
- AvatarArts creative projects
- Digital Empire operations
- Print-on-Demand automation
- QuantumForgeLabs technical work
- Business/revenue strategies

**Typical Notebooks:**
- AvatarArts Creative Projects
- POD Automation Strategies
- Digital Empire Blueprint
- Revenue Optimization
- Content Creation Systems

**Usage:**
```bash
# All operations automatically use me@avatararts.org
nlma list
nlma ask "What are the POD automation strategies?"
nlma add --url "..." --name "POD Strategy Docs" --topics "pod,automation,revenue"
```

---

### 2. Personal Account (ichoake)

**Email:** sjchaplinski@gmail.com  
**GitHub:** ichoake  
**Command:** `nlmcho`  
**Profile:** ichoake

**Purpose:**
- Personal research and learning
- Book notes and knowledge base
- Personal projects
- Learning resources

**Typical Notebooks:**
- Personal Learning Notes
- Research and Development
- Book Summaries
- Technical Learning
- Personal Knowledge Base

**Usage:**
```bash
# All operations automatically use sjchaplinski@gmail.com
nlmcho list
nlmcho ask "What did I learn about machine learning?"
nlmcho add --url "..." --name "ML Research" --topics "ml,learning,research"
```

---

## 🔄 Auto-Switching Behavior

### `nlma` (AvatarArts)
When you run any `nlma` command:
1. Checks current active profile
2. If not `avatararts`, automatically switches to it
3. Loads AvatarArts notebooks, browser state, auth
4. Executes your command in AvatarArts context
5. Shows message: "🔄 Switching to avatararts profile (me@avatararts.org)..."

### `nlmcho` (Personal)
When you run any `nlmcho` command:
1. Checks current active profile
2. If not `ichoake`, automatically switches to it
3. Loads personal notebooks, browser state, auth
4. Executes your command in personal context
5. Shows message: "🔄 Switching to ichoake profile (sjchaplinski@gmail.com)..."

### Switching Between Accounts
```bash
# Work on AvatarArts projects
nlma list
nlma ask "What's the revenue strategy?"

# Switch to personal research (automatic)
nlmcho list
nlmcho ask "What are my learning notes?"

# Back to AvatarArts (automatic)
nlma list
nlma ask "POD automation updates?"
```

---

## 📁 Data Isolation

Each account has completely separate:

### AvatarArts (AvaTar-ArTs)
```
~/.claude/skills/notebooklm/data/profiles/avatararts/
├── library.json          # AvatarArts notebooks only
├── auth_info.json        # me@avatararts.org session
├── query_history.json    # AvatarArts query history
└── browser_state/        # Cookies for me@avatararts.org
```

### Personal (ichoake)
```
~/.claude/skills/notebooklm/data/profiles/ichoake/
├── library.json          # Personal notebooks only
├── auth_info.json        # sjchaplinski@gmail.com session
├── query_history.json    # Personal query history
└── browser_state/        # Cookies for sjchaplinski@gmail.com
```

---

## 🔐 Authentication Setup

### First-Time Setup for AvatarArts
```bash
nlma auth

# If not authenticated:
cd ~/.claude/skills/notebooklm
python scripts/run.py auth_manager.py setup
# Browser opens → Log in with: me@avatararts.org
```

### First-Time Setup for Personal
```bash
nlmcho auth

# If not authenticated:
cd ~/.claude/skills/notebooklm
python scripts/run.py auth_manager.py setup
# Browser opens → Log in with: sjchaplinski@gmail.com
```

**Important:**
- Each account needs separate authentication
- Browser state is isolated per account
- Sessions last ~7 days before re-auth needed
- Use the **correct email** when authenticating!

---

## 💡 Common Workflows

### Morning: AvatarArts Business
```bash
nlma list
nlma ask "What are today's priorities for AvatarArts?"
nlma ask "What's the status of POD automation?"
nlma stats
```

### Afternoon: Technical Work
```bash
nlma ask "What are the latest API security best practices?"
nlma ask "What automation strategies should we implement?"
nlma report avatararts-operations > daily-review.md
```

### Evening: Personal Learning
```bash
nlmcho list
nlmcho ask "What are my learning goals for this week?"
nlmcho ask "What book notes did I take recently?"
nlmcho history 20
```

### Weekend: Creative Projects
```bash
nlma ask "What are the latest design trends?"
nlma ask "What music licensing strategies work best?"
nlma report avatararts-creative > weekend-review.md
```

---

## 🎨 Use Case Examples

### Use Case 1: POD Automation Research (AvatarArts)
```bash
nlma ask "What are the current POD automation strategies?"
nlma ask "What tools are recommended for POD creators?"
nlma ask "What are successful pricing strategies?"
nlma ask "What are common POD mistakes to avoid?"
nlma report pod-automation
```

### Use Case 2: Digital Empire Strategy (AvatarArts)
```bash
nlma ask "What are the revenue optimization tactics?"
nlma ask "What are the AEO best practices?"
nlma ask "What's the Goldie 6-in-1 Content Multiplier?"
nlma ask "What automation infrastructure is needed?"
```

### Use Case 3: Personal Learning (ichoake)
```bash
nlmcho ask "What did I learn about machine learning today?"
nlmcho ask "What are the key concepts from that book?"
nlmcho ask "What are my study notes on algorithms?"
nlmcho history 30
```

---

## 🛠️ Command Reference

All commands work with both `nlma` and `nlmcho`:

| Command | What it does | Example |
|---------|--------------|---------|
| `list` / `ls` | List notebooks | `nlma list` |
| `ask` / `query` / `q` | Ask question | `nlma ask "question"` |
| `add` | Add notebook | `nlma add` |
| `activate` / `use` | Set active notebook | `nlma activate <id>` |
| `search` | Search notebooks | `nlma search keyword` |
| `stats` | Query statistics | `nlma stats` |
| `history` | Recent queries | `nlma history 20` |
| `report` | Generate report | `nlma report <id>` |
| `backup` | Backup library | `nlma backup` |
| `auth` | Check/setup auth | `nlma auth` |
| `profile current` | Show profile | `nlma profile current` |
| `profile list` | List all profiles | `nlm profile list` |
| `help` | Show help | `nlma help` |

---

## 📊 Profile Status Check

```bash
# Check all profiles
nlm profile list
```

Expected output:
```
📋 NotebookLM Profiles:

   ✅ avatararts
      Notebooks: X
      Email: me@avatararts.org
      Description: AvatarArts business account (GitHub: AvaTar-ArTs)

   ✅ ichoake
      Notebooks: Y
      Email: sjchaplinski@gmail.com
      Description: Personal account (GitHub: ichoake)

   ✅ default
      Notebooks: 3
      Email: Currently authenticated account
```

---

## 🔧 Advanced Operations

### Create Batch Research for AvatarArts
```bash
# Create questions file
cat > avatararts-research.txt << EOF
What are the current POD trends?
What are successful revenue strategies?
What automation tools are recommended?
What are the latest design best practices?
EOF

# Run batch query
cd ~/.claude/skills/notebooklm
python scripts/run.py batch_query.py run \
  --questions-file avatararts-research.txt \
  --notebook-id <notebook-id>
```

### Backup Both Accounts
```bash
#!/bin/bash
# backup-all-accounts.sh

echo "Backing up AvatarArts (AvaTar-ArTs)..."
nlma backup

echo "Backing up Personal (ichoake)..."
nlmcho backup

echo "Done! Backups saved to exports/"
```

### Generate Reports for Both Accounts
```bash
# AvatarArts report
nlma report > avatararts-report-$(date +%Y%m%d).md

# Personal report
nlmcho report > personal-report-$(date +%Y%m%d).md
```

---

## 🐛 Troubleshooting

### Issue: "Not authenticated" for AvatarArts
```bash
nlma auth
# If shows "Authenticated: No":
cd ~/.claude/skills/notebooklm
python scripts/run.py auth_manager.py setup
# → Log in with me@avatararts.org
```

### Issue: "Not authenticated" for Personal
```bash
nlmcho auth
# If shows "Authenticated: No":
cd ~/.claude/skills/notebooklm
python scripts/run.py auth_manager.py setup
# → Log in with sjchaplinski@gmail.com
```

### Issue: Wrong notebooks showing up
```bash
# Verify which profile is active
nlma profile current
# Should show: avatararts

nlmcho profile current
# Should show: ichoake

# If wrong, the commands will auto-switch
nlma list  # Forces switch to avatararts
nlmcho list  # Forces switch to ichoake
```

### Issue: Commands not found
```bash
# Check if commands exist
ls -la ~/bin/nlm*

# If missing, recreate them or add to PATH
export PATH="$HOME/bin:$PATH"

# Reload shell
hash -r
```

---

## 📖 Documentation Files

- **This file:** Account index and quick reference
- **MULTI_ACCOUNT.md:** Detailed multi-account guide
- **SETUP_COMPLETE.md:** Setup completion summary
- **USAGE_OUTSIDE_CLAUDE.md:** All usage methods
- **USE_FROM_CLI.md:** CLI usage examples
- **QUICK_REFERENCE.md:** Command cheat sheet
- **README.md:** Main documentation

View any file:
```bash
cat ~/.claude/skills/notebooklm/ACCOUNTS_INDEX.md
cat ~/.claude/skills/notebooklm/MULTI_ACCOUNT.md
```

---

## ✅ Quick Verification

Test both accounts:

```bash
# Test AvatarArts (AvaTar-ArTs)
nlma profile current
nlma auth
nlma list

# Test Personal (ichoake)
nlmcho profile current
nlmcho auth
nlmcho list

# Check all profiles
nlm profile list
```

---

## 🎯 Summary

You have **two dedicated commands** for your two Google accounts:

### `nlma` → AvatarArts (AvaTar-ArTs)
- **Email:** me@avatararts.org
- **GitHub:** AvaTar-ArTs
- **Use for:** Business, POD, Digital Empire, Revenue Strategy

### `nlmcho` → Personal (ichoake)
- **Email:** sjchaplinski@gmail.com
- **GitHub:** ichoake
- **Use for:** Personal research, learning, book notes

Both commands:
- ✅ Auto-switch to correct profile
- ✅ Maintain separate notebooks
- ✅ Keep separate authentication
- ✅ Track separate query history
- ✅ Work identically (same commands, different contexts)

**Start using now:**
```bash
nlma help       # AvatarArts help
nlmcho help     # Personal help
```

---

*Account index created: 2026-01-14*  
*AvatarArts GitHub: AvaTar-ArTs*  
*Personal GitHub: ichoake*
