return {
  -- ACTIVE THEME: TokyoNight (currently enabled)
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      local bg = "#011628"
      local bg_dark = "#011423"
      local bg_highlight = "#143652"
      local bg_search = "#0A64AC"
      local bg_visual = "#275378"
      local fg = "#CBE0F0"
      local fg_dark = "#B4D0E9"
      local fg_gutter = "#627E97"
      local border = "#547998"

      require("tokyonight").setup({
        style = "night", -- options: storm, moon, night, day
        on_colors = function(colors)
          colors.bg = bg
          colors.bg_dark = bg_dark
          colors.bg_float = bg_dark
          colors.bg_highlight = bg_highlight
          colors.bg_popup = bg_dark
          colors.bg_search = bg_search
          colors.bg_sidebar = bg_dark
          colors.bg_statusline = bg_dark
          colors.bg_visual = bg_visual
          colors.border = border
          colors.fg = fg
          colors.fg_dark = fg_dark
          colors.fg_float = fg
          colors.fg_gutter = fg_gutter
          colors.fg_sidebar = fg_dark
        end,
      })
      vim.cmd([[colorscheme tokyonight]])
    end,
  },

  -- OTHER THEMES (lazy loaded, won't activate unless you switch to them)

  -- Catppuccin - Pastel theme with great contrast
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      transparent_background = false,
    },
  },

  -- Rose Pine - Elegant and minimal
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    opts = {
      variant = "moon", -- main, moon, dawn
    },
  },

  -- Kanagawa - Inspired by Japanese art
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    opts = {
      theme = "wave", -- wave, dragon, lotus
    },
  },

  -- Gruvbox - Classic retro theme
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    opts = {
      contrast = "hard", -- soft, medium, hard
    },
  },

  -- Sonokai - High contrast theme
  {
    "sainnhe/sonokai",
    lazy = true,
    config = function()
      vim.g.sonokai_transparent_background = "1"
      vim.g.sonokai_enable_italic = "1"
      vim.g.sonokai_style = "andromeda" -- default, atlantis, andromeda, shusia, maia, espresso
    end,
  },

  -- Nord - Cool Arctic blue theme
  {
    "shaunsingh/nord.nvim",
    lazy = true,
  },

  -- Nightfox - Collection of beautiful themes
  {
    "EdenEast/nightfox.nvim",
    lazy = true,
  },

   -- TokyoDark - Dark variant of Tokyo theme (NEW!)
  {
    "tiagovla/tokyodark.nvim",
    lazy = true,
    opts = {
      transparent_background = false,
      gamma = 1.00,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
      },
    },
  },
}