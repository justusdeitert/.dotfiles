#!/bin/bash

set -e

DOTFILES_DIR="$HOME/.dotfiles"

# Load colors
source "$DOTFILES_DIR/lib/colors.sh"

echo ""
echo -e "${BOLD_BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BOLD_BLUE}║         ${BOLD_WHITE}Dotfiles Installer${BOLD_BLUE}             ║${NC}"
echo -e "${BOLD_BLUE}╚════════════════════════════════════════╝${NC}"
echo ""

# Function to ask user
ask() {
    local prompt="$1"
    local default="$2"
    
    if [[ "$default" == "y" ]]; then
        prompt="$prompt [Y/n]"
    else
        prompt="$prompt [y/N]"
    fi
    
    echo -ne "${BOLD}$prompt${NC} "
    read -r response
    
    if [[ -z "$response" ]]; then
        response="$default"
    fi
    
    [[ "$response" =~ ^[Yy]$ ]]
}

# Run all without asking
if [[ "$1" == "--all" ]]; then
    print_info "Running all scripts..."
    print_blank
    
    "$DOTFILES_DIR/setup.sh"
    "$DOTFILES_DIR/homebrew.sh"
    "$DOTFILES_DIR/symlinks.sh"
    "$DOTFILES_DIR/vscode.sh"
    
    print_blank
    print_success "All done!"
    exit 0
fi

# Interactive mode
if ask "Run initial setup (Xcode CLI, oh-my-zsh, Homebrew)?" "y"; then
    print_blank
    "$DOTFILES_DIR/setup.sh"
    print_blank
fi

if ask "Install Homebrew packages and apps?" "y"; then
    print_blank
    "$DOTFILES_DIR/homebrew.sh"
    print_blank
fi

if ask "Create symlinks?" "y"; then
    print_blank
    "$DOTFILES_DIR/symlinks.sh"
    print_blank
fi

if ask "Install VS Code extensions?" "y"; then
    print_blank
    "$DOTFILES_DIR/vscode.sh"
    print_blank
fi

echo ""
echo -e "${BOLD_GREEN}✓ All done!${NC}"
echo ""
