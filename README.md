# 🛠 Dotfiles

My macOS dev environment setup.

## Setup

```bash
chmod +x *.sh
./setup.sh                # Xcode CLI, Oh My Zsh, Homebrew
./brews.sh                # Packages & apps
./vscode_extensions.sh    # VS Code extensions
```

## Files

| File | Description |
|------|-------------|
| `setup.sh` | Xcode CLI, Oh My Zsh, Homebrew |
| `brews.sh` | Homebrew formulae & cask apps |
| `vscode_extensions.sh` | VS Code extensions |
| `vscode_settings.json` | VS Code config |

## After Setup

```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

Copy VS Code settings:
```bash
cp vscode_settings.json ~/Library/Application\ Support/Code/User/settings.json
```

MIT
