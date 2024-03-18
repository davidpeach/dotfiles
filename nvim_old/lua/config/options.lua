-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.cmd([[
  au FileType php set makeprg=./vendor/bin/phpstan\ analyse\ --memory-limit=2G\ --no-progress\ --error-format=raw\ --configuration=phpstan.neon
]])
