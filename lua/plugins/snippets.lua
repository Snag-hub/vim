local ls = require('luasnip')
require('luasnip.loaders.from_lua').load { paths = '~/.config/nvim/lua/snippets/' }

-- Keymap to jump through snippets
vim.keymap.set({ 'i', 's' }, '<C-j>', function()
  if ls.expand_or_jumpable() then ls.expand_or_jump() end
end, { silent = true })
vim.keymap.set({ 'i', 's' }, '<C-k>', function()
  if ls.jumpable(-1) then ls.jump(-1) end
end, { silent = true })
