require 'user.options'
require 'user.keymaps'
require 'user.plugins'
require 'user.lsp'


local colorscheme = "gruvbox-baby"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found")
    return
end
