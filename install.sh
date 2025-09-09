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
    do_setup=1
    do_brew=1
    do_symlinks=1
    do_vscode=1
    do_macos=1
else
    # Phase 1: gather answers
    ask "Run initial setup (Xcode CLI, oh-my-zsh, Homebrew)?" "y" && do_setup=1
    ask "Install Homebrew packages and apps?"                  "y" && do_brew=1
    ask "Create symlinks?"                                     "y" && do_symlinks=1
    ask "Install VS Code extensions?"                          "y" && do_vscode=1
    ask "Apply macOS system preferences?"                      "n" && do_macos=1

    # Phase 2: show plan and confirm
    print_blank
    print_header "Plan"
    print_blank
    [[ "$do_setup"    ]] && echo -e "   ${GREEN}✓${NC} Initial setup (Xcode CLI, oh-my-zsh, Homebrew)" || echo -e "   ${DIM}✗ Initial setup${NC}"
    [[ "$do_brew"     ]] && echo -e "   ${GREEN}✓${NC} Homebrew packages and apps"                     || echo -e "   ${DIM}✗ Homebrew packages and apps${NC}"
    [[ "$do_symlinks" ]] && echo -e "   ${GREEN}✓${NC} Symlinks"                                       || echo -e "   ${DIM}✗ Symlinks${NC}"
    [[ "$do_vscode"   ]] && echo -e "   ${GREEN}✓${NC} VS Code extensions"                             || echo -e "   ${DIM}✗ VS Code extensions${NC}"
    [[ "$do_macos"    ]] && echo -e "   ${GREEN}✓${NC} macOS system preferences"                       || echo -e "   ${DIM}✗ macOS system preferences${NC}"
    print_blank

    if ! [[ "$do_setup" || "$do_brew" || "$do_symlinks" || "$do_vscode" || "$do_macos" ]]; then
        print_warning "Nothing selected, exiting."
        exit 0
    fi

    if ! ask "Proceed?" "y"; then
        print_info "Aborted."
        exit 0
    fi
fi

# Phase 3: execute
print_blank
[[ "$do_setup"    ]] && "$DOTFILES_DIR/setup.sh"    && print_blank
[[ "$do_brew"     ]] && "$DOTFILES_DIR/homebrew.sh" && print_blank
[[ "$do_symlinks" ]] && "$DOTFILES_DIR/symlinks.sh" && print_blank
[[ "$do_vscode"   ]] && "$DOTFILES_DIR/vscode.sh"   && print_blank
[[ "$do_macos"    ]] && "$DOTFILES_DIR/macos.sh"    && print_blank

echo ""
echo -e "${BOLD_GREEN}✓ All done!${NC}"
echo ""
