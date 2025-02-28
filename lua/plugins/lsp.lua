-- LSP and CMP Config
local lspconfig = require('lspconfig')
local cmp = require('cmp')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local default_on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>f", function()
    require("conform").format({ async = true, lsp_fallback = true })
  end, opts)
end

local omnisharp_on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  local omnisharp_extended = require("omnisharp_extended")
  vim.keymap.set("n", "gd", omnisharp_extended.lsp_definition, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>f", function()
    require("conform").format({ async = true, lsp_fallback = true })
  end, opts)
end

require('mason').setup()
require('mason-lspconfig').setup {
  ensure_installed = { 'ts_ls', 'html', 'cssls', 'jsonls' },
  handlers = {
    function(server_name)
      lspconfig[server_name].setup {
        capabilities = capabilities,
        on_attach = default_on_attach,
      }
    end,
    ['ts_ls'] = function()
      lspconfig.ts_ls.setup {
        capabilities = capabilities,
        on_attach = default_on_attach,
        root_dir = lspconfig.util.root_pattern('package.json', 'tsconfig.json', '.git'),
        settings = {
          typescript = { inlayHints = { includeInlayParameterNameHints = 'all', includeInlayFunctionLikeReturnTypeHints = true } },
          javascript = { inlayHints = { includeInlayParameterNameHints = 'all', includeInlayFunctionLikeReturnTypeHints = true } },
        },
      }
    end,
  },
}

lspconfig.omnisharp.setup {
  -- home/username depends on the wsl or system your on
  cmd = { "dotnet", "/home/cinetech3/omnisharp/OmniSharp.dll", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern("*.csproj", "*.sln"),
  settings = {
    FormattingOptions = { EnableEditorConfigSupport = true, OrganizeImports = true },
    Sdk = { IncludePrereleases = true },
  },
  on_attach = omnisharp_on_attach,
}

cmp.setup {
  snippet = {
    expand = function(args) require('luasnip').lsp_expand(args.body) end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm { select = true },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require('luasnip').expand_or_jumpable() then
        require('luasnip').expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require('luasnip').jumpable(-1) then
        require('luasnip').jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  }),
}

-- Indent Blankline Configuration (Add here)
require("ibl").setup {
  indent = {
    char = "│", -- Vertical line character
    tab_char = "│",
  },
  scope = {
    enabled = true,
    show_start = true,
    show_end = true,
    highlight = { "Function", "Label" }, -- Colors for scope
  },
  exclude = {
    filetypes = { "help", "dashboard", "packer", "NvimTree" }, -- Exclude non-code buffers
  },
}

require("luasnip.loaders.from_vscode").lazy_load() -- Already present
