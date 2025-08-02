#!/bin/bash

set -e

DOTFILES_DIR="$HOME/.dotfiles"

# Load colors
source "$DOTFILES_DIR/lib/colors.sh"

print_header "Installing Xcode Command Line Tools..."
print_blank

if ! xcode-select -p &>/dev/null; then
    xcode-select --install
    echo -e "   ${YELLOW}!${NC} Please complete the Xcode CLI installation, then re-run this script."
    exit 0
else
    echo -e "   ${CYAN}●${NC} ${BOLD}Xcode CLI${NC} ${DIM}(already installed)${NC}"
fi

print_header "Installing oh-my-zsh..."
print_blank

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    echo -e "   ${GREEN}✓${NC} ${BOLD}oh-my-zsh${NC} ${GREEN}(installed)${NC}"
else
    echo -e "   ${CYAN}●${NC} ${BOLD}oh-my-zsh${NC} ${DIM}(already installed)${NC}"
fi

print_header "Installing Homebrew..."
print_blank

if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == "arm64" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
    echo -e "   ${GREEN}✓${NC} ${BOLD}Homebrew${NC} ${GREEN}(installed)${NC}"
else
    echo -e "   ${CYAN}●${NC} ${BOLD}Homebrew${NC} ${DIM}(already installed)${NC}"
fi

print_blank
print_success "Initial setup complete!"
