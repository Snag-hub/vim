local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- Git plugins
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
    { 'lewis6991/gitsigns.nvim', opts = {} },

    -- Telescope
    { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },

    -- Treesitter
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    { 'nvim-treesitter/nvim-treesitter-textobjects', dependencies = { 'nvim-treesitter/nvim-treesitter' } },

    -- LSP and completion
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
        },
    },

    -- Utilities
    { 'windwp/nvim-autopairs', opts = {} },
    { 'NvChad/nvim-colorizer.lua', opts = {} },

    -- File explorer
    { 'nvim-tree/nvim-tree.lua', dependencies = { 'nvim-tree/nvim-web-devicons' } },

    -- Theme
    { 'folke/tokyonight.nvim', opts = { style = 'night' } },

    -- Dap Debugging
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'nvim-neotest/nvim-nio',
            'rcarriga/nvim-dap-ui',         -- UI for DAP
            'williamboman/mason.nvim',      -- For installing debug adapters
            'jay-babu/mason-nvim-dap.nvim', -- Bridges Mason and DAP
            'theHamsta/nvim-dap-virtual-text', -- Inline debug info
        },
    },
    { 'luckasRanarison/tailwind-tools.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter' } 
    }, 
}, {})

-- Load plugin-specific configs
require('plugins.lsp')
require('plugins.treesitter')
require('plugins.telescope')
require('plugins.nvimtree')
require('plugins.theme')
require('plugins.dap')
require('plugins.tailwind')
