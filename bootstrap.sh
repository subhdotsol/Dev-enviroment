#!/usr/bin/env bash
# New machine in one command: installs packages, oh-my-zsh + plugins, tpm,
# links the configs (install.sh) and installs the nvim plugins.
# Supports macOS (Homebrew), Arch (pacman) and Debian/Ubuntu (apt).
# Idempotent. `--dry-run` prints every command without running it.
# `--core` stops after the essentials; by default `devtools install` then
# restores everything recorded in packages/ (apps, fonts, language tools).
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DRY_RUN=0
CORE=0
for arg in "$@"; do
  case "$arg" in
    --dry-run) DRY_RUN=1 ;;
    --core)    CORE=1 ;;
    *) echo "usage: $0 [--dry-run] [--core]" >&2; exit 1 ;;
  esac
done

SUDO=""
[ "$(id -u)" -ne 0 ] && SUDO="sudo"

say()  { printf '\n==> %s\n' "$*"; }
warn() { printf 'warn: %s\n' "$*" >&2; }
run()  { echo "+ $*"; [ "$DRY_RUN" -eq 1 ] || "$@"; }
have() { command -v "$1" >/dev/null 2>&1; }

# version_ge A B: true when dotted version A >= B
version_ge() { [ "$(printf '%s\n%s\n' "$2" "$1" | sort -V | head -n1)" = "$2" ]; }

arch_name() {  # prints the token each upstream uses for this CPU
  case "$(uname -m)" in
    x86_64|amd64)  echo "$1" ;;
    aarch64|arm64) echo "$2" ;;
    *) echo "unsupported CPU: $(uname -m)" >&2; return 1 ;;
  esac
}

latest_tag() {  # latest_tag owner/repo -> v1.2.3 (no API rate limit)
  curl -fsSLI -o /dev/null -w '%{url_effective}' "https://github.com/$1/releases/latest" | sed 's|.*/tag/||'
}

# ---- OS detection -----------------------------------------------------------
OS="$(uname -s)"
DISTRO=""
if [ "$OS" = "Linux" ]; then
  # shellcheck disable=SC1091
  . /etc/os-release
  case "${ID:-} ${ID_LIKE:-}" in
    *arch*)            DISTRO=arch ;;
    *debian*|*ubuntu*) DISTRO=debian ;;
    *) echo "unsupported Linux distro: ${ID:-unknown}" >&2; exit 1 ;;
  esac
elif [ "$OS" != "Darwin" ]; then
  echo "unsupported OS: $OS" >&2; exit 1
fi

# ---- packages ---------------------------------------------------------------
install_macos() {
  if ! have brew; then
    say "Installing Homebrew"
    run /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    [ -x /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
  say "brew bundle"
  run brew bundle --file="$DOTFILES/Brewfile"
}

install_arch() {
  say "pacman"
  run $SUDO pacman -Syu --needed --noconfirm \
    git github-cli base-devel curl unzip neovim tmux zsh starship zoxide fzf bat \
    ripgrep fd lazygit tree-sitter-cli gitleaks shellcheck
}

install_debian() {
  say "apt"
  export DEBIAN_FRONTEND=noninteractive
  run $SUDO apt-get update
  run $SUDO apt-get install -y git curl ca-certificates build-essential unzip zsh \
    tmux fzf bat ripgrep fd-find
  # Optional: not packaged on every release, upstream installers fill the gaps.
  local p
  for p in zoxide gh shellcheck; do
    run $SUDO apt-get install -y "$p" || warn "apt has no $p, skipping"
  done

  run mkdir -p "$HOME/.local/bin"
  # fd/bat get Debian-specific names
  have fd  || { have fdfind  && run ln -sf "$(command -v fdfind)"  "$HOME/.local/bin/fd"; }
  have bat || { have batcat  && run ln -sf "$(command -v batcat)"  "$HOME/.local/bin/bat"; }

  install_nvim_upstream
  install_tree_sitter_upstream
  install_lazygit_upstream
  have starship || run sh -c 'curl -fsSL https://starship.rs/install.sh | sh -s -- -y -b "$HOME/.local/bin"'
  have zoxide   || run sh -c 'curl -fsSL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh'
}

install_nvim_upstream() {  # Debian's neovim is older than the 0.12 these configs need
  if have nvim && version_ge "$(nvim --version | sed -n '1s/[^0-9]*//p')" 0.12; then return; fi
  say "neovim (upstream tarball)"
  local a; a="$(arch_name x86_64 arm64)"
  run mkdir -p "$HOME/.local/opt" "$HOME/.local/bin"
  run sh -c "curl -fsSL https://github.com/neovim/neovim/releases/latest/download/nvim-linux-$a.tar.gz | tar -xz -C '$HOME/.local/opt'"
  run ln -sf "$HOME/.local/opt/nvim-linux-$a/bin/nvim" "$HOME/.local/bin/nvim"
}

install_tree_sitter_upstream() {  # nvim-treesitter (main branch) shells out to this
  have tree-sitter && return
  say "tree-sitter-cli (upstream)"
  local a; a="$(arch_name x64 arm64)"
  run mkdir -p "$HOME/.local/bin"
  run sh -c "curl -fsSL https://github.com/tree-sitter/tree-sitter/releases/latest/download/tree-sitter-linux-$a.gz | gunzip > '$HOME/.local/bin/tree-sitter' && chmod +x '$HOME/.local/bin/tree-sitter'"
}

install_lazygit_upstream() {
  have lazygit && return
  say "lazygit (upstream)"
  local a tag; a="$(arch_name x86_64 arm64)"
  tag="$(latest_tag jesseduffield/lazygit)"
  run mkdir -p "$HOME/.local/bin"
  run sh -c "curl -fsSL https://github.com/jesseduffield/lazygit/releases/download/$tag/lazygit_${tag#v}_Linux_$a.tar.gz | tar -xz -C '$HOME/.local/bin' lazygit"
}

case "$OS-$DISTRO" in
  Darwin-)      install_macos ;;
  Linux-arch)   install_arch ;;
  Linux-debian) install_debian ;;
esac
export PATH="$HOME/.local/bin:$PATH"

# ---- shell + tmux plugins ---------------------------------------------------
clone() {  # clone <url> <dest>: skip when already there
  [ -d "$2/.git" ] && { echo "ok    $2"; return; }
  run git clone --depth 1 "$1" "$2"
}

say "oh-my-zsh, zsh plugins, tpm"
clone https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh"
clone https://github.com/zsh-users/zsh-autosuggestions.git "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
clone https://github.com/tmux-plugins/tpm.git "$HOME/.tmux/plugins/tpm"

# ---- link the configs -------------------------------------------------------
say "install.sh"
if [ "$DRY_RUN" -eq 1 ]; then
  "$DOTFILES/install.sh" --dry-run
else
  "$DOTFILES/install.sh"
fi

# ---- everything else recorded in packages/ ----------------------------------
if [ "$CORE" -eq 0 ]; then
  say "devtools install (packages/)"
  if [ "$DRY_RUN" -eq 1 ]; then
    "$DOTFILES/bin/devtools" install --dry-run
  else
    "$DOTFILES/bin/devtools" install
  fi
fi

# ---- plugins ----------------------------------------------------------------
if [ "$DRY_RUN" -eq 0 ]; then
  say "tmux plugins (tpm)"
  "$HOME/.tmux/plugins/tpm/bin/install_plugins" || warn "tpm failed; press prefix + I inside tmux"

  say "nvim plugins (pinned by lazy-lock.json)"
  nvim --headless "+Lazy! restore" +qa || warn "lazy restore failed; open nvim and run :Lazy restore"
else
  echo "+ tpm install_plugins"
  echo '+ nvim --headless "+Lazy! restore" +qa'
fi

say "done"
if [ "${SHELL##*/}" != "zsh" ]; then
  echo "Your login shell is not zsh. Run: chsh -s \"\$(command -v zsh)\""
fi
echo "Next: cp zsh/zshrc.local.example ~/.zshrc.local and add your API keys."
