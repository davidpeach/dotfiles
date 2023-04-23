" David Peach's Vim configuration.

set nocompatible
set number
set relativenumber
set autoindent
set autowrite
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent
set smarttab

" Lets try and keep plugins to a minimum.
call plug#begin()

Plug 'sheerun/vim-polyglot' " Code highlighting for many languages/filetypes
Plug 'junegunn/fzf.vim' " Project search

call plug#end()

"autocmd BufWritePost *.md silent !toemoji %
