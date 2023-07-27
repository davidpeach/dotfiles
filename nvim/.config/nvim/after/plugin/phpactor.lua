-- vim.cmd([[
--   augroup PhpactorMappings
--     au!
--     au FileType php nmap <buffer> ,pc :PhpactorContextMenu<CR>
--     au FileType php nmap <buffer> ,pt :PhpactorTransform<CR>
--     au FileType php nmap <buffer> ,pi :PhpactorImportClass<CR>

--     au FileType php xmap <buffer> ,px :PhpactorExtractExpression<CR>
--   augroup END
-- ]])
