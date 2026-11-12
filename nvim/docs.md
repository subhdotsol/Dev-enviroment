# Neovim + Tmux Cheatsheet

> Leader key: `Space` | Tmux prefix: `Ctrl+a`
> Arrow keys are disabled — use `hjkl`

---

## General

| Key | Mode | Action |
|-----|------|--------|
| `jk` | Insert | Exit insert mode |
| `,,` | Insert | Jump to end of line |
| `Space w` | Normal | Quick save |
| `Space nh` | Normal | Clear search highlights |
| `Space +` / `Space -` | Normal | Increment / decrement number |
| `Ctrl+n` | Normal | Move line down |
| `Ctrl+p` | Normal | Move line up |
| `Ctrl+n` | Visual | Move selection down |
| `Ctrl+p` | Visual | Move selection up |

---

## Splits & Tabs

| Key | Action |
|-----|--------|
| `Space sv` | Split vertically |
| `Space sh` | Split horizontally |
| `Space se` | Equalize splits |
| `Space sx` | Close split |
| `Space sm` | Maximize/restore split (vim-maximizer) |
| `Space to` | New tab |
| `Space tx` | Close tab |
| `Space tn` | Next tab |
| `Space tp` | Previous tab |
| `Space tf` | Open current buffer in new tab |

---

## File Explorer (nvim-tree)

| Key | Action |
|-----|--------|
| `Space ee` | Toggle file explorer |
| `Space ef` | Toggle explorer on current file |
| `Space ec` | Collapse explorer |
| `Space er` | Refresh explorer |

---

## Telescope (Fuzzy Finder)

| Key | Action |
|-----|--------|
| `Space ff` | Find files |
| `Space fr` | Recent files |
| `Space fs` | Live grep (search text) |
| `Space fc` | Grep string under cursor |
| `Space ft` | Find TODOs |
| `Space fy` | Yank/clipboard history (neoclip) |
| `Space fF` | Pick directory, then find files in it |
| `Space fA` | Find files anywhere (from home) |
| `Space fT` | Pick/switch terminal |
| `Space tm` | Pick colorscheme (gruvbox / shale) |

**Inside Telescope:**

| Key | Action |
|-----|--------|
| `Ctrl+j` | Next result |
| `Ctrl+k` | Previous result |
| `Ctrl+q` | Send to quickfix list |

---

## Harpoon (File Bookmarks)

| Key | Action |
|-----|--------|
| `Space a` | Add current file to harpoon |
| `Ctrl+e` | Open harpoon quick menu |
| `Space 1` | Jump to harpoon file 1 |
| `Space 2` | Jump to harpoon file 2 |
| `Space 3` | Jump to harpoon file 3 |
| `Space 4` | Jump to harpoon file 4 |
| `Space hc` | Clear harpoon list |

---

## LSP

| Key | Action |
|-----|--------|
| `gd` | Go to definition (Telescope) |
| `gD` | Go to declaration |
| `gR` | Show references (Telescope) |
| `gi` | Show implementations (Telescope) |
| `gt` | Show type definitions (Telescope) |
| `K` | Hover documentation |
| `Space ca` | Code action (normal + visual) |
| `Space rn` | Rename symbol |
| `Space D` | Buffer diagnostics (Telescope) |
| `Space ed` | Line diagnostics (float) |
| `[d` / `]d` | Previous / next diagnostic |
| `Space rs` | Restart LSP |
| `Space d` | Go to definition (quick) |

**LSP servers installed:** ts_ls, tailwindcss, eslint, html, cssls, jsonls, gopls, lua_ls, clangd, rust-analyzer (via rustaceanvim)

---

## Rustaceanvim (Enhanced Rust)

All standard LSP keymaps work in Rust files. Additional commands:

| Command | Action |
|---------|--------|
| `:RustLsp expandMacro` | See what a macro generates |
| `:RustLsp runnables` | Run a test/binary (pick from list) |
| `:RustLsp debuggables` | Debug a test/binary |
| `:RustLsp openCargo` | Open Cargo.toml |
| `:RustLsp syntaxTree` | View syntax tree |
| `:RustLsp moveItem up` / `down` | Move item up/down |
| `:RustLsp joinLines` | Smart join lines (Rust-aware) |
| `:RustLsp explainError` | Explain error under cursor |
| `:RustLsp renderDiagnostic` | Render diagnostic inline |
| `:RustLsp rebuildProcMacros` | Rebuild proc macros |
| `:RustLsp codeAction` | Grouped code actions |
| `:RustLsp flyCheck` | Run check without saving |
| `:RustLsp ssr` | Structural search and replace |

Inlay hints (type hints, parameter hints, chaining hints) are enabled automatically in Rust files.

---

## Completion (nvim-cmp)

### In Insert Mode

| Key | Action |
|-----|--------|
| `Ctrl+Space` | Trigger completion |
| `Ctrl+j` | Next item |
| `Ctrl+k` | Previous item |
| `Ctrl+b` | Scroll docs up |
| `Ctrl+f` | Scroll docs down |
| `Ctrl+e` | Close completion |
| `Enter` | Confirm selection |

### In Command Line (`:`, `/`, `?`)

Autocomplete is active automatically:
- `:` mode — command completions + command history + zsh history (for `!` commands)
- `/` and `?` mode — buffer text completions
- Wilder.nvim provides additional fuzzy matching for `:`, `/`, `?`

---

## Copilot (AI Completions)

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+l` | Insert | Accept suggestion |
| `Ctrl+g` | Insert | Next suggestion |
| `Ctrl+x` | Insert | Dismiss suggestion |

Copilot auto-triggers in insert mode. First time you'll need to run `:Copilot auth` to authenticate.

---

## Compile Mode

| Key | Action |
|-----|--------|
| `Space cc` | Compile — prompts for a command (e.g. `cargo build`, `npm test`) |
| `Space cr` | Recompile — reruns last command |
| `Space ch` | Compile history — pick a previous command from Telescope |

**Inside the compilation buffer:**

| Key | Action |
|-----|--------|
| `Enter` | Jump to file:line:col from error output |
| `Ctrl+\` | Jump back to code window |
| `Ctrl+q` | Send errors to quickfix list |
| `i` | Send stdin input to running program |
| `Ctrl+d` | Send EOF to running program |

History persists across nvim sessions.

---

## Git

### Gitsigns (Hunks)

| Key | Action |
|-----|--------|
| `]h` / `[h` | Next / previous hunk |
| `Space hs` | Stage hunk |
| `Space hr` | Reset hunk |
| `Space hS` | Stage entire buffer |
| `Space hR` | Reset entire buffer |
| `Space hu` | Undo stage hunk |
| `Space hp` | Preview hunk |
| `Space hb` | Blame line |
| `Space hB` | Toggle line blame |
| `Space hd` | Diff this |
| `Space hD` | Diff this ~ |
| `ih` | Select hunk (text object, visual/operator) |

### Fugitive (Git Commands)

| Key | Action |
|-----|--------|
| `Space gs` | Git status |
| `Space gc` | Git commit |
| `Space gp` | Git push |
| `Space gl` | Git pull |
| `Space gd` | Git diff split |

Also available: `:Git blame`, `:Git log`, `:Ggrep`, `:GBrowse`, `:GMove`, `:GDelete`

### LazyGit

| Key | Action |
|-----|--------|
| `Space lg` | Open LazyGit (full TUI) |

### Octo (GitHub PRs/Issues)

| Command | Action |
|---------|--------|
| `:Octo pr list` | List open PRs |
| `:Octo pr list states=MERGED` | List merged PRs |
| `:Octo pr list states=ALL` | List all PRs |
| `:Octo pr edit <number>` | Open a specific PR |
| `:Octo issue list` | List issues |
| `:Octo issue create` | Create a new issue |
| `:Octo review start` | Start a PR review |

---

## Debugging (DAP)

| Key | Action |
|-----|--------|
| `Space db` | Toggle breakpoint |
| `Space dB` | Set conditional breakpoint |
| `Space dc` | Continue |
| `Space di` | Step into |
| `Space do` | Step over |
| `Space dO` | Step out |
| `Space dr` | Toggle REPL |
| `Space dl` | Run last |
| `Space du` | Toggle DAP UI |
| `Space dt` | Terminate |

Debug adapter: `codelldb` (Rust/C/C++)

---

## Formatting & Linting

| Key | Action |
|-----|--------|
| `Space mp` | Format file or selection |
| `Space l` | Trigger linting |

**Format-on-save** is enabled (1s timeout, LSP fallback).

| Language | Formatter |
|----------|-----------|
| JS/TS/JSX/TSX/CSS/HTML/JSON/YAML/Markdown | prettier |
| Lua | stylua |
| Rust | rustfmt |

| Language | Linter |
|----------|--------|
| JS/TS/JSX/TSX | eslint_d |

---

## Trouble (Diagnostics)

| Key | Action |
|-----|--------|
| `Space xw` | Workspace diagnostics |
| `Space xd` | Document diagnostics |
| `Space xq` | Quickfix list |
| `Space xl` | Location list |
| `Space xt` | TODOs in trouble |

---

## Todo Comments

| Key | Action |
|-----|--------|
| `]t` / `[t` | Next / previous TODO comment |
| `Space ft` | Find all TODOs (Telescope) |
| `Space xt` | TODOs in Trouble |

Highlights: `TODO`, `FIXME`, `HACK`, `WARN`, `PERF`, `NOTE`

---

## Editing Helpers

### Surround

| Key | Action |
|-----|--------|
| `ys{motion}{char}` | Add surround (e.g. `ysiw"` wraps word in quotes) |
| `ds{char}` | Delete surround (e.g. `ds"` removes quotes) |
| `cs{old}{new}` | Change surround (e.g. `cs"'` changes `"` to `'`) |
| `S{char}` | Surround selection (visual mode) |

### Substitute

| Key | Mode | Action |
|-----|------|--------|
| `s{motion}` | Normal | Substitute with motion |
| `ss` | Normal | Substitute entire line |
| `S` | Normal | Substitute to end of line |
| `s` | Visual | Substitute selection |

### Comment

| Key | Action |
|-----|--------|
| `gcc` | Toggle line comment |
| `gbc` | Toggle block comment |
| `gc{motion}` | Comment with motion (e.g. `gcap` comments paragraph) |
| `gc` / `gb` | Toggle comment/block (visual mode) |

### Autopairs

Automatic — `(`, `{`, `[`, `"`, `'` auto-close on insert. Treesitter-aware.

### Autotag

Automatic — HTML/JSX tags auto-close and auto-rename.

---

## Undotree

| Key | Action |
|-----|--------|
| `Space u` | Toggle undo tree (visual undo history) |

Navigate the tree to jump to any previous file state, even across undo branches.

---

## Neoclip (Yank History)

| Key | Action |
|-----|--------|
| `Space fy` | Search yank/delete history in Telescope |

Every `y` (yank) and `d` (delete) is saved and searchable.

---

## Session Management

| Key | Action |
|-----|--------|
| `Space wr` | Restore session for current directory |
| `Space ws` | Save session |

Sessions auto-save. Suppressed directories: home, Dev, Downloads, Documents, Desktop.

---

## Terminal (Snacks)

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+t` | Normal/Terminal | Toggle float terminal |
| `Space tt` | Normal | Toggle float terminal |
| `Space th` | Normal | Open horizontal terminal |
| `Space tv` | Normal | Open vertical terminal |
| `Space fT` | Normal | Pick/switch between terminals |

**Inside terminal:**

| Key | Action |
|-----|--------|
| `Esc` | Exit terminal mode |
| `jk` | Exit terminal mode |
| `Ctrl+h/j/k/l` | Navigate to window |

---

## Which-Key

Press `Space` and wait — a popup shows all available `Space + ...` keybinds. Works for any prefix.

---

## Snacks Features

| Feature | What it does |
|---------|--------------|
| Dashboard | Startup screen with quick-action keys |
| Terminal | Floating terminal |
| Scroll | Smooth scrolling on `Ctrl+d`/`Ctrl+u` |
| Indent | Indentation guide lines (`┊`) |
| Git | Git browse and blame |
| LazyGit | LazyGit TUI integration |

---

## Tmux

### Prefix: `Ctrl+a`

Press `Ctrl+a` first, then the key.

### Splits

| Key | Action |
|-----|--------|
| `prefix |` | Split horizontally (side by side) |
| `prefix -` | Split vertically (top/bottom) |

### Pane Resize

| Key | Action |
|-----|--------|
| `prefix h` | Resize left 5 columns |
| `prefix l` | Resize right 5 columns |
| `prefix j` | Resize down 5 lines |
| `prefix k` | Resize up 5 lines |
| `prefix m` | Zoom/unzoom pane (maximize toggle) |

### Pane Navigation (no prefix needed)

| Key | Action |
|-----|--------|
| `Ctrl+h` | Move to left pane (or nvim split) |
| `Ctrl+j` | Move to pane below (or nvim split) |
| `Ctrl+k` | Move to pane above (or nvim split) |
| `Ctrl+l` | Move to right pane (or nvim split) |
| `Ctrl+\` | Move to previous pane |

These work seamlessly between tmux panes and nvim splits (vim-tmux-navigator).

### Copy Mode (vi keys)

| Key | Action |
|-----|--------|
| `prefix [` | Enter copy mode |
| `v` | Start selection |
| `y` | Copy/yank selection |
| `Enter` | Exit copy mode |

### Other

| Key | Action |
|-----|--------|
| `prefix r` | Reload tmux config |
| `prefix Alt+c` | Set session default directory to current pane path |
| `prefix c` | New window |
| `prefix n` / `prefix p` | Next / previous window |
| `prefix d` | Detach session |

### Tmux Plugins

| Plugin | What it does |
|--------|--------------|
| tpm | Plugin manager |
| vim-tmux-navigator | Seamless Ctrl+hjkl between tmux and nvim |
| tmux-resurrect | Save/restore sessions (preserves pane contents) |
| tmux-continuum | Auto-restore on tmux start |

### Settings

- Mouse: enabled
- Scrollback: 100,000 lines
- Escape time: 10ms (fast for nvim)
- Theme: Gruvbox dark (yellow `#fabd2f` accents)
- Status bar: session name (left), disk usage + time (right)

---

## Plugin Manager Commands

| Command | Action |
|---------|--------|
| `:Lazy` | Open plugin manager UI |
| `:Lazy update` | Update all plugins |
| `:Lazy clean` | Remove unused plugins |
| `:Lazy profile` | See startup time per plugin |
| `:Mason` | Open LSP/tool installer UI |

---

## Quick Reference: All Leader (`Space`) Prefixes

| Prefix | Category |
|--------|----------|
| `Space f...` | **Find** (Telescope, files, grep, todos, yank history, terminals) |
| `Space e...` | **Explorer** (nvim-tree) + diagnostics |
| `Space h...` | **Hunks** (gitsigns) + harpoon clear |
| `Space g...` | **Git** (fugitive) |
| `Space d...` | **Debug** (DAP) |
| `Space c...` | **Compile** (compile-mode) |
| `Space x...` | **Trouble** (diagnostics, quickfix, todos) |
| `Space s...` | **Splits** (vertical, horizontal, equal, close, maximize) |
| `Space t...` | **Tabs + Terminal** (new, close, next, prev, float, horizontal, vertical) |
| `Space w...` | **Session** (save, restore) + quick save |
| `Space r...` | **Rename** + restart LSP |
| `Space l` | **Lint** |
| `Space m...` | **Format** (mp) + markdown |
| `Space D` | **Buffer diagnostics** |
| `Space ca` | **Code action** |
| `Space lg` | **LazyGit** |
| `Space u` | **Undotree** |
| `Space a` | **Harpoon add** |
| `Space 1-4` | **Harpoon jump** |
