return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main", -- `master` is frozen and does not support Nvim 0.12
    lazy = false, -- main branch does not support lazy-loading
    build = ":TSUpdate",
    config = function()
      -- ensure these language parsers are installed (async, no-op when present)
      require("nvim-treesitter").install({
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "prisma",
        "markdown",
        "markdown_inline",
        "svelte",
        "graphql",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "query",
        "vimdoc",
        "c",
        "rust",
        "toml",
      })

      -- highlighting + indentation for every buffer that has a parser
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(args.match)
          if not lang or not pcall(vim.treesitter.start, args.buf, lang) then
            return
          end
          if vim.treesitter.query.get(lang, "indents") then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })

      -- incremental selection (built into Nvim 0.12 as `an` / `in` in visual mode)
      vim.keymap.set("n", "<C-space>", "van", { remap = true, desc = "Start treesitter selection" })
      vim.keymap.set("x", "<C-space>", "an", { remap = true, desc = "Expand treesitter selection" })
      vim.keymap.set("x", "<bs>", "in", { remap = true, desc = "Shrink treesitter selection" })
    end,
  },

  -- auto close/rename html & jsx tags
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
}
