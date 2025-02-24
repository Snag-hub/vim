require('auto-session').setup {
  log_level = 'error',
  auto_session_root_dir = vim.fn.stdpath('data') .. '/sessions/',
  auto_save_enabled = true,
  auto_restore_enabled = true,
}

vim.keymap.set('n', '<leader>sr', ':SessionRestore<CR>', { desc = 'Restore session' })
vim.keymap.set('n', '<leader>ss', ':SessionSave<CR>', { desc = 'Save session' })
