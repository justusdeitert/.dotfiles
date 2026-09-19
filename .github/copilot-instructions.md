# Copilot Instructions

These are the global Copilot instructions (this file is symlinked to `~/.github/copilot-instructions.md` and loaded into every workspace). Per-repo `copilot-instructions.md` files override or extend what's here.

## Style

- Do not use em dashes (`—`, `U+2014`). Rephrase instead of substituting with hyphens.
- English in code, comments, commits, issues, and PRs. German only when content is user-facing for German users.

## Git Safety

- Never run `git push` without explicit user confirmation.
- Never use destructive shortcuts (`--no-verify`, `git reset --hard` on shared branches, `git push --force`) without explicit approval.
- Stop and ask for commit message approval before each commit.

## Development Environment

Globally available via Homebrew (installed by the dotfiles repo):

- **Node.js** / **yarn** - JavaScript runtime and package manager
- **Rust** / **cargo** - Rust toolchain (via rustup, installed by `setup.sh`)
- **PHP** / **Composer** - PHP development
- **Python** / **uv** - Python runtime and package manager
- **Git** / **GitHub CLI (`gh`)** - Version control and GitHub operations
- **MariaDB** / **MongoDB** - Databases
- **Docker** - Containerization
- **ImageMagick** / **ffmpeg** - Media processing
- **WP-CLI** - WordPress command-line interface
- **OpenSSL** - SSL/TLS and cryptography operations
- **tree**, **eza** - Directory listings

## Dotfiles Repo

When working inside `~/.dotfiles`, this file also acts as the repo-specific instructions.

### Structure

- `setup.sh` - Initial environment bootstrap (Xcode CLI, oh-my-zsh, Homebrew, rustup, eza theme).
- `homebrew.sh` - Installs CLI tools and casks (Brewfile-style).
- `vscode.sh` - Installs VS Code extensions.
- `symlinks.sh` - Creates symlinks from the repo into `$HOME` (zshrc, gitconfig, VS Code settings, `.github/`, `ai-memories/`).
- `macos.sh` - Applies macOS system preferences.
- `install.sh` - Interactive installer that orchestrates the above.
- `lib/colors.sh` - Shared terminal color helpers.
- `vscode_settings.json` - VS Code user settings.
- `.zshrc`, `.gitconfig` - Shell and git config.
- `.github/` - Global Copilot instructions and prompt rules (symlinked to `~/.github/`).
- `.claude/` - Claude Code settings (symlinked to `~/.claude/settings.json`).
- `ai-memories/` - Shared AI assistant memory (symlinked to Copilot + Claude memory paths).

### Conventions

- Shell scripts: bash, `set -e`, source `lib/colors.sh` for consistent output formatting.
- Use the `print_header`, `print_blank`, `print_success`, `print_info`, `print_warning` helpers instead of bare `echo`.
- New symlinks go in `symlinks.sh` via the `create_symlink` helper.
- New Homebrew packages go in `homebrew.sh`. New VS Code extensions in `vscode.sh`.
- Never hardcode `$HOME` absolute paths; always use `$HOME` or `~`.
- Test changes by running the affected script directly before committing.
