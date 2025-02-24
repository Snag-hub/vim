local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('cs', {
  s('api', {
    t({ '[HttpGet]', '' }),
    t('public IActionResult Get'),
    i(1, 'Name'),
    t({ '() {', '\t' }),
    i(2, '// Logic here'),
    t({ '', '\treturn Ok();', '}' }),
  }),
})
