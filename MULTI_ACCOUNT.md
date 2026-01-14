# NotebookLM Multi-Account Setup

**Created:** January 14, 2026  
**Status:** ✅ Fully Configured

---

## 🎯 Quick Start

You now have **three ways** to use NotebookLM with different Google accounts:

### 1. **`nlma`** - AvatarArts Account
```bash
nlma list               # List notebooks in me@avatararts.org
nlma ask "question"     # Query AvatarArts notebooks
nlma auth               # Check/setup auth for AvatarArts
```

### 2. **`nlmcho`** - Personal Account (ichoake)
```bash
nlmcho list             # List notebooks in sjchaplinski@gmail.com
nlmcho ask "question"   # Query personal notebooks
nlmcho auth             # Check/setup auth for personal
```

### 3. **`nlm`** - Manual Profile Switching
```bash
nlm profile list        # List all profiles
nlm profile switch avatararts
nlm profile switch ichoake
nlm profile current     # Show active profile
```

---

## 📋 Your Profiles

| Command | Profile | Email | GitHub | Description |
|---------|---------|-------|--------|-------------|
| `nlma` | avatararts | me@avatararts.org | **AvaTar-ArTs** | AvatarArts business - Digital Empire & POD |
| `nlmcho` | ichoake | sjchaplinski@gmail.com | **ichoake** | Personal account |
| `nlm` | default | (current auth) | N/A | Default/legacy profile |

---

## 🚀 Usage Examples

### Using AvatarArts Account

```bash
# Switch to AvatarArts (auto-switches on first command)
nlma profile current
# 📍 Current Profile: avatararts
#    📧 Email: me@avatararts.org

# Setup authentication (first time)
nlma auth
# Opens browser to login with me@avatararts.org

# Add a notebook
nlma add

# Query notebooks
nlma ask "What are the POD automation strategies?"

# List notebooks
nlma list

# View query history
nlma history

# Generate report
nlma report <notebook-id>
```

### Using Personal Account (ichoake)

```bash
# Switch to personal (auto-switches on first command)
nlmcho profile current
# 📍 Current Profile: ichoake
#    📧 Email: sjchaplinski@gmail.com

# Setup authentication (first time)
nlmcho auth

# Use all the same commands
nlmcho list
nlmcho ask "What's in my personal notes?"
nlmcho history
```

### Switching Between Accounts

```bash
# Use dedicated commands (recommended)
nlma list          # Automatically uses avatararts account
nlmcho list        # Automatically uses ichoake account

# Or manual switching
nlm profile switch avatararts
nlm list

nlm profile switch ichoake
nlm list
```

---

## 🔐 Authentication Setup

### First Time Setup for Each Account

**1. Setup AvatarArts Account:**
```bash
nlma auth
# If not authenticated, run:
# python ~/.claude/skills/notebooklm/scripts/run.py auth_manager.py setup
```

**2. Setup Personal Account:**
```bash
nlmcho auth
# If not authenticated, run:
# python ~/.claude/skills/notebooklm/scripts/run.py auth_manager.py setup
```

**Important:** 
- You'll need to login manually in the browser for each account
- Browser state and cookies are stored separately per profile
- Sessions last ~7 days before needing re-authentication

---

## 📚 How It Works

### Profile Isolation

Each profile has its own:
- ✅ **Browser state** (separate cookies, sessions)
- ✅ **Notebook library** (separate lists of notebooks)
- ✅ **Query history** (separate analytics)
- ✅ **Authentication** (independent Google logins)

### Directory Structure

```
~/.claude/skills/notebooklm/data/
├── active_profile.json           # Tracks current profile
├── profiles/
│   ├── avatararts/
│   │   ├── library.json          # AvatarArts notebooks
│   │   ├── auth_info.json        # Auth metadata
│   │   ├── query_history.json    # Query analytics
│   │   └── browser_state/        # Browser cookies & session
│   ├── ichoake/
│   │   ├── library.json          # Personal notebooks
│   │   ├── auth_info.json
│   │   ├── query_history.json
│   │   └── browser_state/
│   └── default/
│       └── [current data saved here when switching]
```

### Auto-Switching Magic

When you run `nlma` or `nlmcho`:
1. Checks current active profile
2. If not the target profile, switches automatically
3. Loads that profile's data (library, browser state, history)
4. Runs your command in that profile's context
5. Next time you use same command, it's already on the right profile!

---

## 🔄 Profile Management

### List All Profiles
```bash
nlm profile list
```

Output:
```
📋 NotebookLM Profiles:

   ✅ avatararts [CURRENT]
      Notebooks: 0
      Email: me@avatararts.org

   ⚠️  ichoake
      Notebooks: 0
      Email: sjchaplinski@gmail.com

   ✅ default
      Notebooks: 3
      Email: Currently authenticated account
```

### Switch Profiles Manually
```bash
nlm profile switch avatararts
nlm profile switch ichoake
nlm profile switch default
```

### Show Current Profile
```bash
nlm profile current
# Or use shortcuts:
nlma profile current
nlmcho profile current
```

### Profile Information
```bash
nlm profile info avatararts
nlm profile info ichoake
```

---

## 💡 Common Workflows

### Workflow 1: Research with AvatarArts Account

```bash
# 1. Check which profile you're on
nlma profile current

# 2. Authenticate (first time only)
nlma auth

# 3. Add a notebook
nlma add

# 4. Query it
nlma ask "What are the key strategies?"

# 5. View history
nlma history

# 6. Generate report
nlma report <notebook-id>
```

### Workflow 2: Personal Research with ichoake

```bash
# Use same workflow with nlmcho
nlmcho profile current
nlmcho auth
nlmcho add
nlmcho ask "Summarize this for me"
nlmcho history
```

### Workflow 3: Quick Switching

```bash
# Morning: Work on business stuff
nlma list
nlma ask "POD automation updates?"

# Afternoon: Personal research
nlmcho list
nlmcho ask "What did I save about that topic?"

# Evening: Back to business
nlma ask "Revenue strategies?"
```

---

## 🎨 Command Shortcuts

All `nlm` commands work with `nlma` and `nlmcho`:

| Command | Description | Example |
|---------|-------------|---------|
| `list` / `ls` | List notebooks | `nlma list` |
| `ask` / `q` / `query` | Ask question | `nlma ask "question"` |
| `add` | Add notebook | `nlma add` |
| `activate` / `use` | Set active notebook | `nlma activate <id>` |
| `stats` | Query statistics | `nlma stats` |
| `history` | Recent queries | `nlma history` |
| `report` | Generate report | `nlma report <id>` |
| `auth` | Check/setup auth | `nlma auth` |
| `profile current` | Show profile | `nlma profile current` |
| `help` | Show help | `nlma help` |

---

## 🔧 Advanced Operations

### Create New Profile

```bash
nlm profile create --name newprofile \
  --email user@example.com \
  --description "Description here"
```

### Delete Profile

```bash
nlm profile delete --name profilename
```

Note: Cannot delete `default` or currently active profile.

### Backup All Profiles

```bash
# Backup avatararts
nlma backup
# Creates: exports/notebooklm_export_TIMESTAMP.json

# Backup ichoake
nlmcho backup
```

---

## 🐛 Troubleshooting

### Issue: "Not authenticated"

**Solution:**
```bash
# For AvatarArts
nlma auth
# If shows "Authenticated: No", run setup:
cd ~/.claude/skills/notebooklm
python scripts/run.py auth_manager.py setup

# For personal
nlmcho auth
```

### Issue: Wrong profile active

**Solution:**
```bash
# Check current profile
nlm profile current

# Switch to correct profile
nlm profile switch avatararts
# or
nlm profile switch ichoake

# Or just use the dedicated commands
nlma list    # Auto-switches to avatararts
nlmcho list  # Auto-switches to ichoake
```

### Issue: Notebooks from wrong account showing up

**Solution:**
```bash
# Verify you're on the right profile
nlma profile current
# Should show: avatararts

nlmcho profile current
# Should show: ichoake

# If still mixed up, switch and re-list
nlma list
nlmcho list
```

### Issue: Commands not found

**Solution:**
```bash
# Reload shell PATH cache
hash -r

# Or use full paths
~/bin/nlma list
~/bin/nlmcho list
```

---

## 📊 Profile Status

```bash
# View all profiles
nlm profile list
```

Expected output after initial setup:
```
📋 NotebookLM Profiles:

   ⚠️  avatararts
      Notebooks: 0
      Email: me@avatararts.org
      Description: AvatarArts business account
      Status: Needs authentication

   ⚠️  ichoake
      Notebooks: 0
      Email: sjchaplinski@gmail.com
      Description: Personal account (ichoake)
      Status: Needs authentication

   ✅ default [CURRENT]
      Notebooks: 3
      Email: Currently authenticated account
      Status: Authenticated
```

After setup and use:
```
📋 NotebookLM Profiles:

   ✅ avatararts [CURRENT]
      Notebooks: 5
      Email: me@avatararts.org
      Status: Authenticated

   ✅ ichoake
      Notebooks: 3
      Email: sjchaplinski@gmail.com
      Status: Authenticated

   ✅ default
      Notebooks: 3
      Email: Currently authenticated account
      Status: Authenticated
```

---

## 🎯 Next Steps

### 1. Authenticate Both Accounts

```bash
# AvatarArts account
nlma auth
# Follow browser prompts to login with me@avatararts.org

# Personal account
nlmcho auth
# Follow browser prompts to login with sjchaplinski@gmail.com
```

### 2. Add Notebooks to Each Account

```bash
# Add to AvatarArts
nlma add

# Add to personal
nlmcho add
```

### 3. Start Querying!

```bash
# Query AvatarArts notebooks
nlma ask "What are the POD strategies?"

# Query personal notebooks
nlmcho ask "What did I save about that?"
```

---

## 📖 Related Documentation

- **Main README:** `cat ~/.claude/skills/notebooklm/README.md`
- **CLI Usage:** `cat ~/.claude/skills/notebooklm/USE_FROM_CLI.md`
- **Quick Reference:** `cat ~/.claude/skills/notebooklm/QUICK_REFERENCE.md`
- **Codebase Analysis:** `cat ~/.claude/skills/notebooklm/CODEBASE_ANALYSIS.md`

---

## ✅ Setup Complete!

You now have:
- ✅ **`nlma`** - AvatarArts account (me@avatararts.org)
- ✅ **`nlmcho`** - Personal account (sjchaplinski@gmail.com)  
- ✅ **`nlm`** - Manual profile switching
- ✅ Separate browser states per account
- ✅ Separate notebook libraries per account
- ✅ Separate query history per account

**Start using:**
```bash
nlma help      # AvatarArts commands
nlmcho help    # Personal commands
nlm help       # Manual switching
```

---

*Multi-account setup completed: 2026-01-14*
