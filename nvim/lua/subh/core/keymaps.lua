-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Jump to the end of line in insert mode --
keymap.set("i", ",,", "<Esc>A", { noremap = true })

-- For LSP docs --
vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, { noremap = true, silent = true })
-- Show hover docs
vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- For colour themes (loads all lazy colorscheme plugins first so they appear in the picker)
vim.keymap.set("n", "<leader>th", function()
  -- Load all lazy-loaded colorscheme plugins so they show up in Telescope
  for _, plugin in ipairs(require("lazy").plugins()) do
    if
      plugin.name
      and (
        plugin.name:match("tokyonight")
        or plugin.name:match("catppuccin")
        or plugin.name:match("rose%-pine")
        or plugin.name:match("kanagawa")
        or plugin.name:match("gruvbox")
        or plugin.name:match("sonokai")
        or plugin.name:match("nord")
        or plugin.name:match("nightfox")
        or plugin.name:match("tokyodark")
        or plugin.name:match("shale")
      )
    then
      require("lazy").load({ plugins = { plugin.name } })
    end
  end
  -- Open Telescope colorscheme picker with live preview
  require("telescope.builtin").colorscheme({ enable_preview = true })
end, { desc = "Pick theme" })
