require 'user.options'
require 'user.keymaps'
require 'user.plugins'
require 'user.cmp'
require 'user.lsp'
require 'user.telescope'
-- require 'user.autopairs'
require 'user.gitsigns'
require 'user.bufferline'
require 'user.toggleterm'
require 'user.nvimtree'
require 'user.dashboard'
require 'user.vim-test'

local colorscheme = "gruvbox-baby"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found")
    return
end

vim.cmd([[
  augroup PhpactorMappings
    au!
    au FileType php nmap <buffer> <Leader>mm :PhpactorContextMenu<CR>
  augroup END
]])

vim.g.floaterm_gitcommit='floaterm'
vim.g.floaterm_autoinsert=1
vim.g.floaterm_width=0.8
vim.g.floaterm_height=0.8
vim.g.floaterm_wintitle=0
