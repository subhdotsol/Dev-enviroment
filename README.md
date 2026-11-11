# dotfiles

My terminal setup for **macOS**, **Arch** and **Debian/Ubuntu**: Neovim, tmux, Ghostty, zsh.
One config for every machine; the few real OS differences live in `zsh/darwin.zsh` and `zsh/linux.zsh`.

## New machine

```sh
git clone https://github.com/subhdotsol/Dev-enviroment.git ~/Dev/dotfiles
cd ~/Dev/dotfiles && ./bootstrap.sh
```

`bootstrap.sh` installs the packages (Homebrew / pacman / apt, plus upstream builds where apt is too old),
oh-my-zsh and its plugins, tpm, links every config into `$HOME`, then installs the tmux and nvim plugins.
It is idempotent, and `./bootstrap.sh --dry-run` prints what it would do.

Then put API keys in `~/.zshrc.local` (see `zsh/zshrc.local.example`) and run `chsh -s "$(command -v zsh)"`
if zsh is not your login shell.

Only want the links? `./install.sh` (also has `--dry-run`). Existing files are moved to
`~/.dotfiles-backup/<timestamp>/` first.

## Layout

```
nvim/        Neovim (lazy.nvim, versions pinned in lazy-lock.json)
tmux/        tmux.conf, linked to ~/.tmux.conf
ghostty/     terminal config
zsh/         zshrc (shared), darwin.zsh, linux.zsh, zshrc.local.example
bin/         todo, dotsync (linked into ~/.local/bin)
bootstrap.sh packages + plugins + install.sh
install.sh   symlinks the repo into $HOME
Brewfile     macOS packages
CHEATSHEET.md  every Neovim binding
```

The configs are symlinked, so the repo is live: edit a file and it is already applied.

## Secrets

Nothing secret belongs in this repo. Keys and one-machine paths go in `~/.zshrc.local`, which `zshrc`
sources last and git ignores. A pre-commit hook (enabled by `install.sh`) and CI both scan for secrets.

## todo

```
todo add <task>     todo list        todo all       todo done <n>
todo remove <n>     todo clear       todo stats     todo display
```

Tasks live in `~/.todos.txt`. Numbers count pending tasks only, so `todo list` and `todo done 2` always agree.

## dotsync

```
dotsync status          link health and uncommitted changes
dotsync push [message]  secret scan, commit, push
dotsync pull            fast-forward pull, then re-link
dotsync scan            secret scan on its own
```

## CI

`.github/workflows/check.yml` runs on every push, pull request and weekly:
shellcheck, a zsh syntax check, gitleaks, and a full `bootstrap.sh` on Debian, Arch and macOS followed by
checks that a second run changes nothing, links are healthy, `todo` works, zsh starts clean, tmux loads
with the right prefix, and nvim starts without errors.
