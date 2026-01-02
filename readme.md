# Neovim Shortcuts Cheat Sheet

> **Leader Key**: `Space` (` `)

This guide covers all shortcuts from your Neovim configuration, from basic Vim motions to custom plugin keybindings.

---

## 📑 Table of Contents

- [Core Vim Motions & Text Objects](#core-vim-motions--text-objects)
- [Insert Mode Basics](#insert-mode-basics)
- [Visual Mode](#visual-mode)
- [Copy, Paste & Delete](#copy-paste--delete)
- [Search & Replace](#search--replace)
- [Navigation & Movement](#navigation--movement)
- [Custom Keybindings](#custom-keybindings)
- [Window & Tab Management](#window--tab-management)
- [File Explorer (nvim-tree)](#file-explorer-nvim-tree)
- [Fuzzy Finding (Telescope)](#fuzzy-finding-telescope)
- [LSP (Language Server)](#lsp-language-server)
- [Git Integration (Gitsigns)](#git-integration-gitsigns)
- [Code Editing Plugins](#code-editing-plugins)
- [Autocompletion](#autocompletion)
- [Other Plugins](#other-plugins)

---

## Core Vim Motions & Text Objects

### Basic Movement
| Shortcut | Description |
|----------|-------------|
| `h` | Move left |
| `j` | Move down |
| `k` | Move up |
| `l` | Move right |
| `w` | Move forward to start of next word |
| `W` | Move forward to start of next WORD (whitespace-separated) |
| `b` | Move backward to start of previous word |
| `B` | Move backward to start of previous WORD |
| `e` | Move to end of current/next word |
| `E` | Move to end of current/next WORD |
| `ge` | Move to end of previous word |
| `0` | Move to start of line (column 0) |
| `^` | Move to first non-blank character of line |
| `$` | Move to end of line |
| `gg` | Go to first line of file |
| `G` | Go to last line of file |
| `{number}G` | Go to line {number} |
| `{number}gg` | Go to line {number} |
| `%` | Jump to matching bracket/parenthesis |

### Screen Movement
| Shortcut | Description |
|----------|-------------|
| `H` | Move to top of screen |
| `M` | Move to middle of screen |
| `L` | Move to bottom of screen |
| `Ctrl-u` | Scroll up half page |
| `Ctrl-d` | Scroll down half page |
| `Ctrl-b` | Scroll up full page |
| `Ctrl-f` | Scroll down full page |
| `zz` | Center screen on cursor |
| `zt` | Move cursor line to top of screen |
| `zb` | Move cursor line to bottom of screen |

### Text Objects
Text objects are used with operators (like `d`, `c`, `y`) to act on specific parts of text.

| Shortcut | Description |
|----------|-------------|
| `iw` | Inner word (without surrounding whitespace) |
| `aw` | A word (with surrounding whitespace) |
| `iW` | Inner WORD |
| `aW` | A WORD |
| `is` | Inner sentence |
| `as` | A sentence |
| `ip` | Inner paragraph |
| `ap` | A paragraph |
| `i"` | Inner double quotes |
| `a"` | A double quotes (including quotes) |
| `i'` | Inner single quotes |
| `a'` | A single quotes (including quotes) |
| `i`` | Inner backticks |
| `a`` | A backticks (including backticks) |
| `i(` or `i)` or `ib` | Inner parentheses |
| `a(` or `a)` or `ab` | A parentheses (including parens) |
| `i{` or `i}` or `iB` | Inner curly braces |
| `a{` or `a}` or `aB` | A curly braces (including braces) |
| `i[` or `i]` | Inner square brackets |
| `a[` or `a]` | A square brackets (including brackets) |
| `i<` or `i>` | Inner angle brackets |
| `a<` or `a>` | A angle brackets (including brackets) |
| `it` | Inner HTML/XML tag |
| `at` | A HTML/XML tag (including tags) |

---

## Insert Mode Basics

### Entering Insert Mode
| Shortcut | Description |
|----------|-------------|
| `i` | Insert before cursor |
| `I` | Insert at beginning of line |
| `a` | Insert after cursor (append) |
| `A` | Insert at end of line |
| `o` | Insert new line below and enter insert mode |
| `O` | Insert new line above and enter insert mode |
| `s` | Delete character under cursor and enter insert mode |
| `S` | Delete entire line and enter insert mode |
| `C` | Delete from cursor to end of line and enter insert mode |
| `cc` | Delete entire line and enter insert mode (same as `S`) |
| `cw` | Change word (delete word and enter insert mode) |
| `jk` | **Custom:** Exit insert mode (alternative to `Esc`) |

### In Insert Mode
| Shortcut | Description |
|----------|-------------|
| `Ctrl-h` | Delete character before cursor (backspace) |
| `Ctrl-w` | Delete word before cursor |
| `Ctrl-u` | Delete all characters before cursor on line |
| `Ctrl-t` | Indent current line |
| `Ctrl-d` | Unindent current line |

---

## Visual Mode

### Entering Visual Mode
| Shortcut | Description |
|----------|-------------|
| `v` | Enter character-wise visual mode |
| `V` | Enter line-wise visual mode |
| `Ctrl-v` | Enter block-wise (column) visual mode |
| `gv` | Reselect last visual selection |

### In Visual Mode
| Shortcut | Description |
|----------|-------------|
| `o` | Move to other end of selection |
| `O` | Move to other corner of block (block mode) |
| `>` | Indent selection |
| `<` | Unindent selection |
| `=` | Auto-indent selection |
| `~` | Toggle case of selection |
| `u` | Make selection lowercase |
| `U` | Make selection uppercase |

---

## Copy, Paste & Delete

### Yanking (Copying)
| Shortcut | Description |
|----------|-------------|
| `yy` | Yank (copy) entire line |
| `Y` | Yank from cursor to end of line |
| `yw` | Yank word |
| `yiw` | Yank inner word (without whitespace) |
| `yaw` | Yank a word (with whitespace) |
| `y$` | Yank to end of line |
| `y^` | Yank to start of line |
| `yG` | Yank to end of file |
| `ygg` | Yank to start of file |
| `yi"` | Yank inside double quotes |
| `yi'` | Yank inside single quotes |
| `yi(` | Yank inside parentheses |
| `yi{` | Yank inside braces |
| `yi[` | Yank inside brackets |
| `{visual}y` | Yank selected text (in visual mode) |

### Pasting
| Shortcut | Description |
|----------|-------------|
| `p` | Paste after cursor/line |
| `P` | Paste before cursor/line |
| `gp` | Paste after cursor and move cursor after pasted text |
| `gP` | Paste before cursor and move cursor after pasted text |
| `]p` | Paste after cursor and adjust indentation |
| `[p` | Paste before cursor and adjust indentation |

### Deleting
| Shortcut | Description |
|----------|-------------|
| `x` | Delete character under cursor |
| `X` | Delete character before cursor |
| `dd` | Delete entire line |
| `D` | Delete from cursor to end of line |
| `dw` | Delete word |
| `diw` | Delete inner word |
| `daw` | Delete a word (with whitespace) |
| `d$` | Delete to end of line |
| `d^` | Delete to start of line |
| `dG` | Delete to end of file |
| `dgg` | Delete to start of file |
| `di"` | Delete inside double quotes |
| `di'` | Delete inside single quotes |
| `di(` | Delete inside parentheses |
| `di{` | Delete inside braces |
| `di[` | Delete inside brackets |
| `{visual}d` | Delete selected text (in visual mode) |

### Changing (Delete + Insert)
| Shortcut | Description |
|----------|-------------|
| `cc` | Change entire line |
| `C` | Change from cursor to end of line |
| `cw` | Change word |
| `ciw` | Change inner word |
| `caw` | Change a word (with whitespace) |
| `c$` | Change to end of line |
| `ci"` | Change inside double quotes |
| `ci'` | Change inside single quotes |
| `ci(` | Change inside parentheses |
| `ci{` | Change inside braces |
| `ci[` | Change inside brackets |
| `{visual}c` | Change selected text (in visual mode) |

---

## Search & Replace

### Searching
| Shortcut | Description |
|----------|-------------|
| `/pattern` | Search forward for pattern |
| `?pattern` | Search backward for pattern |
| `n` | Go to next search match |
| `N` | Go to previous search match |
| `*` | Search forward for word under cursor |
| `#` | Search backward for word under cursor |
| `g*` | Search forward for partial word under cursor |
| `g#` | Search backward for partial word under cursor |
| `Space nh` | **Custom:** Clear search highlights |

### Find & Replace
| Shortcut | Description |
|----------|-------------|
| `:s/old/new/` | Replace first occurrence on current line |
| `:s/old/new/g` | Replace all occurrences on current line |
| `:%s/old/new/g` | Replace all occurrences in entire file |
| `:%s/old/new/gc` | Replace all with confirmation |
| `:'<,'>s/old/new/g` | Replace all in visual selection |
| `:1,10s/old/new/g` | Replace all in lines 1-10 |

---

## Navigation & Movement

### File Navigation
| Shortcut | Description |
|----------|-------------|
| `Ctrl-o` | Jump to previous location in jump list |
| `Ctrl-i` | Jump to next location in jump list |
| ``` `` ``` | Jump to last position before jump |
| `'.` | Jump to last modified line |
| `g;` | Jump to previous change |
| `g,` | Jump to next change |

### Mark Navigation
| Shortcut | Description |
|----------|-------------|
| `m{a-z}` | Set local mark (lowercase = buffer-local) |
| `m{A-Z}` | Set global mark (uppercase = across files) |
| `'{a-z}` | Jump to mark (line) |
| `` `{a-z}`` | Jump to mark (exact position) |
| `:marks` | Show all marks |

### Paragraph & Sentence Navigation
| Shortcut | Description |
|----------|-------------|
| `{` | Move to previous paragraph/block |
| `}` | Move to next paragraph/block |
| `(` | Move to previous sentence |
| `)` | Move to next sentence |

---

## Custom Keybindings

### General Custom Shortcuts
| Shortcut | Description | Mode |
|----------|-------------|------|
| `Space` | **Leader key** | Normal |
| `jk` | Exit insert mode | Insert |
| `Space nh` | Clear search highlights | Normal |
| `Space +` | Increment number under cursor | Normal |
| `Space -` | Decrement number under cursor | Normal |

---

## Window & Tab Management

### Window Splits
| Shortcut | Description |
|----------|-------------|
| `Space sv` | Split window vertically |
| `Space sh` | Split window horizontally |
| `Space se` | Make splits equal size |
| `Space sx` | Close current split |
| `Ctrl-w h` | Move to left split |
| `Ctrl-w j` | Move to bottom split |
| `Ctrl-w k` | Move to top split |
| `Ctrl-w l` | Move to right split |
| `Ctrl-w w` | Cycle through windows |
| `Ctrl-w =` | Make all windows equal size |
| `Ctrl-w _` | Maximize current window height |
| `Ctrl-w |` | Maximize current window width |

### Tab Management
| Shortcut | Description |
|----------|-------------|
| `Space to` | Open new tab |
| `Space tx` | Close current tab |
| `Space tn` | Go to next tab |
| `Space tp` | Go to previous tab |
| `Space tf` | Open current buffer in new tab |

---

## File Explorer (nvim-tree)

| Shortcut | Description |
|----------|-------------|
| `Space ee` | Toggle file explorer |
| `Space ef` | Toggle file explorer on current file |
| `Space ec` | Collapse file explorer |
| `Space er` | Refresh file explorer |

### Inside nvim-tree
| Shortcut | Description |
|----------|-------------|
| `a` | Create new file/directory |
| `d` | Delete file/directory |
| `r` | Rename file/directory |
| `x` | Cut file/directory |
| `c` | Copy file/directory |
| `p` | Paste file/directory |
| `y` | Copy name |
| `Y` | Copy relative path |
| `gy` | Copy absolute path |
| `o` | Open file/directory |
| `<CR>` | Open file/directory |
| `<Tab>` | Preview file |
| `R` | Refresh |
| `H` | Toggle hidden files |
| `I` | Toggle gitignore files |
| `-` | Navigate up to parent directory |
| `s` | Open file in vertical split |
| `i` | Open file in horizontal split |
| `t` | Open file in new tab |

---

## Fuzzy Finding (Telescope)

| Shortcut | Description |
|----------|-------------|
| `Space ff` | Find files in current working directory |
| `Space fr` | Find recent files |
| `Space fs` | Find string (live grep) in cwd |
| `Space fc` | Find string under cursor in cwd |
| `Space ft` | Find TODO comments |

### Inside Telescope
| Shortcut | Description | Mode |
|----------|-------------|------|
| `Ctrl-k` | Move to previous result | Insert |
| `Ctrl-j` | Move to next result | Insert |
| `Ctrl-q` | Send selected to quickfix list | Insert |
| `<CR>` | Open selected file | Insert/Normal |
| `Ctrl-x` | Open in horizontal split | Insert/Normal |
| `Ctrl-v` | Open in vertical split | Insert/Normal |
| `Ctrl-t` | Open in new tab | Insert/Normal |
| `Esc` | Close telescope | Insert |

---

## LSP (Language Server)

### Code Navigation
| Shortcut | Description |
|----------|-------------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gt` | Go to type definition |
| `gR` | Show all references |
| `K` | Show hover documentation |

### Code Actions
| Shortcut | Description | Mode |
|----------|-------------|------|
| `Space ca` | Show code actions | Normal/Visual |
| `Space rn` | Smart rename symbol |
| `Space D` | Show buffer diagnostics |
| `Space d` | Show line diagnostics |
| `[d` | Go to previous diagnostic |
| `]d` | Go to next diagnostic |
| `Space rs` | Restart LSP |

---

## Git Integration (Gitsigns)

### Hunk Navigation
| Shortcut | Description |
|----------|-------------|
| `]h` | Next git hunk |
| `[h` | Previous git hunk |

### Hunk Actions
| Shortcut | Description | Mode |
|----------|-------------|------|
| `Space hs` | Stage hunk | Normal/Visual |
| `Space hr` | Reset hunk | Normal/Visual |
| `Space hS` | Stage entire buffer | Normal |
| `Space hR` | Reset entire buffer | Normal |
| `Space hu` | Undo stage hunk | Normal |
| `Space hp` | Preview hunk | Normal |

### Git Blame & Diff
| Shortcut | Description |
|----------|-------------|
| `Space hb` | Blame line (full) |
| `Space hB` | Toggle line blame |
| `Space hd` | Diff this |
| `Space hD` | Diff this ~ |

### Text Object
| Shortcut | Description | Mode |
|----------|-------------|------|
| `ih` | Select hunk (text object) | Operator/Visual |

---

## Code Editing Plugins

### Commenting (Comment.nvim)
Uses default keybindings from Comment.nvim:

| Shortcut | Description | Mode |
|----------|-------------|------|
| `gcc` | Toggle line comment | Normal |
| `gbc` | Toggle block comment | Normal |
| `gc{motion}` | Toggle comment (with motion) | Normal |
| `gc` | Toggle comment on selection | Visual |
| `gb` | Toggle block comment on selection | Visual |

**Examples:**
- `gcap` - Comment a paragraph
- `gc3j` - Comment current line + 3 lines below
- `gcG` - Comment from cursor to end of file

### Surround (nvim-surround)
Uses default keybindings from nvim-surround:

| Shortcut | Description | Mode |
|----------|-------------|------|
| `ys{motion}{char}` | Add surround | Normal |
| `yss{char}` | Surround entire line | Normal |
| `yS{motion}{char}` | Add surround (with newlines) | Normal |
| `ds{char}` | Delete surround | Normal |
| `cs{old}{new}` | Change surround | Normal |
| `S{char}` | Surround selection | Visual |

**Examples:**
- `ysiw"` - Surround word with double quotes
- `yss)` - Surround line with parentheses
- `ds"` - Delete surrounding double quotes
- `cs"'` - Change double quotes to single quotes
- `cs'{` - Change single quotes to braces (with spaces)
- `cs'[` - Change single quotes to brackets

### Substitute (substitute.nvim)
| Shortcut | Description | Mode |
|----------|-------------|------|
| `s{motion}` | Substitute with motion | Normal |
| `ss` | Substitute entire line | Normal |
| `S` | Substitute to end of line | Normal |
| `s` | Substitute selection | Visual |

**Examples:**
- `siw` - Substitute inner word (yanked text replaces word)
- `s$` - Substitute to end of line

---

## Autocompletion

### Completion Menu (nvim-cmp)
| Shortcut | Description | Mode |
|----------|-------------|------|
| `Ctrl-k` | Previous suggestion | Insert |
| `Ctrl-j` | Next suggestion | Insert |
| `Ctrl-b` | Scroll docs up | Insert |
| `Ctrl-f` | Scroll docs down | Insert |
| `Ctrl-Space` | Show completion suggestions | Insert |
| `Ctrl-e` | Abort/close completion | Insert |
| `<CR>` | Confirm selection | Insert |

---

## Other Plugins

### LazyGit
| Shortcut | Description |
|----------|-------------|
| `Space lg` | Open LazyGit |

### TODO Comments
| Shortcut | Description |
|----------|-------------|
| `]t` | Next TODO comment |
| `[t` | Previous TODO comment |

---

## Useful Undo/Redo

| Shortcut | Description |
|----------|-------------|
| `u` | Undo |
| `Ctrl-r` | Redo |
| `U` | Undo all changes on line |

---

## Miscellaneous

### Recording Macros
| Shortcut | Description |
|----------|-------------|
| `q{a-z}` | Start recording macro to register {a-z} |
| `q` | Stop recording macro |
| `@{a-z}` | Execute macro from register {a-z} |
| `@@` | Repeat last executed macro |

### Registers
| Shortcut | Description |
|----------|-------------|
| `"{a-z}y` | Yank to register {a-z} |
| `"{a-z}p` | Paste from register {a-z} |
| `:reg` | Show all registers |
| `"0p` | Paste from yank register (0) |
| `"+y` | Yank to system clipboard |
| `"+p` | Paste from system clipboard |
| `"*y` | Yank to selection clipboard |
| `"*p` | Paste from selection clipboard |

### Command Line
| Shortcut | Description |
|----------|-------------|
| `:` | Enter command-line mode |
| `/` | Search forward |
| `?` | Search backward |
| `Ctrl-p` | Previous command in history |
| `Ctrl-n` | Next command in history |

### Indentation
| Shortcut | Description |
|----------|-------------|
| `>>` | Indent line |
| `<<` | Unindent line |
| `={motion}` | Auto-indent |
| `==` | Auto-indent current line |
| `gg=G` | Auto-indent entire file |

### Joining Lines
| Shortcut | Description |
|----------|-------------|
| `J` | Join current line with next line |
| `gJ` | Join lines without adding space |

### Repeat Commands
| Shortcut | Description |
|----------|-------------|
| `.` | Repeat last change |
| `;` | Repeat last f/t/F/T motion |
| `,` | Repeat last f/t/F/T motion (opposite direction) |

---

## Quick Reference: Common Workflows

### Select and Copy a Word
```
yiw     # Copy inner word (without whitespace)
yaw     # Copy word with whitespace
```

### Select and Copy a Line
```
yy      # Copy entire line
V       # Enter line visual mode, then y to copy
```

### Delete a Line
```
dd      # Delete entire line
dj      # Delete current and next line
dk      # Delete current and previous line
```

### Go to Top/Bottom of File
```
gg      # Go to top
G       # Go to bottom
```

### Move Faster Between Words
```
w       # Next word start
b       # Previous word start
e       # Next word end
5w      # Move 5 words forward
```

### Replace a Word in Current File
```
*       # Search for word under cursor
:%s//new_word/g    # Replace all occurrences
```

### Replace a Word in Selection
```
v       # Visual mode, select text
:s/old/new/g       # Replace in selection
```

### Find and Replace Across Project
```
Space fs    # Telescope live grep to find pattern
# Then use LSP rename or manual find/replace
```

---

## Tips

1. **Use `.` to repeat**: After any change operation, press `.` to repeat it
2. **Combine numbers with motions**: `5j` moves down 5 lines, `3w` moves 3 words forward
3. **Text objects are powerful**: `ci"` changes inside quotes, `da{` deletes around braces
4. **Visual mode for precision**: Use `v` to select visually, then operate
5. **Use marks for long jumps**: `ma` to set mark 'a', `'a` to jump back
6. **System clipboard**: Use `"+y` to copy to system clipboard, `"+p` to paste

---

*This cheat sheet is based on your Neovim configuration from [subhdotsol/Dev-enviroment](https://github.com/subhdotsol/Dev-enviroment)*
