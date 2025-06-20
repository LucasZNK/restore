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

The tool uses a safe approach with temporary branches:

1. **Browse commits**: Navigate through your Git history with arrow keys
2. **Preview safely**: When you select a commit, see all details before confirming
3. **Temporary restore**: Creates a temporary branch to explore the selected commit
4. **Your work is safe**: Original branch remains untouched until you explicitly apply changes
5. **Clear choices**: After restoring, choose to apply changes permanently or undo

This approach ensures you never accidentally lose work or modify your branch without explicit confirmation.

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

**Browse Mode:**
- **↑/↓ arrows**: Navigate between commits
- **Enter**: Select and preview a commit
- **q**: Quit the application

**Temporary Restore Mode:**
- **a**: Apply - Make changes permanent to your original branch
- **u**: Undo - Return to original branch without changes
- **q**: Quit - Exit tool (keeps temporary branch)

### 4. Preview and restore

When you select a commit, you'll see:

- **Commit details**: Hash, message, date, author
- **Changed files**: List of modified files with stats
- **Restore confirmation**: Option to restore or cancel

### 5. Understanding temporary branches

When you restore a commit:
1. **Temporary branch created**: `restore-temp-[timestamp]`
2. **Safe exploration**: You can test the code at that point in time
3. **Original branch unchanged**: Your main/master branch stays exactly where it was
4. **Clear visual indicators**: UI shows you're in a temporary state
5. **Simple choices**: Apply (a) to keep changes, or Undo (u) to go back

This prevents accidental commits and gives you full control over your Git history.

### 6. Handling uncommitted changes

If you have uncommitted changes when trying to restore, the tool will ask:

1. **Stash changes** (recommended) - Saves your work for later
2. **Discard changes** - Permanently removes uncommitted work  
3. **Cancel** - Abort the restore operation

## Example Workflow

```bash
# 1. You're on 'main' branch with some commits
git log --oneline
# def4567 Added validation
# abc1234 Working login form
# xyz9876 Initial setup

# 2. Something breaks, need to check older code
restore

# 3. Navigate to "Working login form", press Enter
# See commit details, confirm with 'y'

# 4. Now you're in temporary state:
# - Branch: restore-temp-1234567890
# - You can test if the old code works
# - Your 'main' branch is still at "Added validation"

# 5. Two options:
# Press 'a' - Move 'main' to this commit (lose "Added validation")
# Press 'u' - Return to 'main' with "Added validation" intact

# 6. The tool clearly shows your status throughout
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
