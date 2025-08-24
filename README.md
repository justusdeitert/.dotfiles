# 🛠 Dotfiles

[![macOS](https://img.shields.io/badge/macOS-000000?style=flat&logo=apple&logoColor=white)](https://www.apple.com/macos)
[![Shell](https://img.shields.io/badge/Shell-Bash%2FZsh-4EAA25?style=flat&logo=gnu-bash&logoColor=white)](https://www.zsh.org)
[![Homebrew](https://img.shields.io/badge/Homebrew-FBB040?style=flat&logo=homebrew&logoColor=black)](https://brew.sh)
[![VS Code](https://img.shields.io/badge/VS%20Code-007ACC?style=flat&logo=visual-studio-code&logoColor=white)](https://code.visualstudio.com)
[![License](https://img.shields.io/badge/License-MIT-blue?style=flat)](#license)

My macOS dev environment setup.

## Quick Start

```bash
git clone https://github.com/justusdeitert/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

## Usage

**Interactive mode** — prompts for each step:
```bash
./install.sh
```

**Run all** — no prompts:
```bash
./install.sh --all
```

**Run individual scripts:**
```bash
./setup.sh      # Xcode CLI, Oh My Zsh, Homebrew
./homebrew.sh   # Packages & apps
./symlinks.sh   # Create symlinks
./vscode.sh     # VS Code extensions
```

## Files

| File | Description |
|------|-------------|
| `install.sh` | Main installer (interactive or `--all`) |
| `setup.sh` | Xcode CLI, Oh My Zsh, Homebrew |
| `homebrew.sh` | Homebrew formulae & cask apps |
| `symlinks.sh` | Symlinks for dotfiles |
| `vscode.sh` | VS Code extensions |
| `vscode_settings.json` | VS Code config |
| `lib/colors.sh` | Shared color utilities |

## License

MIT
