# Neovim Configuration Documentation

This document provides a comprehensive guide to all shortcuts, keybindings, and setup instructions for this Neovim configuration.

## Table of Contents
- [Setup Instructions](#setup-instructions)
- [Activating Mason](#activating-mason)
- [Updating Neovim Packages](#updating-neovim-packages)
- [Basic Vim Operations](#basic-vim-operations)
- [Keybindings](#keybindings)
- [LazyGit Workflow](#lazygit-workflow)
- [Plugin Information](#plugin-information)

---

## Setup Instructions

This configuration uses **Lazy.nvim** as the plugin manager. The plugins are automatically installed when you first open Neovim.

### Initial Setup

1. Make sure you have Neovim installed (version 0.8+ recommended)
2. Navigate to your Neovim config directory
3. Open Neovim - plugins will be automatically installed via Lazy.nvim

---

## Activating Mason

**Mason** is a package manager for LSP servers, DAP servers, linters, and formatters. It's already configured in this setup and will activate automatically.

### Manual Mason Commands

If you need to manually interact with Mason:

1. **Open Mason UI:**
   ```
   :Mason
   ```
   This opens the Mason interface where you can:
   - View installed packages
   - Install new packages
   - Uninstall packages
   - Update packages

2. **Install a specific package:**
   ```
   :MasonInstall <package-name>
   ```

3. **Uninstall a package:**
   ```
   :MasonUninstall <package-name>
   ```

### Pre-configured LSP Servers

The following LSP servers are configured to auto-install via Mason:
- `tsserver` - TypeScript/JavaScript
- `html` - HTML
- `cssls` - CSS
- `tailwindcss` - Tailwind CSS
- `svelte` - Svelte
- `lua_ls` - Lua
- `graphql` - GraphQL
- `emmet_ls` - Emmet
- `prismals` - Prisma
- `pyright` - Python

### Pre-configured Tools

The following tools are configured to auto-install:
- `prettier` - Code formatter
- `stylua` - Lua formatter
- `isort` - Python import sorter
- `black` - Python formatter
- `pylint` - Python linter
- `eslint_d` - JavaScript/TypeScript linter

---

## Updating Neovim Packages

### Quick Update Commands

**Update all plugins:**
```
:Lazy update
```

**Update Mason packages:**
```
:MasonUpdate
```

**Sync plugins (install missing, remove unused):**
```
:Lazy sync
```

### Detailed Update Instructions

#### Update All Plugins (Lazy.nvim)

**Method 1: Using Command**
1. Open Neovim
2. Type `:Lazy update` and press Enter
3. Wait for updates to complete

**Method 2: Using Lazy UI (Visual)**
1. Open Lazy UI: Type `:Lazy` and press Enter
2. This opens the Lazy.nvim interface where you can:
   - View all plugins and their status
   - Press `U` to update all plugins
   - Press `S` to sync plugins (install missing, remove unused)
   - Navigate with arrow keys
   - Press `?` for help
3. Press `q` to quit Lazy UI

**Method 3: Check for Updates First**
1. Type `:Lazy` to open UI
2. Press `C` to check for updates
3. Review available updates
4. Press `U` to update all, or select individual plugins

#### Update Mason Packages (LSP Servers, Formatters, Linters)

**Method 1: Using Command**
1. Open Neovim
2. Type `:MasonUpdate` and press Enter
3. This updates all installed Mason packages

**Method 2: Using Mason UI (Visual)**
1. Open Mason UI: Type `:Mason` and press Enter
2. In the Mason interface:
   - Navigate to packages with arrow keys
   - See which packages have updates available
   - Select individual packages and press `u` to update
   - Or use `:MasonUpdate` command to update all
3. Press `q` to quit Mason UI

**Method 3: Update Specific Package**
1. Type `:MasonInstall <package-name>` to reinstall/update a specific package
2. Example: `:MasonInstall pyright` updates the Python LSP server

### Update Frequency Recommendations

- **Plugins**: Update weekly or monthly for new features and bug fixes
- **Mason packages**: Update when you need new LSP features or when troubleshooting
- **Before updating**: Consider checking plugin changelogs for breaking changes

---

## Basic Vim Operations

### Copy, Cut, and Paste

| Operation | Keybinding | Mode | Description |
|-----------|------------|------|-------------|
| **Copy line** | `yy` | Normal | Copy (yank) entire line |
| **Copy multiple lines** | `3yy` | Normal | Copy 3 lines (replace 3 with any number) |
| **Copy to end of line** | `y$` | Normal | Copy from cursor to end of line |
| **Copy to beginning of line** | `y0` | Normal | Copy from cursor to beginning of line |
| **Copy word** | `yw` | Normal | Copy word under cursor |
| **Copy in visual mode** | Select text then `y` | Visual | Copy selected text |
| **Cut line** | `dd` | Normal | Cut (delete) entire line |
| **Cut multiple lines** | `3dd` | Normal | Cut 3 lines (replace 3 with any number) |
| **Paste after cursor** | `p` | Normal | Paste after cursor position |
| **Paste before cursor** | `P` | Normal | Paste before cursor position |
| **Paste in insert mode** | `<C-r>"` | Insert | Paste from default register |
| **Paste from system clipboard** | `"+p` | Normal | Paste from system clipboard (after) |
| **Copy to system clipboard** | `"+y` | Normal/Visual | Copy to system clipboard |

### File Operations

| Operation | Keybinding | Description |
|-----------|------------|-------------|
| **Create new file** | `:e filename` | Create/open file (if doesn't exist, creates on save) |
| **Create new file (alternative)** | `:new filename` | Create new file in horizontal split |
| **Create new file (alternative)** | `:vnew filename` | Create new file in vertical split |
| **Save file** | `:w` or `<leader>w` | Save current file |
| **Save and quit** | `:wq` or `ZZ` | Save and exit |
| **Quit without saving** | `:q!` or `ZQ` | Exit without saving |
| **Save all files** | `:wa` | Save all open files |
| **Open file** | `:e filename` | Open file in current buffer |
| **Open file in new tab** | `:tabnew filename` | Open file in new tab |

### Text Editing Basics

| Operation | Keybinding | Mode | Description |
|-----------|------------|------|-------------|
| **Delete character** | `x` | Normal | Delete character under cursor |
| **Delete word** | `dw` | Normal | Delete word under cursor |
| **Delete line** | `dd` | Normal | Delete entire line |
| **Delete to end of line** | `D` | Normal | Delete from cursor to end of line |
| **Undo** | `u` | Normal | Undo last change |
| **Redo** | `<C-r>` | Normal | Redo last undone change |
| **Enter insert mode** | `i` | Normal | Insert before cursor |
| **Enter insert mode at end of line** | `A` | Normal | Append at end of line |
| **Enter insert mode at beginning of line** | `I` | Normal | Insert at beginning of line |
| **Enter insert mode after cursor** | `a` | Normal | Append after cursor |
| **Enter insert mode on new line below** | `o` | Normal | Open new line below |
| **Enter insert mode on new line above** | `O` | Normal | Open new line above |

### Navigation

| Operation | Keybinding | Mode | Description |
|-----------|------------|------|-------------|
| **Move left** | `h` | Normal | Move cursor left |
| **Move down** | `j` | Normal | Move cursor down |
| **Move up** | `k` | Normal | Move cursor up |
| **Move right** | `l` | Normal | Move cursor right |
| **Move to beginning of line** | `0` | Normal | Move to start of line |
| **Move to end of line** | `$` | Normal | Move to end of line |
| **Move to beginning of file** | `gg` | Normal | Jump to first line |
| **Move to end of file** | `G` | Normal | Jump to last line |
| **Move to line number** | `:123` | Normal | Jump to line 123 (replace with any number) |
| **Move word forward** | `w` | Normal | Move to next word |
| **Move word backward** | `b` | Normal | Move to previous word |

---

## Keybindings

**Leader Key:** `<Space>` (spacebar)

### General Keymaps

| Keybinding | Mode | Description |
|------------|------|-------------|
| `jk` | Insert | Exit insert mode |
| `<leader>nh` | Normal | Clear search highlights |
| `<leader>+` | Normal | Increment number |
| `<leader>-` | Normal | Decrement number |

### Window Management

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>sv` | Normal | Split window vertically |
| `<leader>sh` | Normal | Split window horizontally |
| `<leader>se` | Normal | Make splits equal size |
| `<leader>sx` | Normal | Close current split |
| `<leader>sm` | Normal | Maximize/minimize a split |

### Tab Management

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>to` | Normal | Open new tab |
| `<leader>tx` | Normal | Close current tab |
| `<leader>tn` | Normal | Go to next tab |
| `<leader>tp` | Normal | Go to previous tab |
| `<leader>tf` | Normal | Open current buffer in new tab |

### Telescope (Fuzzy Finder)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>ff` | Normal | Fuzzy find files in current directory |
| `<leader>fr` | Normal | Fuzzy find recent files |
| `<leader>fs` | Normal | Find string in current directory (live grep) |
| `<leader>fc` | Normal | Find string under cursor in current directory |
| `<leader>ft` | Normal | Find todos |
| `<C-k>` | Insert (in Telescope) | Move to previous result |
| `<C-j>` | Insert (in Telescope) | Move to next result |
| `<C-q>` | Insert (in Telescope) | Send selected to quickfix list |

### File Explorer (Nvim-tree)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>ee` | Normal | Toggle file explorer |
| `<leader>ef` | Normal | Toggle file explorer on current file |
| `<leader>ec` | Normal | Collapse file explorer |
| `<leader>er` | Normal | Refresh file explorer |

### Trouble (Diagnostics & Quickfix)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>xw` | Normal | Open trouble workspace diagnostics |
| `<leader>xd` | Normal | Open trouble document diagnostics |
| `<leader>xq` | Normal | Open trouble quickfix list |
| `<leader>xl` | Normal | Open trouble location list |
| `<leader>xt` | Normal | Open todos in trouble |

### LSP (Language Server Protocol)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `gR` | Normal | Show LSP references (Telescope) |
| `gD` | Normal | Go to declaration |
| `gd` | Normal | Show LSP definitions (Telescope) |
| `gi` | Normal | Show LSP implementations (Telescope) |
| `gt` | Normal | Show LSP type definitions (Telescope) |
| `<leader>ca` | Normal/Visual | See available code actions |
| `<leader>rn` | Normal | Smart rename |
| `<leader>D` | Normal | Show buffer diagnostics (Telescope) |
| `<leader>d` | Normal | Show line diagnostics (float) |
| `[d` | Normal | Go to previous diagnostic |
| `]d` | Normal | Go to next diagnostic |
| `K` | Normal | Show documentation for what is under cursor |
| `<leader>rs` | Normal | Restart LSP |

### Git (Gitsigns)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `]h` | Normal | Next hunk |
| `[h` | Normal | Previous hunk |
| `<leader>hs` | Normal/Visual | Stage hunk |
| `<leader>hr` | Normal/Visual | Reset hunk |
| `<leader>hS` | Normal | Stage buffer |
| `<leader>hR` | Normal | Reset buffer |
| `<leader>hu` | Normal | Undo stage hunk |
| `<leader>hp` | Normal | Preview hunk |
| `<leader>hb` | Normal | Blame line |
| `<leader>hB` | Normal | Toggle line blame |
| `<leader>hd` | Normal | Diff this |
| `<leader>hD` | Normal | Diff this ~ |
| `ih` | Operator/Visual | Gitsigns select hunk (text object) |

### LazyGit

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>lg` | Normal | Open lazy git |

### Auto Session

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>wr` | Normal | Restore session for current directory |
| `<leader>ws` | Normal | Save session for auto session root dir |

### Substitute

| Keybinding | Mode | Description |
|------------|------|-------------|
| `s` | Normal | Substitute with motion |
| `ss` | Normal | Substitute line |
| `S` | Normal | Substitute to end of line |
| `s` | Visual | Substitute in visual mode |

### Autocompletion (nvim-cmp)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<C-k>` | Insert | Previous suggestion |
| `<C-j>` | Insert | Next suggestion |
| `<C-b>` | Insert | Scroll docs up |
| `<C-f>` | Insert | Scroll docs down |
| `<C-Space>` | Insert | Show completion suggestions |
| `<C-e>` | Insert | Close completion window |
| `<CR>` | Insert | Confirm selection |

### Comment

The Comment plugin is configured but uses default keybindings:
- `gcc` - Toggle line comment
- `gbc` - Toggle block comment
- `gc` - Toggle comment in visual mode
- `gb` - Toggle block comment in visual mode

### Surround

The Surround plugin is configured but uses default keybindings:
- `ys` - Add surrounding
- `ds` - Delete surrounding
- `cs` - Change surrounding

---

## LazyGit Workflow

LazyGit is a simple terminal UI for git commands. This configuration integrates LazyGit so you can perform all git operations visually.

### Opening LazyGit

1. Press `<leader>lg` (Space + lg) in Normal mode
2. This opens LazyGit in a floating window

### Complete Git Workflow: Add, Commit, and Push

Here's a step-by-step guide to perform `git add .`, `git commit -m "message"`, and `git push -u origin main` using LazyGit:

#### Step 1: Stage All Files (git add .)

1. Open LazyGit with `<leader>lg`
2. You'll see the LazyGit interface with several panels:
   - **Files panel** (left side) - Shows modified/untracked files
   - **Status panel** (right side) - Shows file changes
3. To stage all files:
   - Press `a` to stage all files (equivalent to `git add .`)
   - Or navigate to individual files and press `Space` to stage them one by one
   - Staged files will show with a green indicator

#### Step 2: Commit Changes (git commit -m "message")

1. After staging files, press `c` to open the commit message editor
2. Type your commit message (e.g., "Initial commit" or "Fix bug in login")
3. Press `Esc` to exit insert mode
4. Press `:wq` or `ZZ` to save and commit
   - This is equivalent to `git commit -m "your message"`

#### Step 3: Push to Remote (git push -u origin main)

1. After committing, you'll see the commit in the **Commits panel** (usually at the bottom)
2. To push:
   - Press `P` (capital P) to push to remote
   - Or press `p` (lowercase) to see push options
3. If this is the first push:
   - LazyGit will ask you to set the upstream branch
   - Select the remote (usually `origin`)
   - Select the branch (usually `main` or `master`)
   - This is equivalent to `git push -u origin main`
4. For subsequent pushes, just press `P` and it will push to the configured upstream

### LazyGit Keybindings Reference

| Key | Action | Description |
|-----|--------|-------------|
| `a` | Stage all | Stage all modified/untracked files |
| `Space` | Stage file | Stage/unstage individual file |
| `c` | Commit | Create a new commit |
| `P` | Push | Push commits to remote |
| `p` | Pull | Pull from remote |
| `b` | Branch | Create/switch branches |
| `r` | Rebase | Start interactive rebase |
| `m` | Merge | Merge branches |
| `d` | Discard | Discard changes (unstage) |
| `R` | Reset | Reset to commit |
| `?` | Help | Show all keybindings |
| `q` | Quit | Exit LazyGit |

### Common LazyGit Workflows

#### Quick Commit and Push
1. `<leader>lg` - Open LazyGit
2. `a` - Stage all files
3. `c` - Open commit editor
4. Type message, then `:wq` - Commit
5. `P` - Push to remote

#### Review Changes Before Committing
1. `<leader>lg` - Open LazyGit
2. Navigate to a file with arrow keys
3. Press `Enter` to see diff
4. `q` to go back
5. `Space` to stage file
6. `c` to commit

#### Create and Switch Branches
1. `<leader>lg` - Open LazyGit
2. `b` - Open branch menu
3. `n` - Create new branch
4. Type branch name
5. `Enter` to create and switch

#### View Commit History
1. `<leader>lg` - Open LazyGit
2. Navigate to **Commits panel** (usually bottom panel)
3. Use arrow keys to browse commits
4. Press `Enter` to see commit details

### Tips for LazyGit

- **Always check what you're staging**: Review files before staging with `Enter`
- **Use descriptive commit messages**: Write clear, meaningful commit messages
- **Check status before pushing**: Make sure you're on the right branch
- **Use `?` for help**: Press `?` anytime to see all available commands
- **Undo staging**: Press `Space` again on a staged file to unstage it
- **Discard changes**: Press `d` on a file to discard changes (be careful!)

---

## Plugin Information

### Core Plugins

- **Lazy.nvim** - Plugin manager
- **Mason.nvim** - Package manager for LSP servers, formatters, linters
- **nvim-lspconfig** - LSP configuration
- **nvim-cmp** - Autocompletion engine
- **LuaSnip** - Snippet engine

### UI Plugins

- **alpha-nvim** - Startup screen
- **bufferline.nvim** - Tab/buffer line
- **lualine.nvim** - Status line
- **nvim-tree** - File explorer
- **which-key.nvim** - Keybinding helper

### Productivity Plugins

- **telescope.nvim** - Fuzzy finder
- **trouble.nvim** - Diagnostics viewer
- **todo-comments.nvim** - Todo highlighting
- **auto-session** - Session management
- **gitsigns.nvim** - Git integration
- **lazygit.nvim** - LazyGit integration

### Code Quality

- **treesitter** - Syntax highlighting
- **indent-blankline** - Indentation guides
- **Comment.nvim** - Commenting
- **nvim-surround** - Surround text objects
- **substitute.nvim** - Enhanced substitution
- **autopairs** - Auto-pair brackets/quotes
- **formatting** - Code formatting
- **linting** - Code linting

### Configuration Files

- `init.lua` - Main entry point
- `lua/subh/core/` - Core configuration (options, keymaps)
- `lua/subh/plugins/` - Plugin configurations
- `lua/subh/lazy.lua` - Lazy.nvim setup

---

## Tips

1. **Which-Key**: Press `<leader>` and wait to see available keybindings
2. **Lazy UI**: Use `:Lazy` to manage plugins visually
3. **Mason UI**: Use `:Mason` to manage LSP servers and tools
4. **Trouble**: Use `<leader>xw` or `<leader>xd` to see all diagnostics
5. **Telescope**: Most file/string searches go through Telescope

---

## Troubleshooting

### Plugins not loading?
- Run `:Lazy sync` to sync plugins
- Check `:checkhealth` for issues

### LSP not working?
- Run `:Mason` to check if LSP servers are installed
- Run `:LspInfo` to see active LSP servers
- Restart LSP with `<leader>rs`

### Keybindings not working?
- Check if you're in the correct mode (Normal/Insert/Visual)
- Use `:WhichKey` or press `<leader>` to see available bindings

---

*Last updated: Configuration based on current setup*

