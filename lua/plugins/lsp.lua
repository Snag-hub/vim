local lspconfig = require('lspconfig')
local cmp = require('cmp')

-- Capabilities for LSP (used by nvim-cmp)
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Mason setup
require('mason').setup()
require('mason-lspconfig').setup {
  ensure_installed = { 'omnisharp', 'ts_ls', 'html', 'cssls', 'jsonls' },
  handlers = {
    function(server_name) -- Default handler
      lspconfig[server_name].setup {
        capabilities = capabilities,
      }
    end,
    ['omnisharp'] = function()
      lspconfig.omnisharp.setup {
        capabilities = capabilities,
        cmd = { 'omnisharp', '--languageserver', '--hostPID', tostring(vim.fn.getpid()) },
        root_dir = lspconfig.util.root_pattern('*.csproj', '*.sln'),
        settings = {
          FormattingOptions = {
            OrganizeImports = true, -- Enable auto-imports on format
          },
        },
      }
    end,
    ['ts_ls'] = function()
      lspconfig.ts_ls.setup {
        capabilities = capabilities,
        root_dir = lspconfig.util.root_pattern('package.json', 'tsconfig.json', '.git'),
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = 'all',
              includeInlayFunctionLikeReturnTypeHints = true,
            },
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = 'all',
              includeInlayFunctionLikeReturnTypeHints = true,
            },
          },
        },
      }
    end,
  },
}

-- Autocompletion with nvim-cmp
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm { select = true },
    ['<Tab>'] = cmp.mapping.select_next_item(), -- Navigate suggestions
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  }),
}

-- LSP keymaps (set after LSP attaches to buffer)
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)         -- Go to definition
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)     -- Go to implementation
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)         -- Find references
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)               -- Hover docs
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)-- Code actions
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)     -- Rename symbol
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts) -- Format file
  end,
})
