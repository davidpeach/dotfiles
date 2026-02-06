vim.pack.add({'https://github.com/lewis6991/hover.nvim'})

require('hover').config({
  --- @type (string|Hover.Config.Provider)[]
  providers = {
    'hover.providers.diagnostic',
    'hover.providers.lsp',
    'hover.providers.dictionary',
  },
  preview_opts = {
    border = 'single'
  },
  preview_window = false,
  title = true,
  mouse_providers = {},
  mouse_delay = 1000
})

vim.keymap.set('n', 'K', function()
  require('hover').open()
end, { desc = 'hover.nvim (open)' })

vim.keymap.set('n', 'gK', function()
  require('hover').enter()
end, { desc = 'hover.nvim (enter)' })
