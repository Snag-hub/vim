require('toggleterm').setup {
  size = 20,
  open_mapping = [[<C-t>]],
  direction = 'float',
  float_opts = { border = 'curved' },
}

-- Custom terminal for project
vim.keymap.set('n', '<leader>td', function()
  local term = require('toggleterm.terminal').Terminal:new {
    cmd = 'dotnet run --project MeplaConfiguratorAPIs.csproj',
    dir = '/home/cinetech/company/mepla/MPC-APIs/',
    direction = 'float',
  }
  term:toggle()
end, { desc = 'Run API in terminal' })
