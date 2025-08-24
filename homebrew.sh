#!/bin/bash

set -e

DOTFILES_DIR="$HOME/.dotfiles"

# Load colors
source "$DOTFILES_DIR/lib/colors.sh"

print_header "Updating Homebrew..."
print_blank

brew update
brew doctor || true

brews=(
    php
    httpd
    composer
    deployer
    openssl
    mariadb
    node
    wp-cli
    yarn
    tree
    git
    gh
    mas
    imagemagick
    zsh-syntax-highlighting
    zsh-autosuggestions
)

print_header "Installing formulae..."
print_blank

# Get list of already installed formulae
installed_brews=$(brew list --formula 2>/dev/null)

total=${#brews[@]}
current=0
installed=0
skipped=0
failed=0

for formula in "${brews[@]}"; do
    ((current++))
    
    if echo "$installed_brews" | grep -q "^${formula}$"; then
        echo -e "   ${CYAN}●${NC} ${DIM}[$current/$total]${NC} ${BOLD}$formula${NC} ${DIM}(already installed)${NC}"
        ((skipped++))
    elif brew install "$formula" &>/dev/null; then
        echo -e "   ${GREEN}✓${NC} ${DIM}[$current/$total]${NC} ${BOLD}$formula${NC} ${GREEN}(installed)${NC}"
        ((installed++))
    else
        echo -e "   ${RED}✗${NC} ${DIM}[$current/$total]${NC} ${BOLD}$formula${NC} ${RED}(failed)${NC}"
        ((failed++))
    fi
done

print_blank

if [ $failed -eq 0 ]; then
    print_success "$skipped already installed, $installed newly installed"
else
    print_warning "$skipped already installed, $installed newly installed, $failed failed"
fi

apps=(
    google-chrome
    firefox
    microsoft-edge
    tableplus
    docker
    appcleaner
    caffeine
    vlc
    the-unarchiver
    iterm2
    figma
    whatsapp
    messenger
    signal
    postman
    transmit
    visual-studio-code
    moom
    fork
    slack
    spotify
    rekordbox
    transmission
    battery
    # zoom
    # poedit
    # skype
    # microsoft-teams
    # github
    # dropbox
    # little-snitch
    # onedrive
)

print_header "Installing cask apps..."
print_blank

# Get list of already installed casks
installed_casks=$(brew list --cask 2>/dev/null)

total=${#apps[@]}
current=0
installed=0
skipped=0
failed=0

for app in "${apps[@]}"; do
    ((current++))
    
    if echo "$installed_casks" | grep -q "^${app}$"; then
        echo -e "   ${CYAN}●${NC} ${DIM}[$current/$total]${NC} ${BOLD}$app${NC} ${DIM}(already installed)${NC}"
        ((skipped++))
    elif brew install --cask "$app" &>/dev/null; then
        echo -e "   ${GREEN}✓${NC} ${DIM}[$current/$total]${NC} ${BOLD}$app${NC} ${GREEN}(installed)${NC}"
        ((installed++))
    else
        echo -e "   ${RED}✗${NC} ${DIM}[$current/$total]${NC} ${BOLD}$app${NC} ${RED}(failed)${NC}"
        ((failed++))
    fi
done

print_blank

if [ $failed -eq 0 ]; then
    print_success "$skipped already installed, $installed newly installed"
else
    print_warning "$skipped already installed, $installed newly installed, $failed failed"
fi

print_blank
print_success "Homebrew installations complete!"