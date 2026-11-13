local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
  -- `Lazy restore` doesn't pin lazy.nvim itself, so check out the locked commit
  -- here; otherwise a fresh install rewrites lazy-lock.json with upstream HEAD.
  local ok, lock = pcall(function()
    local lines = vim.fn.readfile(vim.fn.stdpath("config") .. "/lazy-lock.json")
    return vim.json.decode(table.concat(lines, "\n"))
  end)
  local commit = ok and lock["lazy.nvim"] and lock["lazy.nvim"].commit
  if commit then
    vim.fn.system({ "git", "-C", lazypath, "checkout", "--quiet", commit })
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "subh.plugins" }, { import = "subh.plugins.lsp" } }, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
      },
    },
  },
})
