# Restore Tool

Interactive Git save point browser. Navigate and restore commits without using tokens in AI coding assistants.

## Why this exists

When using AI coding tools like Claude Code, simple Git operations consume tokens and cost money. This tool handles Git navigation locally, saving tokens for actual coding tasks.

## What it does

- Lists all commits with `[SAVE #N]` format
- Interactive menu to browse save points
- Shows commit details before restoring
- Handles uncommitted changes safely

## Installation

```bash
# Make executable
chmod +x restore

# Install globally (optional)
sudo ln -sf $(pwd)/restore /usr/local/bin/restore
```

Or run the installer:
```bash
./install.sh
```

## Usage

### Create save points
```bash
git add .
git commit -m "[SAVE #1] Initial setup"
git commit -m "[SAVE #2] Added feature X"
```

### Browse and restore
```bash
restore
```

Use arrow keys to navigate, Enter to select, 'q' to quit.

## Requirements

- Git
- Bash 4.0+
- Color terminal

## License

MIT