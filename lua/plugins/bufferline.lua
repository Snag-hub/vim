require('bufferline').setup {
  options = {
    mode = 'buffers',
    diagnostics = 'nvim_lsp',
    offsets = { { filetype = 'NvimTree', text = 'File Explorer', padding = 1 } },
    separator_style = 'slant',
  },
}
