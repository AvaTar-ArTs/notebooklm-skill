# NotebookLM Directories - Cleanup Guide

**Analysis Date:** January 14, 2026

---

## 📊 What You Have

### 1. **`/Users/steven/.claude/skills/notebooklm`** ⭐ PRIMARY
**Status:** ✅ **THIS IS THE ONE YOU NEED**

- **Type:** Real directory (not symlink)
- **Purpose:** Active Claude skill
- **Git Repo:** Yes → https://github.com/AvaTar-ArTs/notebooklm-skill.git
- **Contains:**
  - ✅ All analysis documents (HANDOFF_ANALYSIS.md, IMPROVEMENT_ROADMAP.md, etc.)
  - ✅ Your working data (`data/` directory with auth & notebooks)
  - ✅ Virtual environment (`.venv/`)
  - ✅ All latest changes pushed to GitHub
  - ✅ GITHUB_TOKEN_SETUP.md

**Action:** ✅ **KEEP THIS** - It's your main working directory

---

### 2. **`/Users/steven/notebookllm`** (double 'l')
**Status:** 🔗 Symlink → points to `.claude/skills/notebooklm`

- **Type:** Symbolic link
- **Purpose:** Shortcut for easier access
- **Points to:** `/Users/steven/.claude/skills/notebooklm`

**Why it exists:** You probably created this symlink to avoid typing the full path

**Action:** 
- ✅ **KEEP** - Useful shortcut (if you use it)
- ⚠️ **DELETE** - If you never use it (optional cleanup)

---

### 3. **`/Users/steven/notebooklm`** (single 'l')
**Status:** 🔗 Symlink → points to `.claude/skills/notebooklm`

- **Type:** Symbolic link
- **Purpose:** Another shortcut (duplicate of #2!)
- **Points to:** `/Users/steven/.claude/skills/notebooklm`

**Why it exists:** Probably created by accident (typo: single vs double 'l')

**Action:** ⚠️ **DELETE** - This is a duplicate, you only need one symlink

---

### 4. **`/Users/steven/notebooklm.clone.20260114031210`**
**Status:** 📦 Backup clone (outdated)

- **Type:** Real directory (git clone)
- **Purpose:** Backup of original PleasePrompto repo
- **Git Repo:** Yes → https://github.com/PleasePrompto/notebooklm-skill (original)
- **Created:** Jan 14, 2026 03:12:10
- **Contains:** Original files before your enhancements

**Why it exists:** This is a snapshot/backup before you made changes

**Action:** 
- 📦 **ARCHIVE** - Move to `~/backups/` or `~/Documents/backups/`
- 🗑️ **DELETE** - If you don't need the backup (your work is on GitHub)

---

## 🎯 Recommended Actions

### Option A: Clean and Simple (Recommended)

Keep only what you need:

```bash
# 1. Keep the main skill directory (already in place)
# /Users/steven/.claude/skills/notebooklm → KEEP

# 2. Keep ONE symlink for convenience (fix the typo)
rm /Users/steven/notebooklm  # Remove the single-l version
# Keep: /Users/steven/notebookllm (double-l)

# 3. Archive or delete the old clone
mkdir -p ~/backups
mv /Users/steven/notebooklm.clone.20260114031210 ~/backups/
# Or delete: rm -rf /Users/steven/notebooklm.clone.20260114031210
```

**Result:** Clean home directory, one shortcut, main skill works perfectly

---

### Option B: Minimal (Most Aggressive)

Only keep the skill directory:

```bash
# 1. Remove both symlinks
rm /Users/steven/notebookllm   # double-l
rm /Users/steven/notebooklm    # single-l

# 2. Delete the old clone
rm -rf /Users/steven/notebooklm.clone.20260114031210

# 3. Access skill via full path
cd ~/.claude/skills/notebooklm
```

**Result:** No clutter, direct access only

---

### Option C: Keep Everything

Do nothing - all directories serve a purpose:

- Main skill: `.claude/skills/notebooklm`
- Quick access: `~/notebookllm` and `~/notebooklm`
- Backup: `~/notebooklm.clone.20260114031210`

**Result:** Most disk space used, but safe

---

## 📋 Detailed Comparison

| Directory | Type | Size | Git Remote | Purpose | Recommendation |
|-----------|------|------|------------|---------|----------------|
| `~/.claude/skills/notebooklm` | Real | ~100 MB | AvaTar-ArTs/notebooklm-skill | **Active skill** | ✅ **KEEP** |
| `~/notebookllm` (double-l) | Symlink | 0 KB | (points to above) | Shortcut | ✅ Keep or ⚠️ Delete |
| `~/notebooklm` (single-l) | Symlink | 0 KB | (points to above) | Duplicate shortcut | ⚠️ **DELETE** |
| `~/notebooklm.clone.20260114031210` | Real | ~50 MB | PleasePrompto/notebooklm-skill | Old backup | 📦 Archive or 🗑️ Delete |

---

## 🔍 Understanding Symlinks

### What's a Symlink?

A symbolic link (symlink) is like a shortcut:
- Takes up almost no space (~0 KB)
- Points to another file/directory
- Changes made to symlink affect the original

### Example:

```bash
# These all access THE SAME files:
cd /Users/steven/.claude/skills/notebooklm  # Original
cd /Users/steven/notebookllm                # Symlink 1
cd /Users/steven/notebooklm                 # Symlink 2

# They're all the same directory!
# Any change in one appears in all others
```

---

## 🧹 Cleanup Script

### Safe Cleanup (Recommended)

```bash
#!/bin/bash
# Safe cleanup script for NotebookLM directories

echo "🧹 NotebookLM Directory Cleanup"
echo "================================"
echo ""

# Step 1: Remove duplicate symlink (single-l version)
if [ -L /Users/steven/notebooklm ]; then
    echo "Removing duplicate symlink: ~/notebooklm (single-l)"
    rm /Users/steven/notebooklm
    echo "✅ Removed"
else
    echo "⏭️  ~/notebooklm already removed or doesn't exist"
fi
echo ""

# Step 2: Archive old clone
if [ -d /Users/steven/notebooklm.clone.20260114031210 ]; then
    echo "Archiving old clone to ~/backups/"
    mkdir -p ~/backups
    mv /Users/steven/notebooklm.clone.20260114031210 ~/backups/
    echo "✅ Archived to ~/backups/notebooklm.clone.20260114031210"
else
    echo "⏭️  Old clone already moved or doesn't exist"
fi
echo ""

# Step 3: Verify main skill is intact
if [ -d /Users/steven/.claude/skills/notebooklm/.git ]; then
    echo "✅ Main skill directory verified: ~/.claude/skills/notebooklm"
else
    echo "⚠️  WARNING: Main skill directory has issues!"
fi
echo ""

# Step 4: Verify remaining symlink
if [ -L /Users/steven/notebookllm ]; then
    echo "✅ Shortcut symlink available: ~/notebookllm → ~/.claude/skills/notebooklm"
else
    echo "⚠️  Shortcut symlink missing - create with:"
    echo "   ln -s ~/.claude/skills/notebooklm ~/notebookllm"
fi
echo ""

echo "🎉 Cleanup complete!"
echo ""
echo "Summary:"
echo "  ✅ Main skill: ~/.claude/skills/notebooklm"
echo "  ✅ Shortcut: ~/notebookllm"
echo "  📦 Backup: ~/backups/notebooklm.clone.20260114031210"
```

Save this as `cleanup_notebooklm.sh` and run:
```bash
chmod +x cleanup_notebooklm.sh
./cleanup_notebooklm.sh
```

---

## 🎯 My Recommendation

**Do Option A - Clean and Simple:**

1. ✅ **Keep** the main skill: `~/.claude/skills/notebooklm`
2. ✅ **Keep** one symlink: `~/notebookllm` (double-l, easier to remember)
3. ⚠️ **Delete** duplicate: `~/notebooklm` (single-l, confusing)
4. 📦 **Archive** old clone to `~/backups/`

**Why?**
- Main skill stays safe and functional
- One convenient shortcut for quick access
- No duplicate confusion
- Old backup archived (not lost) if you ever need it
- Clean, organized home directory

**Commands:**
```bash
# Execute cleanup
rm /Users/steven/notebooklm
mkdir -p ~/backups
mv /Users/steven/notebooklm.clone.20260114031210 ~/backups/

# Verify
ls -la ~ | grep notebook
# Should show only: notebookllm -> /.claude/skills/notebooklm

# Test shortcut works
cd ~/notebookllm
pwd
# Should output: /Users/steven/.claude/skills/notebooklm
```

---

## 📊 Disk Space

### Current Usage
- Main skill: ~100 MB (includes .venv, data/)
- Symlinks: ~0 KB each
- Old clone: ~50 MB
- **Total:** ~150 MB

### After Cleanup (Option A)
- Main skill: ~100 MB
- One symlink: ~0 KB
- Backup (archived): ~50 MB
- **Total:** ~150 MB (same, but organized)

### After Cleanup (Option B - Aggressive)
- Main skill: ~100 MB only
- **Saved:** ~50 MB by deleting backup

---

## ✅ Verification Checklist

After cleanup, verify everything works:

```bash
# 1. Check main skill directory
cd ~/.claude/skills/notebooklm
git status
# Should show: "On branch master, Your branch is up to date"

# 2. Check symlink (if kept)
cd ~/notebookllm
pwd
# Should show: /Users/steven/.claude/skills/notebooklm

# 3. Test skill functionality
python scripts/run.py notebook_manager.py list
# Should list your 3 notebooks

# 4. Test git operations
git pull origin master
# Should work without errors

# 5. Check home directory is clean
ls -la ~ | grep notebook
# Should show minimal clutter
```

---

## 🆘 If Something Goes Wrong

### Backup is Available

If you accidentally delete something important:
1. Old clone is in `~/backups/notebooklm.clone.20260114031210`
2. Or fetch fresh from GitHub: `git clone https://github.com/AvaTar-ArTs/notebooklm-skill.git`

### Recreate Symlink

If you delete the symlink and want it back:
```bash
ln -s ~/.claude/skills/notebooklm ~/notebookllm
```

### Restore from GitHub

Your work is safe on GitHub:
```bash
cd ~/.claude/skills
rm -rf notebooklm  # Remove corrupted version
git clone https://github.com/AvaTar-ArTs/notebooklm-skill.git notebooklm
cd notebooklm
python scripts/run.py auth_manager.py setup  # Re-authenticate
```

---

## 📝 Summary

**Current Situation:**
- 1 real working directory (correct location)
- 2 duplicate symlinks (confusing)
- 1 old backup clone (outdated)

**Recommended:**
- Keep 1 working directory
- Keep 1 symlink for convenience
- Archive backup, remove duplicate

**Result:**
- ✅ Clean and organized
- ✅ Functional and convenient
- ✅ Backed up and safe

---

**Questions?** See the main analysis documents:
- `HANDOFF_ANALYSIS.md` - Executive summary
- `IMPROVEMENT_ROADMAP.md` - Technical details
- `GITHUB_TOKEN_SETUP.md` - Authentication guide

---

*Cleanup guide generated: 2026-01-14*
