# Account Summary - Quick Reference

**Your NotebookLM Multi-Account Setup**

---

## 🎯 Your Two Accounts

### 1. AvatarArts Business Account
```
Email:    me@avatararts.org
GitHub:   AvaTar-ArTs
Command:  nlma
Profile:  avatararts
Purpose:  Business, POD, Digital Empire, Revenue Strategy
```

### 2. Personal Account
```
Email:    sjchaplinski@gmail.com
GitHub:   ichoake
Command:  nlmcho
Profile:  ichoake
Purpose:  Personal research, learning, knowledge base
```

---

## ⚡ Quick Commands

```bash
# AvatarArts (AvaTar-ArTs)
nlma list               # List AvatarArts notebooks
nlma ask "question"     # Query AvatarArts notebooks
nlma auth               # Check authentication

# Personal (ichoake)
nlmcho list             # List personal notebooks
nlmcho ask "question"   # Query personal notebooks
nlmcho auth             # Check authentication

# Profile management
nlm profile list        # Show all profiles
nlm profile current     # Show active profile
```

---

## 📋 Account Mapping

| What | AvatarArts | Personal |
|------|------------|----------|
| **Email** | me@avatararts.org | sjchaplinski@gmail.com |
| **GitHub** | AvaTar-ArTs | ichoake |
| **Command** | `nlma` | `nlmcho` |
| **Profile** | avatararts | ichoake |
| **Use for** | Business/POD/Creative | Research/Learning/Personal |

---

## 🔐 Authentication

Each account needs separate authentication:

```bash
# Setup AvatarArts (first time)
nlma auth
# → Browser opens, login with: me@avatararts.org

# Setup Personal (first time)
nlmcho auth
# → Browser opens, login with: sjchaplinski@gmail.com
```

---

## 📖 Documentation

- **ACCOUNTS_INDEX.md** - Full account reference guide
- **MULTI_ACCOUNT.md** - Detailed multi-account docs
- **QUICK_REFERENCE.md** - Command cheat sheet
- **README_INDEX.md** - Documentation index

```bash
cat ~/.claude/skills/notebooklm/ACCOUNTS_INDEX.md
```

---

*Account summary - 2026-01-14*
