# Restore Tool

Interactive Git save point browser that lets you navigate and restore commits without using tokens in AI coding assistants.

## Why this exists

When using AI coding tools like Claude Code, simple Git operations consume tokens and cost money. This tool handles Git navigation locally, saving tokens for actual coding tasks.

## What it does

**Restore** is an interactive terminal application that:

- **Lists save points**: Shows all commits with `[SAVE #N]` format in a clean menu
- **Preview changes**: See commit details, files changed, and diff preview before restoring
- **Safe restore**: Handles uncommitted changes with options to stash, discard, or cancel
- **Smart navigation**: Arrow key navigation with visual indicators for current position
- **Zero-cost Git browsing**: No AI tokens used for exploring your commit history

## How it works

The tool looks for commits with the special format `[SAVE #N] Description`. These act as bookmarks in your Git history that you can easily navigate and restore to.

## Installation

### Option 1: Homebrew (Recommended)
```bash
brew tap LucasZNK/restore
brew install restore
```

### Option 2: Manual Installation
```bash
# Clone and install
git clone https://github.com/LucasZNK/restore.git
cd restore
chmod +x restore

# Install globally (optional)
sudo ln -sf $(pwd)/restore /usr/local/bin/restore
```

Or run the installer:
```bash
./install.sh
```

## Usage

### 1. Create save points

Create commits with the special `[SAVE #N]` format:

```bash
# Work on your code...
git add .
git commit -m "[SAVE #1] Initial project setup"

# Make more changes...
git add .
git commit -m "[SAVE #2] Added user authentication"

# Continue development...
git add .
git commit -m "[SAVE #3] Fixed login bug"
```

**Tip**: Use your AI assistant's `/save` command if available, or create these commits manually.

### 2. Browse and restore save points

Simply run `restore` in any Git repository:

```bash
restore
```

You'll see an interactive menu like this:

```
🔄 Interactive Git Restore Tool
Navigate with ↑↓ arrows, Enter to select, q to quit

🌿 Branch: main
📝 Current: a1b2c3d

Recent Commits:

→ 🔥✨ def4567 [SAVE #3] Fixed login bug ⏰ 2 hours ago by Lucas
     abc1234 [SAVE #2] Added user authentication ⏰ 1 day ago by Lucas  
     xyz9876 [SAVE #1] Initial project setup ⏰ 2 days ago by Lucas
```

### 3. Navigation

- **↑/↓ arrows**: Navigate between save points
- **Enter**: Select and preview a save point
- **q**: Quit the application

### 4. Preview and restore

When you select a save point, you'll see:

- **Commit details**: Hash, message, date, author
- **Changed files**: List of modified files with stats
- **Diff preview**: First 20 lines of changes
- **Restore confirmation**: Option to restore or cancel

### 5. Handling uncommitted changes

If you have uncommitted changes when trying to restore, the tool will ask:

1. **Stash changes** (recommended) - Saves your work for later
2. **Discard changes** - Permanently removes uncommitted work  
3. **Cancel** - Abort the restore operation

## Example Workflow

```bash
# 1. Create a save point
git add .
git commit -m "[SAVE #1] Working login form"

# 2. Continue coding, make changes...
# 3. Create another save point
git add .
git commit -m "[SAVE #2] Added validation"

# 4. Something breaks, need to go back
restore

# 5. Navigate to [SAVE #1], preview changes, restore
# 6. You're back to the working login form state
```

## Save Point Convention

The tool recognizes commits with this exact pattern:
- `[SAVE #N]` where N is any number
- Followed by a space and description

**Valid examples:**
```bash
[SAVE #1] Initial setup
[SAVE #42] Fixed critical bug  
[SAVE #999] Refactored user module
```

**Invalid examples:**
```bash
SAVE #1: Initial setup          # Missing brackets
[Save #1] Initial setup         # Wrong capitalization  
[SAVE#1] Initial setup          # Missing space
```

## Features in Detail

### Interactive Navigation
- Color-coded output for better readability
- Visual indicators showing current commit and selection
- Responsive arrow key navigation
- Clear exit options

### Safe Operations
- Always shows preview before making changes
- Handles uncommitted work gracefully
- Creates helpful stash messages with timestamps
- Never loses your work without confirmation

### Git Integration
- Works with any Git repository
- Preserves branch information
- Shows helpful Git commands for next steps
- Handles detached HEAD state properly

## Requirements

- **Git**: Must be installed and repository must be a Git repo
- **Bash 4.0+**: Modern shell support
- **Color terminal**: For best visual experience (works without color too)

## Troubleshooting

**"No save points found"**
- Make sure you have commits with `[SAVE #N]` format
- Check that you're in a Git repository

**"Not in a Git repository"**  
- Navigate to a folder that contains a `.git` directory
- Initialize Git with `git init` if needed

**Colors not showing**
- Your terminal may not support colors
- Tool will still work, just without color coding

## License

MIT - Feel free to modify and distribute.