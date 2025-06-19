# Restore Tool

Interactive Git save point browser that lets you navigate and restore commits without using tokens in AI coding assistants.

![Screenshot 2025-06-19 at 8 16 05 PM](https://github.com/user-attachments/assets/4da979bd-a8a5-4403-94de-b05924922649)

## Why this exists

When using AI coding tools like Claude Code, simple Git operations consume tokens and cost money. This tool handles Git navigation locally, saving tokens for actual coding tasks.

## What it does

**Restore** is an interactive terminal application that:

- **Browse commits**: Shows all recent commits in a clean, navigable menu
- **Preview changes**: See commit details, files changed, and diff preview before restoring
- **Safe restore**: Handles uncommitted changes with options to stash, discard, or cancel
- **Smart navigation**: Arrow key navigation with visual indicators for current position
- **Zero-cost Git browsing**: No AI tokens used for exploring your commit history

## How it works

The tool shows all recent commits and lets you navigate and restore to any of them. Simple interactive Git browsing without command-line complexity.

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

### 1. Work normally with Git

Create commits as you normally would:

```bash
# Work on your code...
git add .
git commit -m "Initial project setup"

# Make more changes...
git add .
git commit -m "Added user authentication"

# Continue development...
git add .
git commit -m "Fixed login bug"
```

### 2. Browse and restore commits

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

→ 🔥✨ def4567 Fixed login bug ⏰ 2 hours ago by Lucas
     abc1234 Added user authentication ⏰ 1 day ago by Lucas  
     xyz9876 Initial project setup ⏰ 2 days ago by Lucas
```

### 3. Navigation

- **↑/↓ arrows**: Navigate between commits
- **Enter**: Select and preview a commit
- **q**: Quit the application

### 4. Preview and restore

When you select a commit, you'll see:

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
# 1. Make a commit
git add .
git commit -m "Working login form"

# 2. Continue coding, make changes...
# 3. Make another commit
git add .
git commit -m "Added validation"

# 4. Something breaks, need to go back
restore

# 5. Navigate to "Working login form", preview changes, restore
# 6. You're back to the working login form state
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

**"No commits found"**
- Check that you're in a Git repository with commit history

**"Not in a Git repository"**  
- Navigate to a folder that contains a `.git` directory
- Initialize Git with `git init` if needed

**Colors not showing**
- Your terminal may not support colors
- Tool will still work, just without color coding

## License

MIT - Feel free to modify and distribute.
