require 'user.options'
require 'user.keymaps'
require 'user.plugins'
require 'user.cmp'
require 'user.lsp'
require 'user.telescope'

local colorscheme = "gruvbox-baby"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found")
    return
end

--vim.cmd([[
--  augroup PhpactorMappings
--    au!
--    au FileType php nmap <buffer> <Leader>mm :PhpactorContextMenu<CR>
--  augroup END
--]])
