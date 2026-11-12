# dotfiles

<img align="center" src="assets/banner.svg" alt="dotfiles: one config for macOS and Linux" width="100%">

<p align="center">
  <a href="https://github.com/AvhiMaz/dotfiles/actions/workflows/check.yml"><img src="https://github.com/AvhiMaz/dotfiles/actions/workflows/check.yml/badge.svg" alt="check"></a>
  <img src="https://img.shields.io/badge/platform-macOS%20%7C%20Linux-blue" alt="macOS | Linux">
  <img src="https://img.shields.io/badge/neovim-0.12%2B-57A143" alt="neovim 0.12+">
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-MIT-green" alt="MIT license"></a>
</p>

My terminal setup for **macOS**, **Arch** and **Debian/Ubuntu**: Neovim, tmux, Ghostty, zsh.
One config for every machine; the few real OS differences live in `zsh/darwin.zsh` and `zsh/linux.zsh`.

## New machine

```sh
git clone https://github.com/subhdotsol/dotfiles.git ~/Dev/dotfiles
cd ~/Dev/dotfiles && ./bootstrap.sh
```

Then put API keys in `~/.zshrc.local` (template: `zsh/zshrc.local.example`) and run
`chsh -s "$(command -v zsh)"` if zsh is not your login shell.

## Layout

```
nvim/          Neovim (lazy.nvim, versions pinned in lazy-lock.json)
tmux/          tmux.conf, linked to ~/.tmux.conf
ghostty/       terminal config
zsh/           zshrc (shared), darwin.zsh, linux.zsh, zshrc.local.example
bin/           todo, dotsync, devtools (linked into ~/.local/bin)
packages/      what is installed on my Mac (see devtools below)
assets/fonts/  fonts that have no download source
.githooks/     pre-commit secret scan
.github/       CI
bootstrap.sh   new-machine setup
install.sh     symlinks the repo into $HOME
Brewfile       core macOS packages, used by bootstrap.sh
CHEATSHEET.md  every Neovim binding
```

The configs are symlinked, so the repo is live: edit a file and it is already applied.

## Scripts and commands

### `bootstrap.sh`

New machine in one command. In order:

1. Installs packages: Homebrew (`Brewfile`) on macOS, pacman on Arch, apt on Debian/Ubuntu. Where apt is too old,
   it installs upstream builds of neovim (0.12+), tree-sitter-cli, lazygit, starship and zoxide.
2. Clones oh-my-zsh, zsh-autosuggestions, zsh-syntax-highlighting and tpm.
3. Runs `install.sh`.
4. Runs `devtools install` to restore everything recorded in `packages/`.
5. Installs the tmux plugins (tpm) and the nvim plugins (`:Lazy restore`, versions from `lazy-lock.json`).

```
./bootstrap.sh              everything
./bootstrap.sh --core       stop before step 4 (what CI runs)
./bootstrap.sh --dry-run    print every command, change nothing
```

Idempotent: safe to run again.

### `install.sh`

Symlinks the configs into `$HOME`: `nvim`, `tmux.conf`, `zshrc`, ghostty, and `todo`, `dotsync`, `devtools` into
`~/.local/bin`. Anything already there is moved to `~/.dotfiles-backup/<timestamp>/` first. Also enables the
pre-commit hook for this repo.

```
./install.sh              link everything
./install.sh --dry-run    print only
```

### `todo`

Tiny terminal todo manager. Tasks live in `~/.todos.txt` (override with `$TODO_FILE`) as `[ ] text` / `[x] text`.
Numbers count pending tasks only, so `todo list` and `todo done 2` always agree.

```
todo                      list pending tasks
todo add <task>           add a task                 (a)
todo list                 list pending tasks         (l)
todo all                  pending and completed
todo done <n>             mark pending task n done   (d)
todo remove <n>           delete pending task n      (r, rm)
todo clear                delete completed tasks     (c)
todo stats                counts and progress        (s)
todo display              compact list, long lines cut to 47 characters
todo help                 usage
```

### `dotsync`

Keeps this repo and GitHub in step.

```
dotsync status            link health, then git status
dotsync push [message]    secret scan, commit everything, push
dotsync pull              fast-forward pull, then re-link
dotsync scan [--staged]   secret scan on its own
```

The scan always runs built-in patterns (Anthropic/OpenAI/GitHub/AWS/Slack keys, private keys, `KEY=value`
assignments). If `gitleaks` is installed it runs too. The pre-commit hook calls `dotsync scan --staged`.

### `devtools`

Knows every tool on the machine, reinstalls it, and updates it.

```
devtools inventory        scan this Mac and rewrite packages/ and assets/fonts/
devtools install          install everything recorded
devtools upgrade          update every installed tool
devtools list             what is recorded, with counts

--dry-run                 print commands, change nothing (install, upgrade)
--only <manager>          limit to one of: brew fonts installers node rustup bun npm go cargo
```

`devtools install` order: brew, fonts, installers, rust toolchains, node versions, then bun, npm, go and cargo
packages. `devtools upgrade` runs `brew update && brew upgrade`, each installer's update command,
`rustup update`, `bun update -g`, `npm update -g`, and reinstalls the latest go tools and cargo crates.

| File in `packages/` | Source |
|---|---|
| `Brewfile` | generated: taps, top-level formulae (not dependencies), casks, VS Code extensions |
| `bun.txt` `npm.txt` `go.txt` `rustup.txt` `node.txt` | generated from what is installed |
| `apps.txt` | generated: `cask:` lines are installed through brew, `mas:` and `manual:` are a to-do list |
| `fonts.txt` | generated: `cask:` lines install through brew, `local:` fonts are stored in `assets/fonts/` |
| `installers.tsv` | by hand: tools with their own installer (rustup, bun, solana, foundry, avm), tab-separated: name, detect command, install command, update command |
| `cargo.txt` | by hand: crates to reinstall |
| `ignore-bins.txt` | by hand: binaries `inventory` should not report |
| `unknown.txt`, `cargo-bins.txt` | generated, informational |

After installing something new: `devtools inventory`, then `dotsync push`.

### `.githooks/pre-commit`

Runs `dotsync scan --staged` and blocks the commit if it finds a secret.

## Secrets

Nothing secret belongs in this repo. Keys and one-machine paths go in `~/.zshrc.local`, which `zshrc`
sources last and git ignores. The pre-commit hook and CI both scan for secrets.

## Limitations

- **Linux is only tested in CI.** `bootstrap.sh` was written for Arch and Debian but only run on macOS by hand.
  A first CI run on Linux can fail and need a fix.
- **`devtools` is macOS-first.** Casks, `mas`, `~/Library/Fonts` and the app scan only exist on macOS. On Linux
  it only handles fonts, installers, rust, node, and the bun/npm/go/cargo lists.
- **`unknown.txt` is a to-do list.** Binaries in `~/.local/bin` and `~/.cargo/bin` that no list covers are reported,
  not installed. Add an installer to `installers.tsv`, a crate to `cargo.txt`, or the name to `ignore-bins.txt`.
  Many of them are my own projects.
- **`cargo.txt` is curated by hand.** `cargo install --list` cannot see crates installed from a path or git, so
  `inventory` cannot build the list itself.
- **App matching is exact-name only.** An app becomes a `cask:` line only when its display name equals the
  cask's name. Everything else is `manual:`, and Mac App Store apps (`mas:`) are listed but not installed.
- **Apps that update themselves are not upgraded.** `devtools upgrade` only touches brew-managed apps.
- **Installers run remote scripts.** `installers.tsv` downloads and runs the official scripts from `sh.rustup.rs`,
  `bun.sh`, `release.anza.xyz` and `foundry.paradigm.xyz`. Read it before running on a new machine.
- **Nothing outside the repo is restored:** app logins, licences, and app settings that live outside `~/.config`.
- **Versions float.** Rust toolchains, node versions and bun/npm/go tools are recorded by name, so a new machine
  gets the latest builds of those tools. Only the Neovim plugins are pinned (`lazy-lock.json`).
- **A fresh bootstrap dirties `nvim/lazy-lock.json`.** lazy.nvim rewrites its own entry on first run.
- **`todo` shadows `~/.cargo/bin/todo`.** `~/.local/bin` comes first in `PATH`.
- **Fonts.** `assets/fonts/` holds the four MesloLGS NF files (about 10 MB). Delete them if you do not use that font.
- **`packages/` is a snapshot.** Removing a tool from your Mac does not remove it from `packages/` until you run
  `devtools inventory` again.

## CI

`.github/workflows/check.yml` runs on every push, pull request and weekly:
shellcheck, a zsh syntax check, gitleaks, and `bootstrap.sh --core` on Debian, Arch and macOS, followed by
checks that a second run changes nothing, links are healthy, `devtools` lists its files, `todo` works,
zsh starts clean, tmux loads with the right prefix, and nvim starts without errors.
