require 'user.options'
require 'user.keymaps'
require 'user.plugins'
require 'user.lsp'


local colorscheme = "dracula"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found")
    return
end

require('lualine').setup({
    options = {
        theme = 'dracula-nvim'
    }
})

require 'colorizer'.setup()

-- MOVE MOVE
P = function (v)
    print(vim.inspect(v))
    return v
end

vim.keymap.set('n', '<leader><leader>x', ':w<cr> :source %<cr>')
