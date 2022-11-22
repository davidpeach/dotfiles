require 'user.options'
require 'user.keymaps'
require 'user.plugins'
require 'user.lsp'

local colorscheme = "nord"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found")
    return
end

require('lualine').setup({
    options = {
        theme = 'nord'
    }
})

require 'colorizer'.setup()

vim.keymap.set('n', '<leader><leader>x', ':w<cr> :source %<cr>')
