#!/bin/bash

set -e

DOTFILES_DIR="$HOME/.dotfiles"

# Load colors
source "$DOTFILES_DIR/lib/colors.sh"

# Check if VS Code is installed
if ! command -v code &>/dev/null; then
    print_error "VS Code CLI not found. Please install VS Code and ensure 'code' is in your PATH."
    print_info "You can install it from: https://code.visualstudio.com/"
    print_info "Then run 'Shell Command: Install code command in PATH' from the command palette."
    exit 1
fi

print_header "Installing VS Code extensions..."

vscodeextensions=(
    # Editor essentials
    editorconfig.editorconfig
    esbenp.prettier-vscode
    dbaeumer.vscode-eslint
    rvest.vs-code-prettier-eslint
    foxundermoon.shell-format
    stylelint.vscode-stylelint
    
    # Themes & icons
    pkief.material-icon-theme
    ericgomez.phpstorm-theme
    github.github-vscode-theme
    
    # Git
    mhutchie.git-graph
    arturock.gitstash
    waderyan.gitblame
    gruntfuggly.todo-tree
    
    # PHP
    devsense.phptools-vscode
    devsense.intelli-php-vscode
    devsense.composer-php-vscode
    devsense.profiler-php-vscode
    
    # JavaScript & Frontend
    bradlc.vscode-tailwindcss
    vue.volar
    sissel.shopify-liquid
    digitalbrainstem.javascript-ejs-support
    
    # GraphQL
    graphql.vscode-graphql
    graphql.vscode-graphql-syntax
    
    # Docker
    ms-azuretools.vscode-docker
    docker.docker
    
    # Python
    ms-python.python
    ms-python.vscode-pylance
    ms-python.debugpy
    ms-python.vscode-python-envs
    
    # Other
    prisma.prisma
    yzhang.markdown-all-in-one
    ms-vscode.makefile-tools
    ms-vscode.vscode-speech
    
    # AI
    github.copilot
    github.copilot-chat
)

print_blank

# Get list of already installed extensions
installed_extensions=$(code --list-extensions 2>/dev/null | tr '[:upper:]' '[:lower:]')

total=${#vscodeextensions[@]}
current=0
installed=0
skipped=0
failed=0

for extension in "${vscodeextensions[@]}"; do
    ((current++))
    extension_lower=$(echo "$extension" | tr '[:upper:]' '[:lower:]')
    
    # Check if already installed
    if echo "$installed_extensions" | grep -q "^${extension_lower}$"; then
        echo -e "   ${CYAN}●${NC} ${DIM}[$current/$total]${NC} ${BOLD}$extension${NC} ${DIM}(already installed)${NC}"
        ((skipped++))
    elif code --install-extension "$extension" --force &>/dev/null; then
        echo -e "   ${GREEN}✓${NC} ${DIM}[$current/$total]${NC} ${BOLD}$extension${NC} ${GREEN}(installed)${NC}"
        ((installed++))
    else
        echo -e "   ${RED}✗${NC} ${DIM}[$current/$total]${NC} ${BOLD}$extension${NC} ${RED}(failed)${NC}"
        ((failed++))
    fi
done

print_blank

if [ $failed -eq 0 ]; then
    print_success "$skipped already installed, $installed newly installed"
else
    print_warning "$skipped already installed, $installed newly installed, $failed failed"
fi
