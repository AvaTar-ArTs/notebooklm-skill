# NotebookLM Multi-Account SSH Setup

**Setup Date:** 2026-01-14  
**Status:** ✅ Fully Configured

---

## 🔑 Your SSH Keys

| Account | SSH Key | Email |
|---------|---------|-------|
| **nlma** (AvatarArts) | `~/.ssh/id_ed25519_avatararts` | me@avatararts.org |
| **nlmcho** (Personal) | `~/.ssh/id_ed25519` | sjchaplinski@gmail.com |

---

## 📋 SSH Config

**File:** `~/.ssh/config`

Your SSH config now has aliases for both accounts:

```ssh
# AvaTar-ArTs GitHub account
Host github-avatararts
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_avatararts

# ichoake Personal account
Host github-ichoake
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519
```

---

## 🚀 Usage

### Method 1: Using nlma/nlmcho (Automatic)

The `nlma` and `nlmcho` commands **automatically set the correct SSH key**:

```bash
# AvatarArts work - SSH auto-configured
nlma list   # Sets GIT_SSH_COMMAND for avatararts

# Now git operations use avatararts SSH key
git clone git@github.com:AvaTar-ArTs/repo.git
cd repo
git push    # Uses avatararts key automatically

# Personal work - SSH auto-configured
nlmcho list  # Sets GIT_SSH_COMMAND for ichoake

# Now git operations use personal SSH key
git clone git@github.com:ichoake/repo.git
cd repo
git push     # Uses personal key automatically
```

### Method 2: Using SSH Host Aliases

Clone repos using the SSH host aliases:

**AvatarArts:**
```bash
# Clone using avatararts alias
git clone git@github-avatararts:AvaTar-ArTs/your-repo.git

# Or use the alternate form
git clone git@github.com-avatararts:AvaTar-ArTs/your-repo.git
```

**Personal (ichoake):**
```bash
# Clone using ichoake alias
git clone git@github-ichoake:ichoake/your-repo.git

# Or use the alternate form
git clone git@github.com-ichoake:ichoake/your-repo.git
```

---

## 🔄 Complete Workflows

### AvatarArts Workflow (SSH)

```bash
# Start nlma session (auto-loads SSH config)
nlma profile current

# Clone a repo (method 1 - automatic)
git clone git@github.com:AvaTar-ArTs/my-project.git
cd my-project

# Or clone with alias (method 2)
git clone git@github-avatararts:AvaTar-ArTs/my-project.git
cd my-project

# Work on code
git add .
git commit -m "Update"
git push  # Uses avatararts SSH key

# Check NotebookLM
nlma ask "What's in my automation docs?"
```

### Personal Workflow (SSH)

```bash
# Start nlmcho session (auto-loads SSH config)
nlmcho profile current

# Clone a repo (method 1 - automatic)
git clone git@github.com:ichoake/my-notes.git
cd my-notes

# Or clone with alias (method 2)
git clone git@github-ichoake:ichoake/my-notes.git
cd my-notes

# Work on code
git add .
git commit -m "Update"
git push  # Uses personal SSH key

# Check NotebookLM
nlmcho ask "What's in my personal notes?"
```

---

## 🔧 Manual SSH Configuration

### Set SSH for AvatarArts

```bash
# Export SSH command
export GIT_SSH_COMMAND="ssh -i ~/.ssh/id_ed25519_avatararts"

# Now git uses avatararts key
git push
```

### Set SSH for Personal

```bash
# Export SSH command
export GIT_SSH_COMMAND="ssh -i ~/.ssh/id_ed25519"

# Now git uses personal key
git push
```

---

## 🎯 Auto-Configuration Features

When you run `nlma` or `nlmcho`, these are automatically set:

### nlma (AvatarArts)
```bash
export GIT_SSH_COMMAND="ssh -i ~/.ssh/id_ed25519_avatararts -F ~/.ssh/config"
export GIT_AUTHOR_EMAIL="me@avatararts.org"
export GIT_COMMITTER_EMAIL="me@avatararts.org"
export GITHUB_TOKEN="<avatararts-token>"
```

### nlmcho (Personal)
```bash
export GIT_SSH_COMMAND="ssh -i ~/.ssh/id_ed25519 -F ~/.ssh/config"
export GIT_AUTHOR_EMAIL="sjchaplinski@gmail.com"
export GIT_COMMITTER_EMAIL="sjchaplinski@gmail.com"
export GITHUB_TOKEN="<ichoake-token>"
```

---

## ✅ Verify SSH Keys

### Test AvatarArts SSH

```bash
# Test connection
ssh -i ~/.ssh/id_ed25519_avatararts -T git@github.com

# Expected output:
# Hi AvaTar-ArTs! You've successfully authenticated...
```

### Test Personal SSH

```bash
# Test connection
ssh -i ~/.ssh/id_ed25519 -T git@github.com

# Expected output:
# Hi ichoake! You've successfully authenticated...
```

### Test with Host Aliases

```bash
# Test avatararts alias
ssh -T git@github-avatararts

# Test ichoake alias
ssh -T git@github-ichoake
```

---

## 📊 SSH Key Information

### View Your Keys

```bash
# List all SSH keys
ls -la ~/.ssh/*.pub

# View avatararts public key
cat ~/.ssh/id_ed25519_avatararts.pub
# ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICBnYw9sXbdRScqX9qRivS0SZBvkORmDHS1fyo1CKbr3 me@avatararts.org

# View personal public key
cat ~/.ssh/id_ed25519.pub
# ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL2L7RRbY4bczdF56UaVsPciXsjMiotCY0uYOjl044oe steven@newCho.local
```

---

## 🔐 Add Keys to GitHub

### Add AvatarArts Key

1. Copy the public key:
```bash
cat ~/.ssh/id_ed25519_avatararts.pub | pbcopy
```

2. Go to: https://github.com/settings/keys
3. Login with **me@avatararts.org**
4. Click "New SSH key"
5. Title: `MacBook - AvatarArts`
6. Paste key
7. Add key

### Add Personal Key

1. Copy the public key:
```bash
cat ~/.ssh/id_ed25519.pub | pbcopy
```

2. Go to: https://github.com/settings/keys
3. Login with **sjchaplinski@gmail.com**
4. Click "New SSH key"
5. Title: `MacBook - Personal`
6. Paste key
7. Add key

---

## 🎨 Git Clone Cheat Sheet

### AvatarArts Repos

```bash
# Method 1: Automatic (after running nlma)
nlma list  # Sets up environment
git clone git@github.com:AvaTar-ArTs/repo-name.git

# Method 2: Using SSH alias
git clone git@github-avatararts:AvaTar-ArTs/repo-name.git

# Method 3: Manual SSH
GIT_SSH_COMMAND="ssh -i ~/.ssh/id_ed25519_avatararts" \
  git clone git@github.com:AvaTar-ArTs/repo-name.git
```

### Personal Repos

```bash
# Method 1: Automatic (after running nlmcho)
nlmcho list  # Sets up environment
git clone git@github.com:ichoake/repo-name.git

# Method 2: Using SSH alias
git clone git@github-ichoake:ichoake/repo-name.git

# Method 3: Manual SSH
GIT_SSH_COMMAND="ssh -i ~/.ssh/id_ed25519" \
  git clone git@github.com:ichoake/repo-name.git
```

---

## 🔄 Switching Between Accounts

### Quick Switch

```bash
# Work on avatararts project
cd ~/code/avatararts-project
nlma list  # Auto-configures for avatararts
git push

# Switch to personal project
cd ~/code/personal-project
nlmcho list  # Auto-configures for personal
git push
```

### Persistent Environment

```bash
# Set up avatararts environment for the whole terminal session
nlma list
# Now all git commands use avatararts SSH key

# Later, switch to personal
nlmcho list
# Now all git commands use personal SSH key
```

---

## 🐛 Troubleshooting

### Issue: Permission denied (publickey)

**Cause:** Wrong SSH key being used

**Solution:**
```bash
# Verify which key is being used
ssh -vT git@github.com 2>&1 | grep "identity file"

# Force correct key
export GIT_SSH_COMMAND="ssh -i ~/.ssh/id_ed25519_avatararts"
git push
```

### Issue: Wrong GitHub account detected

**Cause:** SSH key associated with different account

**Solution:**
```bash
# Test connection
ssh -T git@github.com
# Shows which account is authenticated

# Use correct profile command
nlma list   # For avatararts
nlmcho list # For personal
```

### Issue: Host key verification failed

**Solution:**
```bash
# Add GitHub to known hosts
ssh-keyscan github.com >> ~/.ssh/known_hosts

# Or remove and re-add
ssh-keygen -R github.com
ssh -T git@github.com
```

---

## 📖 SSH vs HTTPS

You can use either SSH or HTTPS with tokens:

### SSH (Recommended for development)

**Pros:**
- No password prompts
- Faster authentication
- More secure (key-based)

**Cons:**
- Requires SSH key setup on each machine
- Can't use behind some firewalls

### HTTPS with Tokens

**Pros:**
- Works everywhere
- Easy to set up
- Good for CI/CD

**Cons:**
- Token in environment
- Slightly slower

**Both are configured!** Use whichever you prefer:

```bash
# SSH
git clone git@github-avatararts:AvaTar-ArTs/repo.git

# HTTPS (uses token from nlma/nlmcho)
git clone https://github.com/AvaTar-ArTs/repo.git
```

---

## ✅ Complete Setup Summary

**AvatarArts (nlma):**
- ✅ SSH Key: `~/.ssh/id_ed25519_avatararts`
- ✅ SSH Host: `github-avatararts`
- ✅ Email: me@avatararts.org
- ✅ Auto-configured by `nlma` command

**Personal (nlmcho):**
- ✅ SSH Key: `~/.ssh/id_ed25519`
- ✅ SSH Host: `github-ichoake`
- ✅ Email: sjchaplinski@gmail.com
- ✅ Auto-configured by `nlmcho` command

**Usage:**
```bash
nlma list   # Sets up avatararts SSH + git config
nlmcho list # Sets up personal SSH + git config
```

**Clone with either:**
```bash
# SSH
git clone git@github-avatararts:AvaTar-ArTs/repo.git
git clone git@github-ichoake:ichoake/repo.git

# HTTPS (uses tokens)
git clone https://github.com/AvaTar-ArTs/repo.git
git clone https://github.com/ichoake/repo.git
```

---

*SSH setup completed: 2026-01-14*
