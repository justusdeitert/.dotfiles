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

print_header "Setting up eza theme..."
print_blank

mkdir -p "$HOME/.config/eza"

if [ ! -d "$HOME/.config/eza-themes" ]; then
    git clone --depth 1 https://github.com/eza-community/eza-themes.git "$HOME/.config/eza-themes" &>/dev/null
    echo -e "   ${GREEN}✓${NC} ${BOLD}eza-themes${NC} ${GREEN}(cloned)${NC}"
else
    git -C "$HOME/.config/eza-themes" pull --quiet || true
    echo -e "   ${CYAN}●${NC} ${BOLD}eza-themes${NC} ${DIM}(already present, updated)${NC}"
fi

ln -sf "$HOME/.config/eza-themes/themes/one_dark.yml" "$HOME/.config/eza/theme.yml"
echo -e "   ${GREEN}✓${NC} ${BOLD}theme${NC} ${GREEN}(one_dark)${NC}"

print_header "Installing Rust toolchain (rustup)..."
print_blank

if ! command -v rustup &>/dev/null; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain stable --no-modify-path
    # rustup --no-modify-path skips PATH edits; we manage it ourselves via .zshenv
    if [ ! -f "$HOME/.zshenv" ] || ! grep -q '.cargo/env' "$HOME/.zshenv"; then
        echo '. "$HOME/.cargo/env"' >> "$HOME/.zshenv"
    fi
    # shellcheck disable=SC1091
    . "$HOME/.cargo/env"
    echo -e "   ${GREEN}✓${NC} ${BOLD}rustup${NC} ${GREEN}(installed, stable toolchain)${NC}"
else
    rustup self update &>/dev/null || true
    rustup update stable &>/dev/null || true
    echo -e "   ${CYAN}●${NC} ${BOLD}rustup${NC} ${DIM}(already installed, updated)${NC}"
fi

print_blank
print_success "Initial setup complete!"
