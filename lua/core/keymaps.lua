local map = vim.keymap.set

-- File explorer
map('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })

-- Telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { desc = 'Find files' })
map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { desc = 'Live grep' })
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { desc = 'Find buffers' })

-- Code actions and imports (LSP-dependent, set in lsp.lua too)
map('n', '<leader>ai', function()
    vim.lsp.buf.code_action { context = { only = { 'source.organizeImports' } }, apply = true }
end, { desc = 'Organize imports' })

-- Buffer navigation
map('n', '<leader>bn', ':bnext<CR>', { desc = 'Next buffer' })
map('n', '<leader>bp', ':bprev<CR>', { desc = 'Previous buffer' })
map('n', '<leader>bd', ':bdelete<CR>', { desc = 'Delete buffer' })

-- Window management
map('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Move to bottom window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Move to top window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })

-- Tailwind
map('n', '<leader>ts', ':TailwindSort<CR>', { desc = 'Sort Tailwind classes' })
-- LazyGit
map('n', '<leader>gg', ':LazyGit<CR>', { desc = 'Open LazyGit' })
