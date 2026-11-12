#!/usr/bin/env bash
# Symlink the repo into $HOME. Safe to re-run; existing files are moved to
# ~/.dotfiles-backup/<timestamp>/ first. `--dry-run` only prints.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OS="$(uname -s)"
BACKUP="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"
DRY_RUN=0
[ "${1:-}" = "--dry-run" ] && DRY_RUN=1

run() { [ "$DRY_RUN" -eq 1 ] || "$@"; }

link() {
  local src="$DOTFILES/$1" dst="$2"

  if [ ! -e "$src" ]; then
    echo "skip  $1 (missing)"
    return
  fi

  # When the repo lives inside the target dir (e.g. repo IS ~/.config),
  # src and dst are the same path — no symlink needed.
  if [ "$src" = "$dst" ]; then
    echo "ok    $dst (in repo)"
    return
  fi

  if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
    echo "ok    $dst"
    return
  fi

  if [ -e "$dst" ] || [ -L "$dst" ]; then
    run mkdir -p "$BACKUP/$(dirname "${dst#"$HOME"/}")"
    run mv "$dst" "$BACKUP/${dst#"$HOME"/}"
    echo "moved $dst -> $BACKUP/${dst#"$HOME"/}"
  fi

  run mkdir -p "$(dirname "$dst")"
  run ln -s "$src" "$dst"
  echo "link  $dst"
}

link nvim "$HOME/.config/nvim"
link tmux/tmux.conf "$HOME/.tmux.conf"
link zsh/zshrc "$HOME/.zshrc"
link bin/todo "$HOME/.local/bin/todo"
link bin/dotsync "$HOME/.local/bin/dotsync"
link bin/devtools "$HOME/.local/bin/devtools"

case "$OS" in
  Darwin) link ghostty/config "$HOME/Library/Application Support/com.mitchellh.ghostty/config" ;;
  Linux)  link ghostty/config "$HOME/.config/ghostty/config" ;;
esac

# Secret-scanning pre-commit hook for this repo.
if [ -d "$DOTFILES/.git" ] && [ "$(git -C "$DOTFILES" config --get core.hooksPath || true)" != ".githooks" ]; then
  run git -C "$DOTFILES" config core.hooksPath .githooks
  echo "hook  pre-commit secret scan enabled"
fi

if [ ! -e "$HOME/.zshrc.local" ]; then
  echo "note  create ~/.zshrc.local for API keys (template: zsh/zshrc.local.example)"
fi

echo
echo "done ($OS)"
[ "$DRY_RUN" -eq 1 ] && echo "(dry run: nothing changed)"
[ -d "$BACKUP" ] && echo "backups in $BACKUP"
exit 0
