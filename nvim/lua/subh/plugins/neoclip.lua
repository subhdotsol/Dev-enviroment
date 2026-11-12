return {
  "AckslD/nvim-neoclip.lua",
  dependencies = { "nvim-telescope/telescope.nvim" },
  event = "VeryLazy",
  config = function()
    require("neoclip").setup()
    require("telescope").load_extension("neoclip")
  end,
  keys = {
    { "<leader>fy", "<cmd>Telescope neoclip<cr>", desc = "Yank history" },
  },
}
