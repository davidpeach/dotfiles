vim.cmd([[
  let test#php#phpunit#options = '--colors=always'
  let g:test#strategy = 'vtr'
  let test#vtr#orientation = "h"
  let g:test#echo_command = 0
]])

-- Move into cmd above for work.
-- let test#php#phpunit#executable = 'docker-compose exec -T mpa php artisan test'

vim.keymap.set('n', ',n', ':TestNearest<CR>', { silent = false })
vim.keymap.set('n', ',f', ':TestFile<CR>', { silent = false })
vim.keymap.set('n', ',s', ':TestSuite<CR>', { silent = false })
vim.keymap.set('n', ',l', ':TestLast<CR>', { silent = false })
vim.keymap.set('n', ',v', ':TestVisit<CR>', { silent = false })

