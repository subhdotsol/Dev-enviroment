vim.filetype.add({ extension = { goose = 'goose' } })
vim.lsp.config('goose', {
  cmd = { 'goose', 'lsp' },
  filetypes = { 'goose' },
  root_markers = { '.git' },
})
vim.lsp.enable('goose')
