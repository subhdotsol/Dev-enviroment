return {
  -- Shale - Clean, dark theme based on shale rocks
  {
    "smit4k/shale.nvim",
    lazy = true,
  },

  -- ACTIVE THEME: Gruvbox (currently enabled)
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("gruvbox").setup({
        overrides = {
          Comment = { italic = true, fg = "#928374" },
        },
      })
      vim.o.background = "dark"
      vim.cmd.colorscheme("gruvbox")
    end,
  },
}
