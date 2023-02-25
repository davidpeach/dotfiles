vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wildmode = 'longest:full,full'
vim.opt.completeopt = "menuone,longest,preview"

vim.opt.termguicolors = true
vim.opt.spell = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.list = true
vim.opt.listchars = "tab:> ,trail:."

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.clipboard = "unnamedplus"

vim.opt.confirm = true

vim.opt.undofile = true
vim.opt.backup = true
vim.opt.backupdir:remove('.')

vim.opt.fileencoding = "utf-8"
vim.opt.hlsearch = false
vim.opt.swapfile = false
vim.opt.updatetime = 250
vim.opt.signcolumn = "yes:2"
vim.opt.guifont = "monospace:h17"
vim.opt.breakindent = true

vim.cmd [[colorscheme dracula]]
