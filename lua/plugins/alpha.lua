local alpha = require('alpha')
local startify = require('alpha.themes.startify')

-- Configure startify theme
startify.file_icons_provider = 'devicons' -- Use nvim-web-devicons for file icons

-- header text
startify.section.header.val = {
  '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
  '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
  '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
  '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
  '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
  '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
}
startify.section.top_buttons.val = {
  startify.button('e', 'New File', ':ene <BAR> startinsert<CR>'),
  startify.button('f', 'Find File', ':Telescope find_files<CR>'),
  startify.button('g', 'Git Status', ':LazyGit<CR>'),
  startify.button('t', 'Terminal', ':ToggleTerm<CR>'),
}

-- Setup alpha with startify config
alpha.setup(startify.config)
