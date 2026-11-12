return {
  "ej-shafran/compile-mode.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "m00qek/baleia.nvim" },
  cmd = { "Compile", "Recompile" },
  keys = {
    {
      "<leader>cc",
      function()
        require("subh.configs.compile-mode").compile()
      end,
      desc = "Compile (prompts for command)",
    },
    {
      "<leader>ch",
      function()
        require("subh.configs.compile-mode").history()
      end,
      desc = "Compile history picker",
    },
    { "<leader>cr", "<cmd>Recompile<cr>", desc = "Recompile last command" },
  },
  config = function()
    require("subh.configs.compile-mode").setup()
  end,
}
