# AI memories

Shared markdown notes used as long-term memory by AI coding assistants (Copilot Chat, Claude Code).

## Layout

- `preferences.md`, `pitfalls.md`, `github-achievements.md` — actual notes. Plain markdown, keep short.
- `CLAUDE.md` — entry point for Claude Code. Imports the other notes via `@file.md` syntax.
- `session/` — Copilot per-conversation scratch space. Ignored.

## Symlinks (created by `symlinks.sh`)

| Source in dotfiles | Linked to |
| --- | --- |
| `ai-memories/` | `~/Library/Application Support/Code/User/globalStorage/github.copilot-chat/memory-tool/memories` |
| `ai-memories/CLAUDE.md` | `~/.claude/CLAUDE.md` |
| `.claude/settings.json` | `~/.claude/settings.json` |

## Guidelines

- One topic per file. Bullet points beat prose; user memory loads into every context.
- Never commit secrets, tokens, client names, or anything private.
- When adding a new note, also add an `@file.md` line to `CLAUDE.md` so Claude picks it up.
