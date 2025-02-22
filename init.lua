-- ~/.config/nvim/init.lua
vim.g.mapleader = ' '  -- Set leader key early
vim.g.maplocalleader = ' '

-- Load core settings
require('core.options')
require('core.keymaps')

-- Load plugins via Lazy.nvim
require('plugins')
