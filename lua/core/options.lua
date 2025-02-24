local opt = vim.opt

-- Appearance
opt.number = true
opt.relativenumber = true
opt.signcolumn = 'yes'       -- Always show sign column for LSP/git
opt.cursorline = true        -- Highlight current line
opt.termguicolors = true     -- True color support

-- Editing
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false             -- No line wrapping

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- Performance (WSL tweaks)
opt.updatetime = 250
opt.timeoutlen = 500

-- Clipboard (WSL integration)
opt.clipboard = 'unnamedplus'

-- Mouse and Undo
opt.mouse = 'a'              -- Enable mouse in all modes
opt.undofile = true          -- Persistent undo
opt.undodir = vim.fn.stdpath('data') .. '/undo'
