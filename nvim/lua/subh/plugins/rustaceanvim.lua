return {
  "mrcjkb/rustaceanvim",
  version = "^9",
  ft = { "rust" },
  dependencies = "neovim/nvim-lspconfig",
  config = function()
    vim.g.rustaceanvim = {
      server = {
        on_attach = function(_, bufnr)
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            checkOnSave = true,
            check = { command = "clippy" },
            inlayHints = {
              bindingModeHints = { enable = true },
              chainingHints = { enable = true },
              closingBraceHints = { enable = true },
              parameterHints = { enable = true },
              typeHints = { enable = true },
            },
          },
        },
      },
      dap = {},
      tools = {
        enable_clippy = true,
      },
    }
  end,
}
