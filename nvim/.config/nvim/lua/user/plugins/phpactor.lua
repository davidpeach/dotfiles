vim.cmd([[
  augroup PhpactorMappings
  au!
  au FileType php nmap <buffer> <Leader>pc :PhpactorContextMenu<CR>
  au FileType php nmap <buffer> <Leader>pt :PhpactorTransform<CR>
  au FileType php nmap <buffer> <Leader>pi :PhpactorImportClass<CR>
  augroup END
]])

