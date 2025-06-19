# Claude Restore Tool

An interactive Git save point manager that makes it easy to create, view, and restore project snapshots.

## Features

- 🔍 **Interactive Menu**: Browse all save points with detailed information
- 📄 **Preview Changes**: See what files changed before restoring
- 🛡️ **Safe Operations**: Handles uncommitted changes gracefully
- 🎨 **Color-Coded Output**: Clear visual feedback
- 📊 **Detailed Views**: Shows file changes, diffs, and statistics

## Installation

### Option 1: Direct Installation (Recommended)

```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/restore-tool.git
cd restore-tool

# Make the script executable
chmod +x restore

# Create a symbolic link to use globally
sudo ln -s $(pwd)/restore /usr/local/bin/restore
```

### Option 2: Copy to PATH

```bash
# Clone and copy to your local bin
git clone https://github.com/YOUR_USERNAME/restore-tool.git
cp restore-tool/restore ~/.local/bin/restore
chmod +x ~/.local/bin/restore
```

Make sure `~/.local/bin` is in your PATH. Add this to your `~/.bashrc` or `~/.zshrc`:
```bash
export PATH="$HOME/.local/bin:$PATH"
```

## Usage

### Creating Save Points

Save points are regular git commits with a special format:

```bash
# Create a save point
git add .
git commit -m "[SAVE #1] Initial project setup"

# Create another save point
git commit -m "[SAVE #2] Add user authentication"
```

### Restoring Save Points

Simply run `restore` in any git repository:

```bash
restore
```

This will show an interactive menu:

```
🔄 Claude Restore Tool
Interactive Git Save Point Manager

Current branch: main
Current commit: a1b2c3d

Available Save Points:

1) SAVE #3 - Fix login bug
   2024-01-20 15:30 | def4567

2) SAVE #2 - Add user authentication
   2024-01-20 14:00 | abc1234

3) SAVE #1 - Initial project setup ← CURRENT
   2024-01-20 12:00 | a1b2c3d

0) Exit

Select save point to view [0-3]:
```

### Features in Detail

#### Preview Before Restore
When you select a save point, you'll see:
- Commit details and message
- List of changed files
- Statistics (insertions/deletions)
- Preview of actual changes (first 20 lines)

#### Safe Handling of Uncommitted Changes
If you have uncommitted changes, the tool offers options to:
1. Stash changes (recommended)
2. Discard changes
3. Cancel the operation
4. View uncommitted changes

## Save Point Convention

The tool looks for commits with the pattern `[SAVE #N]` where N is a number:

```bash
git commit -m "[SAVE #1] Description here"
git commit -m "[SAVE #42] Fixed critical bug"
```

## Requirements

- Git
- Bash 4.0 or higher
- A terminal with color support (most modern terminals)

## Tips

1. **Regular Saves**: Create save points at meaningful milestones
2. **Descriptive Names**: Use clear, concise descriptions
3. **Number Sequentially**: While not required, sequential numbering helps track progress

## Uninstallation

To remove the tool:

```bash
# If installed with symlink
sudo rm /usr/local/bin/restore

# If copied to local bin
rm ~/.local/bin/restore
```

## License

MIT License - Feel free to modify and distribute as needed.

## Contributing

Contributions are welcome! Feel free to submit issues or pull requests.

---

Created with ❤️ by Claude Assistant