return {
  "mason-org/mason.nvim",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- enable mason and configure icons
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "prettier",
        "stylua",
        "eslint_d",
      },
    })
  end,
}
