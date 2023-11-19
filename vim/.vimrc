set nocompatible    " Don't let VIM be VI-compatible

" VI settings.
" Copy these to ~/.exrc if using `vi`
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

let test#php#pest#options = '--colors=always'
let g:test#strategy = 'vtr'
let g:test#strategy = 'vtr'
let test#vtr#orientation = 'h'
let g:test#echo_command = 0
let test#php#pest#executable = 'docker compose exec -T inventory-php-fpm php artisan test'
let g:VtrOrientation = 'h'  " Which direction to create tmux pane (for vim-test runner).
let g:VtrClearSequence = '' " The characters that vim tmux test runner will use to clear the pane when running next test.
let g:VtrPercentage = 35 " Percentage width of the tmux window that opens with running test.
let g:vrc_trigger = '<C-c>' " Not sure how this is effecting things right now :grimacing:


call plug#begin("~/.local/share/vim/plugins")
Plug 'sheerun/vim-polyglot' " Code highlighting for many languages/filetypes.
Plug 'tpope/vim-fugitive'   " Excellent tool for working with git-related things.
Plug 'tpope/vim-commentary' " Easy code commenting. I should probably switch for a shell script.
Plug 'tpope/vim-dadbod'     " The only decent, working terminal db client i have found.
Plug 'kristijanhusak/vim-dadbod-ui'     " UI for the db client.
Plug 'christoomey/vim-tmux-navigator'   " Enable easy movement between vim and Tmux.
Plug 'dense-analysis/ale'   " Linting and some basic LSP usages.
Plug 'morhetz/gruvbox'      " Theme.
Plug 'vim-test/vim-test'           " Running tests with ease.
Plug 'christoomey/vim-tmux-runner' " Used for running Tests, via vim-test, in a separate tmux pane.
call plug#end()

colorscheme gruvbox
set background=dark

" LSP bindings
nnoremap gd :ALEGoToDefinition<CR>
nnoremap gr :ALEFindReferences<CR>
nnoremap gi :ALEGoToImplementation<CR>
nnoremap <Bslash>i :ALEImport<CR>
nnoremap <Bslash>l :ALEToggle<CR>

" vim-test & vim-tmux-runner bindings.
nnoremap ,n :TestNearest<CR>
nnoremap ,f :TestFile<CR>
nnoremap ,s :TestSuite<CR>
nnoremap ,l :TestLast<CR>
nnoremap ,k :VtrKillRunner<CR>

nnoremap <Leader>go :Git<CR>

" Other bindings
nnoremap <Leader>o :Explore<CR>
nnoremap <Leader>r :bufdo :bdelete<CR>:Explore<CR>:echo "All buffers closed."<CR>
