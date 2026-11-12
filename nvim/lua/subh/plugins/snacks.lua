return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    local Snacks = require("snacks")
    Snacks.setup({
      dashboard = {
        enabled = true,
        preset = {
          keys = {
            { icon = " ", key = "e", desc = "New File", action = ":ene" },
            { icon = "󰱼 ", key = "f", desc = "Find File", action = ":Telescope find_files" },
            { icon = " ", key = "g", desc = "Find Word", action = ":Telescope live_grep" },
            { icon = "󰁯 ", key = "s", desc = "Restore Session", action = ":AutoSession restore" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
          header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      },
      terminal = {
        enabled = true,
        win = {
          border = "rounded",
        },
      },
    })

    -- Float terminal (Ctrl+T to toggle, works in normal and terminal mode)
    vim.keymap.set({ "n", "t" }, "<C-t>", function()
      Snacks.terminal.toggle()
    end, { desc = "Toggle Terminal" })

    vim.keymap.set("n", "<leader>tt", function()
      Snacks.terminal.toggle()
    end, { desc = "Toggle float terminal" })

    -- Horizontal terminal
    vim.keymap.set("n", "<leader>th", function()
      vim.cmd("botright 15split | terminal")
    end, { desc = "Open horizontal terminal" })

    -- Vertical terminal
    vim.keymap.set("n", "<leader>tv", function()
      vim.cmd("botright vsplit | terminal")
      vim.cmd("vertical resize " .. math.floor(vim.o.columns * 0.4))
    end, { desc = "Open vertical terminal" })

    -- Terminal mode keymaps (esc, jk, window navigation)
    vim.api.nvim_create_autocmd("TermOpen", {
      callback = function()
        local opts = { buffer = 0 }
        vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
        vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
        vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
      end,
    })
  end,
}
