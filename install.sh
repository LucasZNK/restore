#!/bin/bash

# Claude Restore Tool Installer

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'
BOLD='\033[1m'

echo -e "${BOLD}${BLUE}Claude Restore Tool Installer${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"

# Check if restore script exists
if [ ! -f "restore" ]; then
    echo -e "${RED}Error: restore script not found in current directory${NC}"
    exit 1
fi

# Make script executable
chmod +x restore

echo -e "${GREEN}✓${NC} Script made executable"

# Determine installation method
echo -e "\n${BOLD}Choose installation method:${NC}"
echo "1) Install globally with symlink (requires sudo)"
echo "2) Copy to ~/.local/bin (user only)"
echo "3) Custom location"
echo "0) Cancel"

read -p "Choice [0-3]: " choice

case $choice in
    1)
        # Global installation
        echo -e "\n${BLUE}Installing globally...${NC}"
        sudo ln -sf $(pwd)/restore /usr/local/bin/restore
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}✓ Successfully installed to /usr/local/bin/restore${NC}"
            echo -e "${GREEN}✓ You can now use 'restore' command from anywhere${NC}"
        else
            echo -e "${RED}Error: Failed to create symlink${NC}"
            exit 1
        fi
        ;;
    2)
        # User installation
        echo -e "\n${BLUE}Installing to ~/.local/bin...${NC}"
        mkdir -p ~/.local/bin
        cp restore ~/.local/bin/
        chmod +x ~/.local/bin/restore
        
        echo -e "${GREEN}✓ Successfully installed to ~/.local/bin/restore${NC}"
        
        # Check if ~/.local/bin is in PATH
        if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
            echo -e "\n${YELLOW}⚠️  Warning: ~/.local/bin is not in your PATH${NC}"
            echo -e "Add this line to your ~/.bashrc or ~/.zshrc:"
            echo -e "${BLUE}export PATH=\"\$HOME/.local/bin:\$PATH\"${NC}"
            echo -e "Then reload your shell or run: ${BLUE}source ~/.bashrc${NC}"
        else
            echo -e "${GREEN}✓ You can now use 'restore' command from anywhere${NC}"
        fi
        ;;
    3)
        # Custom installation
        read -p "Enter installation path: " custom_path
        
        # Expand tilde if present
        custom_path="${custom_path/#\~/$HOME}"
        
        # Create directory if it doesn't exist
        mkdir -p "$(dirname "$custom_path")"
        
        cp restore "$custom_path"
        chmod +x "$custom_path"
        
        echo -e "${GREEN}✓ Successfully installed to $custom_path${NC}"
        echo -e "${YELLOW}Note: Make sure $custom_path is in your PATH${NC}"
        ;;
    0)
        echo -e "${YELLOW}Installation cancelled${NC}"
        exit 0
        ;;
    *)
        echo -e "${RED}Invalid choice${NC}"
        exit 1
        ;;
esac

echo -e "\n${BOLD}${GREEN}Installation complete!${NC}"
echo -e "\nTo test the installation, run: ${BLUE}restore${NC}"
echo -e "For help, see: ${BLUE}README.md${NC}"