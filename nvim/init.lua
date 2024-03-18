vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.number = false
vim.opt.showmode = true
vim.opt.breakindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.scrolloff = 11
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.wo.signcolumn = "yes:2"
vim.opt.colorcolumn = "118"
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.hlsearch = true
vim.opt.expandtab = true

vim.g.slime_target = "tmux"

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  dev = {
    path = "~/repos/github.com/davidpeach/",
    fallback = false,
  },
})

vim.cmd([[
  au FileType php set makeprg=./vendor/bin/phpstan\ analyse\ --memory-limit=2G\ --no-progress\ --error-format=raw\ --configuration=phpstan.neon
]])

require("config.keymaps")
