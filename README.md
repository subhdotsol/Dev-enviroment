# dotfiles

My terminal setup for **macOS**, **Arch** and **Debian/Ubuntu**: Neovim, tmux, Ghostty, zsh.
One config for every machine; the few real OS differences live in `zsh/darwin.zsh` and `zsh/linux.zsh`.

## New machine

```sh
git clone https://github.com/subhdotsol/dotfiles.git ~/Dev/dotfiles
cd ~/Dev/dotfiles && ./bootstrap.sh
```

`bootstrap.sh` installs the packages (Homebrew / pacman / apt, plus upstream builds where apt is too old),
oh-my-zsh and its plugins, tpm, links every config into `$HOME`, then installs the tmux and nvim plugins.
It then runs `devtools install`, which restores everything recorded in `packages/` (apps, fonts, bun/npm/go/cargo tools,
rust toolchains, node versions). It is idempotent. `--dry-run` prints what it would do; `--core` skips the `packages/` step.

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
bin/         todo, dotsync, devtools (linked into ~/.local/bin)
packages/    what is installed on my Mac (Brewfile, bun/npm/go/cargo lists, installers.tsv, apps, fonts)
assets/      fonts that have no download source
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

## devtools

Knows every tool on the machine, can reinstall it, and updates it.

```
devtools inventory        scan this Mac and rewrite packages/ (and assets/fonts)
devtools install          install everything recorded
devtools upgrade          update every installed tool
devtools list             what is recorded
--dry-run                 print only          --only <manager>   brew fonts installers node rustup bun npm go cargo
```

| File in `packages/` | Source |
|---|---|
| `Brewfile` | generated: taps, top-level formulae, casks, VS Code extensions |
| `bun.txt` `npm.txt` `go.txt` `rustup.txt` `node.txt` | generated from the installed globals |
| `apps.txt`, `fonts.txt` | generated: `cask:` lines install through brew, `mas:`/`manual:` are a to-do list |
| `installers.tsv` | by hand: tools with their own installer (rustup, bun, solana, foundry, avm) and the command that updates each |
| `cargo.txt` | by hand: crates to reinstall (cargo cannot list path/git installs) |
| `unknown.txt` | generated: binaries nothing above covers. Classify them, or list them in `ignore-bins.txt`. |

Run `devtools inventory` after installing something new, commit with `dotsync push`.

## CI

`.github/workflows/check.yml` runs on every push, pull request and weekly:
shellcheck, a zsh syntax check, gitleaks, and a full `bootstrap.sh` on Debian, Arch and macOS followed by
checks that a second run changes nothing, links are healthy, `todo` works, zsh starts clean, tmux loads
with the right prefix, and nvim starts without errors.
