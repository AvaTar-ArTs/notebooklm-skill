# NotebookLM Multi-Account - Quick Start

**Setup Date:** 2026-01-14  
**Ready to Use!** ✅

---

## 🎯 Your Two Commands

```bash
nlma      # AvatarArts (me@avatararts.org)
nlmcho    # Personal (sjchaplinski@gmail.com)
```

---

## ⚡ Quick Reference

### Common Commands

| Task | AvatarArts | Personal |
|------|-----------|----------|
| List notebooks | `nlma list` | `nlmcho list` |
| Ask question | `nlma ask "..."` | `nlmcho ask "..."` |
| Check auth | `nlma auth` | `nlmcho auth` |
| Add notebook | `nlma add` | `nlmcho add` |
| View history | `nlma history` | `nlmcho history` |
| Show profile | `nlma profile current` | `nlmcho profile current` |

---

## 🔐 First Time Setup

**Step 1: Authenticate AvatarArts**
```bash
nlma auth
# Browser opens → Login with me@avatararts.org
```

**Step 2: Authenticate Personal**
```bash
nlmcho auth
# Browser opens → Login with sjchaplinski@gmail.com
```

**Step 3: Add notebooks to each**
```bash
nlma add      # Add to AvatarArts
nlmcho add    # Add to personal
```

**Step 4: Start using!**
```bash
nlma ask "What's in my business notebooks?"
nlmcho ask "What's in my personal notes?"
```

---

## 💡 Usage Examples

### Business Work (AvatarArts)
```bash
# Morning: Check business notebooks
nlma list

# Query business strategy
nlma ask "What are our POD automation strategies?"

# View business query history
nlma history

# Generate business report
nlma report <notebook-id>
```

### Personal Work (ichoake)
```bash
# Personal research
nlmcho list

# Query personal notes
nlmcho ask "What did I save about that topic?"

# View personal history
nlmcho history

# Backup personal notebooks
nlmcho backup
```

---

## 🔄 Auto-Switching

Each command automatically switches to its profile:

```bash
# Just use the command - switching happens automatically!
nlma list     # ✅ Auto-switches to avatararts
nlmcho list   # ✅ Auto-switches to ichoake
```

No need to manually switch profiles anymore!

---

## 🐛 Quick Troubleshooting

### "Not authenticated"
```bash
# Check status
nlma auth     # or nlmcho auth

# If not authenticated, run setup
cd ~/.claude/skills/notebooklm
python scripts/run.py auth_manager.py setup
```

### "Command not found"
```bash
# Refresh shell cache
hash -r

# Or use full path
~/bin/nlma list
~/bin/nlmcho list
```

### "Wrong profile active"
```bash
# Just use the dedicated command
nlma list     # Forces avatararts
nlmcho list   # Forces ichoake
```

---

## 📚 Full Documentation

```bash
# Multi-account guide
cat ~/.claude/skills/notebooklm/MULTI_ACCOUNT.md

# Token setup
cat ~/.claude/skills/notebooklm/ACCOUNT_TOKENS.md

# General usage
cat ~/.claude/skills/notebooklm/USE_FROM_CLI.md
```

---

## ✅ What's Configured

**nlma (AvatarArts):**
- ✅ Profile: avatararts
- ✅ Email: me@avatararts.org
- ✅ GitHub Token: Auto-loaded
- ✅ Command: `~/bin/nlma`

**nlmcho (Personal):**
- ✅ Profile: ichoake
- ✅ Email: sjchaplinski@gmail.com
- ✅ GitHub Token: Auto-loaded
- ✅ Command: `~/bin/nlmcho`

**Isolation:**
- ✅ Separate browser sessions
- ✅ Separate notebook libraries
- ✅ Separate query histories
- ✅ Separate GitHub tokens

---

## 🚀 Start Using Now!

```bash
# Test AvatarArts
nlma profile current

# Test Personal
nlmcho profile current

# View all profiles
nlm profile list
```

**Ready!** Just use `nlma` or `nlmcho` for everything! 🎉

---

*Quick start guide created: 2026-01-14*
