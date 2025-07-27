#!/bin/bash

set -e

echo "🛠️ Installing Xcode Command Line Tools..."
if ! xcode-select -p &>/dev/null; then
    xcode-select --install
    echo "⏳ Please complete the Xcode CLI installation, then re-run this script."
    exit 0
else
    echo "✅ Xcode CLI already installed"
fi

echo "🐚 Installing oh-my-zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "✅ oh-my-zsh already installed"
fi

echo "🍺 Installing Homebrew..."
if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == "arm64" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo "✅ Homebrew already installed"
fi

echo ""
echo "🎉 Initial setup complete!"
echo "Next steps:"
echo "  1. Run ./brews.sh to install packages"
echo "  2. Run ./vscode_extensions.sh to install VS Code extensions"
