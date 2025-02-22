-- Tailwind Tools (completions, utilities)
require('tailwind-tools').setup {
  document_color = {
    enabled = true, -- Show color hints in editor
    kind = 'foreground', -- Can be 'background' too
  },
}

-- Enhance LSP for Tailwind (already using cssls)
local lspconfig = require('lspconfig')
lspconfig.cssls.setup {
  settings = {
    css = {
      validate = true,
      lint = {
        unknownAtRules = 'ignore', -- Avoid Tailwind @apply warnings
      },
    },
  },
}
