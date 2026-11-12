return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = false,
          next = false,
          prev = false,
          dismiss = false,
        },
      },
      panel = { enabled = false },
    })

    vim.keymap.set("i", "<C-g>", function()
      require("copilot.suggestion").next()
    end, { desc = "Copilot next suggestion" })

    vim.keymap.set("i", "<C-l>", function()
      require("copilot.suggestion").accept()
    end, { desc = "Copilot accept suggestion" })

    vim.keymap.set("i", "<C-x>", function()
      require("copilot.suggestion").dismiss()
    end, { desc = "Copilot dismiss suggestion" })
  end,
}
