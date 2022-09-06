vim.cmd([[
  augroup PhpactorMappings
  au!
  au FileType php nmap <buffer> <Leader>pc :PhpactorContextMenu<CR>
  augroup END
]])

