require('project_nvim').setup {
  detection_methods = { 'pattern' },
  patterns = { '.git', '*.csproj', 'package.json' },
}
require('telescope').load_extension('projects')

-- Keymap
vim.keymap.set('n', '<leader>fp', ':Telescope projects<CR>', { desc = 'Find projects' })
