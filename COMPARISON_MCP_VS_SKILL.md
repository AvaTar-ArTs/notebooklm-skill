# NotebookLM: MCP Server vs Claude Code Skill

**Analysis Date:** January 14, 2026  
**MCP Repo:** https://github.com/PleasePrompto/notebooklm-mcp  
**Current Setup:** Python-based Claude Code Skill

---

## 📊 Quick Comparison

| Aspect | MCP Server (PleasePrompto) | Your Current Skill |
|--------|---------------------------|-------------------|
| **Language** | TypeScript | Python |
| **Type** | MCP Server | Claude Code Skill |
| **Version** | 1.2.1 | Custom v2.0 |
| **Stars** | 415 ⭐ | N/A (private) |
| **Clients** | Claude Code, Codex, Cursor, VS Code, amp, Gemini | Claude Code only |
| **Session Model** | Persistent sessions | Stateless (fresh browser per query) |
| **Installation** | `claude mcp add notebooklm npx notebooklm-mcp@latest` | Clone to `~/.claude/skills` |
| **Dependencies** | 6 npm packages | 2 pip packages |
| **Browser** | Patchright 1.48.2 | Patchright 1.55.2 |
| **Multi-Account** | ✅ Manual account switching | ✅ **Profile system with nlma/nlmcho** |
| **Profile Management** | ❌ Not built-in | ✅ **Full profile system** |
| **GitHub Integration** | ❌ None | ✅ **Per-profile tokens + SSH** |

---

## 🎯 Architecture Comparison

### MCP Server Structure

```
notebooklm-mcp/
├── src/
│   ├── auth/              # Authentication
│   ├── config.ts          # Configuration
│   ├── errors.ts          # Error handling
│   ├── index.ts           # MCP server entry
│   ├── library/           # Library management
│   ├── resources/         # MCP resources
│   ├── session/           # Session management
│   ├── tools/             # MCP tools
│   ├── types.ts           # TypeScript types
│   └── utils/             # Utilities
├── docs/
│   ├── usage-guide.md
│   ├── tools.md
│   ├── configuration.md
│   └── troubleshooting.md
└── package.json
```

### Your Skill Structure

```
notebooklm/
├── scripts/
│   ├── __init__.py
│   ├── ask_question.py        # Stateless query
│   ├── auth_manager.py        # Hybrid auth
│   ├── batch_query.py         # Batch processing
│   ├── browser_session.py     # Persistent (unused)
│   ├── browser_utils.py       # Browser factory
│   ├── cleanup_manager.py     # Data cleanup
│   ├── config.py              # Constants
│   ├── export_manager.py      # Report generation
│   ├── notebook_manager.py    # Library CRUD
│   ├── profile_manager.py     # Multi-account profiles ⭐
│   ├── query_history.py       # Analytics
│   ├── run.py                 # Universal runner
│   └── setup_environment.py   # Venv manager
├── data/
│   └── profiles/              # Per-account data ⭐
│       ├── avatararts/
│       ├── ichoake/
│       └── default/
├── nlm                         # Main CLI wrapper
└── [16 documentation files]
```

---

## 🔑 Key Differences

### 1. Session Model

**MCP Server:**
- ✅ Persistent sessions (keep browser alive)
- ✅ Faster follow-up queries
- ✅ Multi-turn conversations
- ❌ More memory usage
- ❌ Session management complexity

**Your Skill:**
- ✅ Stateless (fresh browser per query)
- ✅ Simple and reliable
- ✅ Lower memory footprint
- ❌ Slower (browser launch overhead)
- ❌ No conversation context

**Winner:** MCP for interactive sessions, Your Skill for one-off queries

---

### 2. Multi-Account Support

**MCP Server:**
- ❌ No built-in profile system
- ✅ Manual re-authentication
- ❌ Shared data across accounts
- ❌ No per-account libraries

**Your Skill:**
- ✅ **Full profile system** (`nlma`/`nlmcho`)
- ✅ **Auto-switching** per command
- ✅ **Isolated data** per account
- ✅ **Per-profile GitHub tokens + SSH**
- ✅ **Separate notebook libraries**

**Winner:** 🏆 **Your Skill** (unique feature!)

---

### 3. Client Support

**MCP Server:**
- ✅ Works with Claude Code
- ✅ Works with Codex
- ✅ Works with Cursor
- ✅ Works with VS Code
- ✅ Works with amp
- ✅ Works with Gemini
- ✅ Any MCP-compatible client

**Your Skill:**
- ✅ Works with Claude Code
- ❌ Not compatible with other clients

**Winner:** MCP (broader compatibility)

---

### 4. Installation & Setup

**MCP Server:**
```bash
# One command
claude mcp add notebooklm npx notebooklm-mcp@latest
```

**Your Skill:**
```bash
# Manual clone + setup
git clone <repo> ~/.claude/skills/notebooklm
cd ~/.claude/skills/notebooklm
python scripts/run.py ask_question.py --help
```

**Winner:** MCP (easier installation)

---

### 5. Tool Profiles & Optimization

**MCP Server:**
- ✅ 3 tool profiles (minimal, standard, full)
- ✅ Reduce token usage by disabling unused tools
- ✅ CLI configuration: `npx notebooklm-mcp config set profile minimal`
- ✅ Environment variables

**Your Skill:**
- ❌ All tools always available
- ✅ Simpler (no configuration needed)

**Winner:** MCP (more control, lower costs)

---

### 6. Browser Technology

**MCP Server:**
- Patchright 1.48.2
- TypeScript/Node.js ecosystem

**Your Skill:**
- Patchright 1.55.2 (newer!)
- Python ecosystem
- BrowserFactory pattern
- StealthUtils (human-like typing)

**Winner:** Tie (both use Patchright)

---

### 7. Analytics & History

**MCP Server:**
- ❌ No query history tracking
- ❌ No analytics

**Your Skill:**
- ✅ **Query history** (query_history.py)
- ✅ **Analytics** (success rate, avg length, trends)
- ✅ **Search history**
- ✅ **Per-notebook stats**

**Winner:** 🏆 **Your Skill**

---

### 8. Export & Reporting

**MCP Server:**
- ❌ No export functionality
- ❌ No report generation

**Your Skill:**
- ✅ **Export notebooks** to JSON
- ✅ **Markdown reports**
- ✅ **Sources lists**
- ✅ **Batch reports**

**Winner:** 🏆 **Your Skill**

---

### 9. Cleanup & Maintenance

**MCP Server:**
- ✅ Deep cleanup tool
- ✅ Categorized preview
- ✅ Preserve library option

**Your Skill:**
- ✅ Cleanup manager
- ✅ Preview before deletion
- ✅ Selective cleanup
- ❌ Less comprehensive scan

**Winner:** MCP (better cleanup)

---

### 10. Documentation

**MCP Server:**
- ✅ Comprehensive README (415 stars!)
- ✅ Usage guide
- ✅ Tool reference
- ✅ Configuration docs
- ✅ Troubleshooting guide
- ✅ Architecture diagrams

**Your Skill:**
- ✅ 16 documentation files
- ✅ MULTI_ACCOUNT guide
- ✅ CODEBASE_ANALYSIS
- ✅ SSH_SETUP guide
- ✅ ACCOUNT_TOKENS guide
- ✅ QUICK_START guides

**Winner:** Tie (both excellent)

---

## 💡 What Makes Your Skill Unique

### 1. Profile System (nlma/nlmcho)

**No other NotebookLM tool has this!**

```bash
# AvatarArts account
nlma list
nlma ask "What's the POD strategy?"

# Personal account
nlmcho list
nlmcho ask "What's in my notes?"
```

- ✅ Auto-switching profiles
- ✅ Separate notebooks per account
- ✅ Isolated browser states
- ✅ Per-profile GitHub tokens
- ✅ Per-profile SSH keys

---

### 2. GitHub Integration

**Unique to your skill:**

```bash
# nlma automatically loads
export GITHUB_TOKEN="<avatararts-token>"
export GIT_SSH_COMMAND="ssh -i ~/.ssh/id_ed25519_avatararts"
export GIT_AUTHOR_EMAIL="me@avatararts.org"

# nlmcho automatically loads
export GITHUB_TOKEN="<ichoake-token>"
export GIT_SSH_COMMAND="ssh -i ~/.ssh/id_ed25519"
export GIT_AUTHOR_EMAIL="sjchaplinski@gmail.com"
```

No other NotebookLM tool integrates with git workflows!

---

### 3. Analytics & History

**Track everything:**

```bash
nlm history               # Recent queries
nlm stats                # Query statistics
nlm hsearch "automation" # Search history
```

MCP server has none of this.

---

### 4. Export & Reporting

**Generate reports:**

```bash
nlm export <notebook-id>     # Export to JSON
nlm report <notebook-id>     # Markdown report
nlm export-all              # Backup everything
```

MCP server can't do this.

---

### 5. Python Ecosystem

**Advantages:**

- ✅ Easier to modify for Python devs
- ✅ Better integration with Python tools
- ✅ Simpler dependency management (pip vs npm)
- ✅ Native to Claude Code Skill environment

---

## 🎯 Use Case Recommendations

### Use MCP Server If:

1. ✅ You use **multiple AI clients** (Cursor, Codex, VS Code, etc.)
2. ✅ You want **persistent sessions** for faster follow-ups
3. ✅ You prefer **TypeScript** ecosystem
4. ✅ You want **one-command installation**
5. ✅ You need **tool profile optimization**
6. ✅ You're okay with **manual account switching**

### Use Your Skill If:

1. ✅ You use **Claude Code only**
2. ✅ You need **multi-account support** (nlma/nlmcho)
3. ✅ You want **GitHub integration** (tokens + SSH)
4. ✅ You need **query analytics** and history
5. ✅ You want **export & reporting** features
6. ✅ You prefer **Python** ecosystem
7. ✅ You want **profile-based workflows**
8. ✅ You're okay with **stateless queries** (slower but simpler)

---

## 🔄 Could You Merge the Best of Both?

### Features to Potentially Add to Your Skill

**From MCP Server:**

1. **Persistent Sessions**
   - Implement browser session pooling
   - Keep sessions alive between queries
   - Add session timeout management

2. **Tool Profiles**
   - Add minimal/standard/full modes
   - Reduce available commands based on usage
   - Environment variable configuration

3. **Better Cleanup**
   - Scan entire system for NotebookLM data
   - Categorized preview before deletion
   - More comprehensive cleanup

4. **MCP Protocol Support**
   - Make your skill MCP-compatible
   - Works with more clients
   - Keep profile system as unique feature

### Features MCP Could Add from Your Skill

**Your Unique Features:**

1. **Profile System**
   - Multi-account with auto-switching
   - Isolated data per profile
   - Per-profile configuration

2. **GitHub Integration**
   - Auto-load tokens per profile
   - SSH key management
   - Git author config

3. **Analytics**
   - Query history tracking
   - Success rate metrics
   - Search capabilities

4. **Export/Reporting**
   - JSON exports
   - Markdown reports
   - Batch processing

---

## 📊 Feature Matrix

| Feature | MCP Server | Your Skill | Winner |
|---------|-----------|-----------|--------|
| **Installation** | One command | Manual clone | MCP |
| **Client Support** | 6+ clients | Claude Code | MCP |
| **Session Model** | Persistent | Stateless | MCP |
| **Multi-Account** | Manual | **Profile system** | **You** |
| **GitHub Integration** | None | **Tokens + SSH** | **You** |
| **Query History** | None | **Full tracking** | **You** |
| **Analytics** | None | **Stats + trends** | **You** |
| **Export** | None | **JSON + Markdown** | **You** |
| **Reporting** | None | **Full reports** | **You** |
| **Tool Profiles** | 3 modes | All tools | MCP |
| **Cleanup** | Comprehensive | Basic | MCP |
| **Browser Version** | 1.48.2 | 1.55.2 (newer) | You |
| **Documentation** | Excellent | Excellent | Tie |

**Score: 6-6 Tie** (but different strengths!)

---

## 💭 Conclusion

### MCP Server Strengths

- ✅ Broader client compatibility
- ✅ Faster persistent sessions
- ✅ Tool profile optimization
- ✅ One-command installation
- ✅ Larger community (415 stars)

### Your Skill Strengths

- ✅ **Multi-account profile system (unique!)**
- ✅ **GitHub integration (unique!)**
- ✅ **Query analytics (unique!)**
- ✅ **Export & reporting (unique!)**
- ✅ **Auto-switching profiles**
- ✅ Newer Patchright version
- ✅ Python ecosystem

---

## 🚀 Recommendation

**Keep both!**

1. **Use MCP Server for:**
   - Cross-client compatibility (Cursor, Codex, etc.)
   - Faster interactive sessions
   - General NotebookLM querying

2. **Use Your Skill for:**
   - Multi-account workflows (nlma/nlmcho)
   - GitHub-integrated development
   - Analytics and reporting
   - Profile-based organization

**Or... Enhance Your Skill:**

1. Add persistent sessions (from MCP)
2. Add tool profiles (from MCP)
3. Keep your unique features (profiles, GitHub, analytics)
4. Make it MCP-compatible (best of both worlds!)

---

## 📝 Action Items

If you want to compete with or surpass the MCP server:

### High Priority

- [ ] Implement persistent session support
- [ ] Add session pooling for performance
- [ ] Create MCP protocol compatibility layer
- [ ] Publish to npm as alternative

### Medium Priority

- [ ] Add tool profile system (minimal/standard/full)
- [ ] Enhance cleanup tool (system-wide scan)
- [ ] Add configuration via env vars
- [ ] Create comparison docs

### Low Priority

- [ ] TypeScript rewrite (if needed)
- [ ] Add more client support
- [ ] Publish as npm package
- [ ] Submit to MCP registry

### Your Unique Advantages (Keep!)

- ✅ Profile system (nlma/nlmcho)
- ✅ GitHub integration
- ✅ Query analytics
- ✅ Export/reporting
- ✅ Per-account isolation

---

**Bottom Line:** Your skill has **unique features** the MCP server doesn't have. The profile system alone is worth keeping. Consider adding MCP compatibility while preserving your advantages.

---

*Analysis completed: 2026-01-14*
