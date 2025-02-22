local dap = require('dap')
local dapui = require('dapui')

-- Setup DAP UI
dapui.setup()

-- Virtual text
require('nvim-dap-virtual-text').setup {}

-- Mason DAP
require('mason-nvim-dap').setup {
    ensure_installed = { 'codelldb', 'js-debug-adapter' },
}

-- C# (codelldb adapter)
dap.adapters.codelldb = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'codelldb',
    args = { '--port', '${port}' },
  },
}

dap.configurations.cs = {
  {
    type = 'codelldb',
    request = 'launch',
    name = 'Launch ASP.NET Core API',
    program = 'dotnet',
    args = { 'run', '--project', '/home/cinetech/company/mepla/MPC-APIs/MeplaConfiguratorAPIs.csproj' },
    cwd = '/home/cinetech/company/mepla/MPC-APIs/',
    console = 'internalConsole',
  },
}

-- TypeScript/JavaScript (unchanged)
dap.adapters.node = {
    type = 'executable',
    command = 'node',
    args = { vim.fn.stdpath 'data' .. '/mason/packages/js-debug-adapter/js-debug-adapter' },
}
dap.configurations.typescript = {
    {
        type = 'node',
        request = 'launch',
        name = 'Launch file',
        program = '${file}',
        cwd = '${workspaceFolder}',
    },
    {
        type = 'node',
        request = 'attach',
        name = 'Attach to process',
        processId = require('dap.utils').pick_process,
        cwd = '${workspaceFolder}',
    },
}

-- DAP UI auto-open/close (unchanged)
dap.listeners.after.event_initialized['dapui_config'] = function()
    dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
    dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
    dapui.close()
end

-- Keymaps for debugging (unchanged)
vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Continue' })
vim.keymap.set('n', '<F10>', dap.step_over, { desc = 'Debug: Step Over' })
vim.keymap.set('n', '<F11>', dap.step_into, { desc = 'Debug: Step Into' })
vim.keymap.set('n', '<F12>', dap.step_out, { desc = 'Debug: Step Out' })
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
vim.keymap.set('n', '<leader>B', function()
    dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end, { desc = 'Debug: Conditional Breakpoint' })
vim.keymap.set('n', '<leader>dr', dap.repl.open, { desc = 'Debug: Open REPL' })
