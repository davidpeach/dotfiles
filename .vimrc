set nocompatible
set autoindent
set autowrite
set noerrorbells
set nonumber
set ignorecase
set shiftwidth=4
set showmode
set tabstop=4
set exrc
set expandtab
set foldmethod=manual
set hidden
set history=100
set nohlsearch
set incsearch
set linebreak
set nobackup
set nofoldenable
set noswapfile
set nowrap
set nowritebackup
set path+=**
set ruler
set scrolloff=8
set shortmess=aoOtTI
set smartcase
set smartindent
set smarttab
set softtabstop=4
set spc=
set splitbelow
set splitright
set termguicolors
set textwidth=120
set undofile
set updatetime=250
set viminfo='20,<1000,s1000
set wildignore+=**/node_modules/**
set wildignore+=**/storage/**
set wildignore+=**/vendor/**
set wildmenu
set wrapscan
set spell
set spelllang=en_gb
set grepprg=git\ grep\ -n
set laststatus=0
set signcolumn=yes

if has('nvim')
    set undodir=~/.nvim/undovim
elseif has('vim')
    set undodir=~/.vim/undovim
endif


filetype plugin on

let mapleader=" "
let maplocalleader=","

match IncSearch '\s\+$'
syntax enable

let g:netrw_banner=0
let g:mkdp_browser = '/usr/bin/firefox'

let g:lsp_diagnostics_virtual_text_enabled = 1

augroup transparent_signcolumn
  au!
  autocmd ColorScheme * highlight SignColumn guibg=#282828 " Dark mode
  " autocmd ColorScheme * highlight SignColumn guibg=#fbf1c7 " Light mode
augroup END

" --- Plugin Installation
" --- I'm trying to keep plugins to a minimum
" --- I try to lean more on external bash scripts.
call plug#begin("~/.local/share/vim/plugins")
"== TODO: Could just use git
Plug 'tpope/vim-fugitive'   " ------------------ Git UI.

"== TODO: Could use toggle comment bash filter
Plug 'tpope/vim-commentary' " ------------------ Code commenting.

"== TODO: Investigate options.
"== Just use cli database queries?
Plug 'tpope/vim-dadbod'     " ------------------ Database client
Plug 'kristijanhusak/vim-dadbod-ui'     " ------ UI for the Database client.

"== TODO: Just copy paste keybindings in?
Plug 'christoomey/vim-tmux-navigator'   " ------ Easy movement between Vim and Tmux.
Plug 'morhetz/gruvbox'        " ---------------- Theme.
Plug 'TysonAndre/php-vim-syntax' " ------------- Better PHP Syntax Highlighting.
Plug 'prabirshrestha/vim-lsp' " ---------------- LSP Client.
Plug 'mattn/vim-lsp-settings' " ---------------- LSP Settings.

"== TODO could i use a bash script for this?
"== Or even just vim's make command?
Plug 'vim-test/vim-test' " --------------------- Test runner.
Plug 'christoomey/vim-tmux-runner' " ----------- Enable running tests in separate Tmux pane.
call plug#end()

colorscheme gruvbox
set background=dark


let g:lsp_diagnostics_signs_error = {'text': '✗'}
" let g:lsp_diagnostics_signs_warning = {'text': '‼', 'icon': '/path/t'}
let g:lsp_diagnostics_signs_hint = {'text': '🤫'}
let g:lsp_inlay_hints_mode = {
 \  'normal': ['curline'],
 \}



hi clear SpellBad
hi SpellBad cterm=underline guifg=#ff0000
highlight lspReference ctermfg=red guifg=red ctermbg=green guibg=green

" --- Trying to replace commenting plugin with simple
" --- External bash script filtering.
autocmd FileType sh command! -range Comment <line1>,<line2>!comment \\#
autocmd FileType md command! -range Comment <line1>,<line2>!comment --

" == TODO: make commenting toggleable
:nnoremap <Leader>h :Comment<cr>

:nnoremap <Leader>/ :grep <c-r>=expand("<cword>")<CR><CR><CR><CR>:cope<CR>
:nnoremap <Leader>s :grep 
:nnoremap <Leader>f :find 

" --- Yanking and Pasting Commands `:Yy` and `:Pp`
" ------ External bash script `yyy` that just
" ------ writes to a file in home directory.
command! -range Yy <line1>,<line2>!yyy

" ------ External bash script `ppp` that pastes
" ------ from the clipboard file in $HOME
command! -range Pp <line1>,<line2>!ppp

" ------ Mapping my yanking and pasting commands
" ------ to keymaps for faster usage.
xnoremap <Leader>y :Yy<CR>
nnoremap <Leader>y :Yy<CR>
xnoremap <Leader>p :Pp<CR>
nnoremap <Leader>p :Pp<CR>

" -- Git keymaps for use with `tpope/vim-fugitive` plugin
nnoremap <Leader>go :Git<CR>
nnoremap <Leader>gg :Git 
nnoremap <Leader>gp :Git push
nnoremap <Leader>gu :Git pull
nnoremap <Leader>gl :Git log 
nnoremap <Leader>gc :Git checkout 
nnoremap <Leader>gm :Git merge 
" nnoremap <Leader>gd :Git diff x --name-only

nnoremap <Leader>e :Explore<CR>

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    "nmap <buffer> gt <plug>(lsp-type-definition)
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


"au FileType php set makeprg=./vendor/bin/phpstan\ analyse\ --memory-limit=2G\ --no-progress\ --error-format=raw\ --configuration=phpstan.neon
