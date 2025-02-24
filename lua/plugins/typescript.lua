local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('typescript', {
  s('rfc', {
    t('export function '),
    i(1, 'Component'),
    t({ '() {', '\treturn (' }),
    t({ '', '\t\t<div>' }),
    i(2, 'Content'),
    t({ '</div>', '\t);', '}' }),
  }),
})
