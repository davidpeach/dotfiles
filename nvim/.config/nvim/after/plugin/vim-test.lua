vim.cmd([[
  let test#php#phpunit#executable = 'docker-compose exec -T mpa php artisan test'
  let test#php#phpunit#options = '--colors=always'
  let g:test#strategy = 'neovim'
]])

vim.keymap.set('n', '<Leader>tn', ':TestNearest<CR>', { silent = false })
vim.keymap.set('n', '<Leader>tf', ':TestFile<CR>', { silent = false })
vim.keymap.set('n', '<Leader>ts', ':TestSuite<CR>', { silent = false })
vim.keymap.set('n', '<Leader>tl', ':TestLast<CR>', { silent = false })
vim.keymap.set('n', '<Leader>tv', ':TestVisit<CR>', { silent = false })

