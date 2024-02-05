set nocompatible    " Don't let VIM be VI-compatible

" VI settings. Copy these to ~/.exrc if using `vi`
set autoindent		"auto-indent new lines.
set autowrite		"auto-save when switching to other open files.
set noerrorbells    " Disable error bells when error occurs
set nonumber        " Trying with no numbers.
set ignorecase      " Ignore case when doing search
set shiftwidth=4    " Number of spaces to insert when indenting.
set showmode		"show current mode in bottom left.
set tabstop=4       " Number of spaces to insert when pressing <TAB>

" VIM settings
filetype plugin on
let mapleader=" "

au FileType php set makeprg=./vendor/bin/phpstan\ analyse\ --memory-limit=2G\ --no-progress\ --error-format=raw\ --configuration=phpstan.neon
" File: path/to/file.php, line: 12, error: error message
" au FileType php set efm=File%.\ %f%.\ line%.\ %l%.\ error%.\ %m
" au FileType php set efm=line%.
" au FileType php set efm+=%-G " Ignore empty lines

set expandtab
set foldmethod=manual
set hidden                  "Allow changing files without having to save.
set history=100             "Set command history.
set nohlsearch
set incsearch
set linebreak
set nobackup
set nofoldenable
set noswapfile
set nowrap
set nowritebackup
set path+=**            "Search inside folders recursively.
set ruler           " Show the line and column position in bottom right.
set scrolloff=8
set shortmess=aoOtTI        "Disable many of the 'hit enter' messages.
set signcolumn=no
set smartindent
set smarttab
set softtabstop=4
set spc=                "No Spellcheck.
set splitbelow
set splitright
set termguicolors
set textwidth=120	    "Max 120 character wide.
set undodir=~/.vim/undovim
set undofile
set updatetime=250
set viminfo='20,<1000,s1000 "Remember certain histories to pick up where left off.
set wildignore+=**/node_modules/**
set wildmenu            "Better tab completion for commands
set wrapscan                "Wrap round when searching

match IncSearch '\s\+$'
syntax enable

let g:netrw_banner=0
let g:ale_enabled = 0
let g:ale_completion_enabled = 1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_keep_list_window_open = 1
let g:ale_lint_on_save = 0
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_insert_leave = 0

call plug#begin("~/.local/share/vim/plugins")
Plug 'sheerun/vim-polyglot' " Code highlighting for many languages/filetypes.
Plug 'tpope/vim-fugitive'   " Excellent tool for working with git-related things.
Plug 'tpope/vim-commentary' " Easy code commenting. I should probably switch for a shell script.
Plug 'tpope/vim-dadbod'     " The only decent, working terminal db client i have found.
Plug 'kristijanhusak/vim-dadbod-ui'     " UI for the db client.
Plug 'christoomey/vim-tmux-navigator'   " Enable easy movement between vim and Tmux.
Plug 'morhetz/gruvbox'      " Theme.
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
call plug#end()

colorscheme gruvbox
set background=dark

nnoremap <Leader>go :Git<CR>
nnoremap <Leader>gg :Git 
nnoremap <Leader>gp :Git push
nnoremap <Leader>gu :Git pull
nnoremap <Leader>gl :Git log 
nnoremap <Leader>gc :Git checkout 
nnoremap <Leader>gm :Git merge 
nnoremap <Leader>gd :Git diff x --name-only

nnoremap <Leader>o :Explore<CR>
nnoremap <Leader>r :bufdo :bdelete<CR>:Explore<CR>:echo "All buffers closed."<CR>

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-c> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
endfunction
augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
