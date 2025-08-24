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

print_blank
print_success "Symlinks created successfully!"
