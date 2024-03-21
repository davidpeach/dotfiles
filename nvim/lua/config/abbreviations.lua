vim.cmd([[
:autocmd FileType r       :iabbrev <buffer> jfj %>%
:autocmd FileType php     :iabbrev rget Route::get(
:autocmd FileType php     :iabbrev rpost Route::post(
:autocmd FileType php     :iabbrev rpat Route::patch(
:autocmd FileType php     :iabbrev rdel Route::delete(
]])
