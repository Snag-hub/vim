require('conform').setup {
  formatters_by_ft = {
    javascript = { 'prettier' },
    typescript = { 'prettier' },
    typescriptreact = { 'prettier' },
    cs = { 'csharpier' },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

-- Keymap
vim.keymap.set('n', '<leader>F', function()
  require('conform').format { async = true, lsp_fallback = true }
end, { desc = 'Format file' })
