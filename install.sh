#!/bin/bash
#
# Git Security Hooks - Installer
# Sets up global git hooks for secret scanning
#

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}"
echo "╔════════════════════════════════════════════════════╗"
echo "║     Git Security Hooks Installer                   ║"
echo "╚════════════════════════════════════════════════════╝"
echo -e "${NC}"

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOOKS_DIR="$SCRIPT_DIR/hooks"

# Check if gitleaks is installed
echo -e "${YELLOW}Checking dependencies...${NC}"
if command -v gitleaks &> /dev/null; then
    echo -e "${GREEN}✓ gitleaks $(gitleaks version)${NC}"
else
    echo -e "${YELLOW}⚠ gitleaks not found${NC}"
    echo ""

    # Try to install
    if command -v brew &> /dev/null; then
        echo "Installing gitleaks via Homebrew..."
        brew install gitleaks
    else
        echo "Please install gitleaks manually:"
        echo "  macOS:  brew install gitleaks"
        echo "  Linux:  https://github.com/gitleaks/gitleaks#installation"
        echo ""
        read -p "Continue without gitleaks? (y/n) " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            exit 1
        fi
    fi
fi

echo ""
echo -e "${YELLOW}Setting up global git hooks...${NC}"

# Set global hooks path
git config --global core.hooksPath "$HOOKS_DIR"

# Make hooks executable
chmod +x "$HOOKS_DIR"/*

echo -e "${GREEN}✓ Global hooks path set to: $HOOKS_DIR${NC}"
echo ""

echo -e "${GREEN}"
echo "╔════════════════════════════════════════════════════╗"
echo "║     ✅ Installation Complete!                      ║"
echo "╚════════════════════════════════════════════════════╝"
echo -e "${NC}"

echo "All your git commits will now be scanned for secrets."
echo ""
echo "To uninstall:"
echo "  git config --global --unset core.hooksPath"
echo ""
