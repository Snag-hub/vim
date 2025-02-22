require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'c_sharp', 'javascript', 'typescript', 'tsx', 'html', 'css', 'json', 'lua', 'markdown', 'vimdoc'
  },
  sync_install = false, -- Install asynchronously
  auto_install = true,  -- Auto-install missing parsers when opening files

  -- Highlighting
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false, -- Avoid conflicts with Treesitter
  },

  -- Indentation
  indent = {
    enable = true,
  },

  -- Incremental selection (e.g., expand selection with keymaps)
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<C-n>',    -- Start selection
      node_incremental = '<C-n>',  -- Expand to next node
      scope_incremental = '<C-s>', -- Expand to scope
      node_decremental = '<C-p>',  -- Shrink selection
    },
  },

  -- Text objects (e.g., select functions, classes)
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Jump to next match if cursor isn’t on one
      keymaps = {
        ['af'] = '@function.outer',  -- Select around function
        ['if'] = '@function.inner',  -- Select inside function
        ['ac'] = '@class.outer',     -- Select around class
        ['ic'] = '@class.inner',     -- Select inside classgg
        ['ab'] = '@block.outer',     -- Select around block
        ['ib'] = '@block.inner',     -- Select inside block
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- Add to jumplist
      goto_next_start = {
        [']m'] = '@function.outer', -- Jump to next function start
        [']c'] = '@class.outer',    -- Jump to next class start
      },
      goto_previous_start = {
        ['[m'] = '@function.outer', -- Jump to previous function start
        ['[c'] = '@class.outer',    -- Jump to previous class start
      },
    },
  },
}

-- Optional: Add Treesitter-based folding
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = false -- Start unfolded, toggle with `zc`/`zo`
