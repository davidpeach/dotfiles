require 'user.options'
require 'user.keymaps'
require 'user.plugins'
require 'user.lsp'


local colorscheme = "tokyonight"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found")
    return
end

vim.g.tokyonight_style = "storm"
vim.g.tokyonight_transparent = true

require 'colorizer'.setup()
