#!/bin/bash

set -e

DOTFILES_DIR="$HOME/.dotfiles"

# Load colors
source "$DOTFILES_DIR/lib/colors.sh"

print_header "Creating symlinks..."

# Function to create a symlink
create_symlink() {
    local source="$1"
    local target="$2"
    local source_path="$DOTFILES_DIR/$source"

    print_blank

    if [ -e "$source_path" ]; then
        # Create parent directory if it doesn't exist
        mkdir -p "$(dirname "$target")"

        # Remove existing file/symlink/directory
        if [ -L "$target" ]; then
            echo -e "   ${YELLOW}~ Removing existing symlink:${NC} $target"
            rm "$target"
        elif [ -e "$target" ]; then
            echo -e "   ${CYAN}● Backing up:${NC} $target ${MAGENTA}→${NC} ${target}.backup"
            mv "$target" "${target}.backup"
        fi

        # Create symlink
        ln -s "$source_path" "$target"
        echo -e "   ${GREEN}✓ Linked:${NC} ${BOLD}$source${NC} ${MAGENTA}→${NC} $target"
    else
        echo -e "   ${RED}✗ Source not found:${NC} $source_path"
    fi
}

# Define symlinks: source (in dotfiles) -> target (in home)
create_symlink ".zshrc" "$HOME/.zshrc"
create_symlink ".github" "$HOME/.github"
create_symlink "vscode_settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
create_symlink ".gitconfig" "$HOME/.gitconfig"
create_symlink "ai-memories" "$HOME/Library/Application Support/Code/User/globalStorage/github.copilot-chat/memory-tool/memories"

if command -v claude &>/dev/null || code --list-extensions 2>/dev/null | grep -qi "anthropic.claude-code"; then
    create_symlink "ai-memories/CLAUDE.md" "$HOME/.claude/CLAUDE.md"
    create_symlink ".claude/settings.json" "$HOME/.claude/settings.json"
else
    print_blank
    echo -e "   ${DIM}○ Skipping Claude Code symlinks (not installed)${NC}"
fi

print_blank
print_success "Symlinks created successfully!"
