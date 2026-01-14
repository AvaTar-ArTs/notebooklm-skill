# 🎉 NotebookLM Multi-Account Setup Complete!

Your NotebookLM automation is now fully configured with **multi-account support**!

---

## ✅ What's Installed

### 1. **Multi-Account Profile System**

You have **3 profiles** configured:

| Profile | Email | GitHub | Status | Notebooks |
|---------|-------|--------|--------|-----------|
| **default** [CURRENT] | Currently authenticated | N/A | ✅ Authenticated | 3 notebooks |
| **avatararts** | me@avatararts.org | **AvaTar-ArTs** | ⚠️ Need to auth | 0 notebooks |
| **ichoake** | sjchaplinski@gmail.com | **ichoake** | ⚠️ Need to auth | 0 notebooks |

### 2. **Command Line Tool: `nlm`**

Enhanced with profile management:
```bash
nlm profile list          # List all profiles
nlm profile switch <name> # Switch between accounts
nlm profile current       # Show active profile
nlm ask <question>        # Query active profile's notebooks
```

### 3. **MCP Server (Claude Desktop + Cursor)**

Installed and ready:
- ✅ Claude Desktop (`~/.claude.json`)
- ✅ Cursor (`~/.cursor/mcp.json`)

**Note:** MCP server uses the currently active profile automatically.

### 4. **Python Scripts (Direct Access)**

All scripts are profile-aware:
```bash
cd ~/.claude/skills/notebooklm
python scripts/run.py profile_manager.py list
python scripts/run.py ask_question.py --question "..."
```

---

## 🚀 Next Steps

### Step 1: Authenticate AvatarArts Account

```bash
# Switch to AvatarArts profile
nlm profile switch avatararts

# Authenticate (browser will open)
cd ~/.claude/skills/notebooklm
python scripts/run.py auth_manager.py setup

# When browser opens, log in with: me@avatararts.org
# Then close the browser when done

# Verify authentication
nlm auth
```

### Step 2: Add AvatarArts Notebooks

```bash
# Still in avatararts profile

# Go to notebooklm.google.com (logged in as me@avatararts.org)
# Create/open your notebooks
# Share → Anyone with link → Copy link

# Add notebooks to this profile
nlm add \
  --url "https://notebooklm.google.com/notebook/..." \
  --name "AvatarArts Creative Projects" \
  --description "Design concepts, artwork, and creative strategies" \
  --topics "art,design,creative,avatararts"

# Verify
nlm list
```

### Step 3: Authenticate Personal Account

```bash
# Switch to personal profile
nlm profile switch personal

# Authenticate (browser will open)
cd ~/.claude/skills/notebooklm
python scripts/run.py auth_manager.py setup

# When browser opens, log in with: sjchaplinski@gmail.com
# Then close the browser when done

# Verify authentication
nlm auth
```

### Step 4: Add Personal Notebooks

```bash
# Still in personal profile

# Go to notebooklm.google.com (logged in as sjchaplinski@gmail.com)
# Create/open your notebooks
# Share → Anyone with link → Copy link

# Add notebooks to this profile
nlm add \
  --url "https://notebooklm.google.com/notebook/..." \
  --name "Personal Learning" \
  --description "Personal research, learning notes, and knowledge base" \
  --topics "learning,research,personal"

# Verify
nlm list
```

### Step 5: Test Everything

```bash
# Check all profiles
nlm profile list

# Test AvatarArts
nlm profile switch avatararts
nlm list
nlm ask What are the main creative projects?

# Test Personal
nlm profile switch personal
nlm list
nlm ask What are my research topics?

# Test Default
nlm profile switch default
nlm list
nlm ask What are the Digital Empire strategies?
```

---

## 📋 Daily Workflow

### Morning: AvatarArts Business
```bash
nlm profile switch avatararts
nlm ask What are today's creative priorities?
nlm ask What projects need attention?
nlm stats
```

### Afternoon: Digital Empire (Default)
```bash
nlm profile switch default
nlm ask What are the automation strategies?
nlm ask What are the revenue optimization tactics?
nlm report
```

### Evening: Personal Learning
```bash
nlm profile switch personal
nlm ask What are my learning goals?
nlm ask What book notes did I take recently?
nlm history 20
```

---

## 🔧 Profile Management

### Check Current Profile
```bash
nlm profile current
```

### Switch Profiles
```bash
# Switch to AvatarArts
nlm profile switch avatararts

# Switch to Personal
nlm profile switch personal

# Switch to Default
nlm profile switch default
```

### List All Profiles
```bash
nlm profile list
```

### Profile Details
```bash
nlm profile info avatararts
nlm profile info personal
nlm profile info default
```

---

## 🎨 Use Cases

### Use Case 1: Separate Business and Personal

```bash
# Business work (AvatarArts)
nlm profile switch avatararts
nlm ask What are Q1 revenue strategies?
nlm report avatararts-projects > business-review.md

# Personal research
nlm profile switch personal
nlm ask What did I learn about AI today?
nlm stats
```

### Use Case 2: Client Project Isolation

```bash
# Each client gets their own profile
nlm profile create --name client-a --email me@avatararts.org --description "Client A"
nlm profile create --name client-b --email me@avatararts.org --description "Client B"

# Work on Client A
nlm profile switch client-a
nlm add --url "..." --name "Client A Docs" ...
nlm ask What are Client A's requirements?

# Switch to Client B
nlm profile switch client-b
nlm add --url "..." --name "Client B Docs" ...
nlm ask What are Client B's priorities?
```

### Use Case 3: Brand Management

```bash
# AvatarArts creative brand
nlm profile switch avatararts
nlm ask What are the latest design trends?

# QuantumForgeLabs technical brand (create new profile)
nlm profile create --name quantumforge --email tech@quantumforgelabs.org
nlm profile switch quantumforge
nlm ask What are the automation best practices?
```

---

## 🔐 Authentication Notes

### Important
- Each profile needs **separate authentication**
- Use the **correct Google account** when authenticating each profile
- Browser sessions are kept **separate per profile**
- Authentication persists until you clear it

### If You Need to Re-authenticate
```bash
# Switch to the profile
nlm profile switch avatararts

# Clear old auth
python scripts/run.py auth_manager.py clear

# Set up fresh auth
python scripts/run.py auth_manager.py setup
```

---

## 📚 Documentation

### Quick References
- **Multi-Account Guide**: `~/.claude/skills/notebooklm/MULTI_ACCOUNT.md`
- **CLI Usage**: `~/.claude/skills/notebooklm/USE_FROM_CLI.md`
- **Quick Reference**: `~/.claude/skills/notebooklm/QUICK_REFERENCE.md`
- **Outside Claude Usage**: `~/.claude/skills/notebooklm/USAGE_OUTSIDE_CLAUDE.md`

### View Documentation
```bash
cat ~/.claude/skills/notebooklm/MULTI_ACCOUNT.md
cat ~/.claude/skills/notebooklm/USE_FROM_CLI.md
```

---

## 🆘 Troubleshooting

### Wrong Profile Active
```bash
# Check which profile is active
nlm profile current

# Switch to correct profile
nlm profile switch <correct-profile>
```

### Lost Notebooks
```bash
# Notebooks are tied to profiles
# Make sure you're in the right profile
nlm profile list
nlm profile switch <profile-with-notebooks>
nlm list
```

### Authentication Issues
```bash
# Check auth status
nlm auth

# If not authenticated, set up
cd ~/.claude/skills/notebooklm
python scripts/run.py auth_manager.py setup
```

### Profile Not Found
```bash
# Create the profile first
nlm profile create \
  --name <profile-name> \
  --email <your-email> \
  --description "Description"
```

---

## ✨ Advanced Features

### Aliases for Quick Switching
Add to `~/.zshrc`:
```bash
alias nlm-aa='nlm profile switch avatararts && nlm profile current'
alias nlm-personal='nlm profile switch personal && nlm profile current'
alias nlm-default='nlm profile switch default && nlm profile current'
```

Then just use:
```bash
nlm-aa        # Switch to AvatarArts
nlm-personal  # Switch to Personal
nlm-default   # Switch to Default
```

### Backup All Profiles
```bash
#!/bin/bash
# backup-all.sh

for profile in default avatararts personal; do
  echo "Backing up: $profile"
  nlm profile switch "$profile"
  nlm backup
done
```

### Context-Aware Switching
```bash
#!/bin/bash
# smart-nlm.sh - Auto-switch based on directory

case "$PWD" in
  *avatararts*)
    nlm profile switch avatararts
    ;;
  *personal*)
    nlm profile switch personal
    ;;
  *)
    nlm profile switch default
    ;;
esac

nlm ask "$@"
```

---

## 📊 Current Status

```bash
# Check everything
nlm profile list
nlm profile current
nlm list
nlm auth
nlm stats
```

**Expected Output:**

```
📋 NotebookLM Profiles:
  ✅ default [CURRENT] - 3 notebooks
  ⚠️  avatararts - 0 notebooks (needs auth)
  ⚠️  personal - 0 notebooks (needs auth)

📍 Current Profile: default
  🔐 Authenticated: Yes
  📚 Notebooks: 3
```

---

## 🎯 Setup Checklist

Current setup:
- [x] Multi-account profile system installed
- [x] CLI tool (`nlm`) with profile support
- [x] MCP server configured (Claude Desktop + Cursor)
- [x] Three profiles created (default, avatararts, personal)
- [x] Default profile has 3 notebooks

Next steps:
- [ ] Authenticate AvatarArts profile (me@avatararts.org)
- [ ] Add notebooks to AvatarArts profile
- [ ] Authenticate Personal profile (sjchaplinski@gmail.com)
- [ ] Add notebooks to Personal profile
- [ ] Test switching between profiles
- [ ] Verify each profile works independently

---

## 🚀 You're Ready!

You can now:

✅ **Use CLI** - `nlm ask`, `nlm list`, `nlm stats`
✅ **Switch Accounts** - `nlm profile switch avatararts`
✅ **Use in Cursor** - MCP server automatically uses active profile
✅ **Use in Claude Desktop** - MCP server automatically uses active profile
✅ **Automate** - Python scripts are profile-aware
✅ **Separate Work/Personal** - Each Google account has its own library

---

## 📞 Quick Help

```bash
# Show help
nlm help

# List profiles
nlm profile list

# Switch profile
nlm profile switch avatararts

# Check current profile
nlm profile current

# Check auth
nlm auth

# List notebooks
nlm list

# Ask question
nlm ask What is this about?
```

---

## 🎉 Summary

You now have a **complete multi-account NotebookLM automation system**:

1. **Command Line Tool** - `nlm` for quick queries
2. **Multi-Account Support** - Separate profiles for each Google account
3. **MCP Integration** - Works with Cursor, Claude Desktop, etc.
4. **Profile Switching** - Easily switch between accounts
5. **Documentation** - Comprehensive guides for all features

**Next:** Authenticate your other profiles and add notebooks!

```bash
# Start with AvatarArts
nlm profile switch avatararts
cd ~/.claude/skills/notebooklm
python scripts/run.py auth_manager.py setup
# → Log in with me@avatararts.org

# Then add notebooks
nlm add --url "..." --name "..." --description "..." --topics "..."
```

Happy researching! 🚀
