" Automatically source inti.vim on save.
augroup autosource
    autocmd!
    autocmd BufWritePost init.vim source %
augroup END
