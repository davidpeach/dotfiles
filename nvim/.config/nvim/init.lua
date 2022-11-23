require 'user.options'
require 'user.keymaps'
require 'user.plugins'

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

vim.keymap.set("n", "<leader>db", [[ :DBUIToggle<cr> ]])
vim.keymap.set('n', '<leader><leader>x', ':w<cr> :source %<cr>')
vim.keymap.set("n", "<leader><leader>r", ":enew<cr>:set ft=rest<cr>");
