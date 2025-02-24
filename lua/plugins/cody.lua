require('sg').setup {
  enable_cody = true, -- Enable Cody AI
  -- Optional: Customize Cody settings
  cody = {
    -- Add your Sourcegraph token here (or use environment variables SRC_ACCESS_TOKEN and SRC_ENDPOINT)
    -- token = "your-sourcegraph-token",
    completions = {
      enabled = true, -- Enable code completions
    },
  },
}

-- Keymaps for Cody
vim.keymap.set('n', '<leader>cc', ':CodyChat<CR>', { desc = 'Open Cody Chat' })
vim.keymap.set('n', '<leader>ca', ':CodyAsk<CR>', { desc = 'Ask Cody a question' })
vim.keymap.set('v', '<leader>ce', ':CodyExplain<CR>', { desc = 'Explain selected code' })
