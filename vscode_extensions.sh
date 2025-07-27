#!/bin/bash

set -e

echo "🔌 Installing VS Code extensions..."

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
    
    # GraphQL
    graphql.vscode-graphql
    graphql.vscode-graphql-syntax
    
    # Docker
    ms-azuretools.vscode-docker
    ms-azuretools.vscode-containers
    
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
    
    # AI (optional - comment out if not needed)
    # github.copilot
    # github.copilot-chat
)

for extension in "${vscodeextensions[@]}"; do
    echo "Installing $extension..."
    code --install-extension "$extension" --force || echo "⚠️ Failed to install $extension"
done

echo "✅ VS Code extensions installation complete!"
















































