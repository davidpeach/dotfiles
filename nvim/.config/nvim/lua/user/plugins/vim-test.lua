vim.cmd([[
  let test#php#phpunit#executable = 'docker-compose exec -T mpa php artisan test'
  let test#php#phpunit#options = '--colors=always'
  let g:test#strategy = 'neovim'
]])
