" David Peach's Vim configuration.

" Setting VI compatible settings.
set nocompatible
set nonumber        "no line numbers. trying to be search-sentric.
set autoindent		"auto-indent new lines.
set autowrite		"auto-save when switching to other open files.
set showmode		"show current mode in bottom left.
set ruler
set tabstop=4

set softtabstop=4
set shiftwidth=4
set smartindent
set smarttab
set termguicolors

let mapleader=" "

fun! s:DetectBash()
    if getline(1) == '#!/usr/bin/bash' || getline(1) == '#!/bin/bash'
        set ft=bash
        set shiftwidth=2
    endif
endfun
autocmd BufNewFile,BufRead * call s:DetectBash()

" No code folding.
set foldmethod=manual
set nofoldenable

match IncSearch '\s\+$'

set path+=**            "Search inside folders recursively.
set wildmenu            "Better tab completion for commands
set wildignore+=**/node_modules/**

set textwidth=72	    "Max 80 character wide, but accounting for gutter width.
set expandtab		    "Tabs into spaces.
set norelativenumber    "No relative numbers.
set spc=                "No Spellcheck.

set nobackup
set noswapfile
set nowritebackup
set icon

set shortmess=aoOtTI        "Disable many of the 'hit enter' messages.
set viminfo='20,<1000,s1000 "Remember certain histories to pick up where left off.
set wrapscan                "Wrap round when searching


set hlsearch
set incsearch
set linebreak

set hidden                  "Allow changing files without having to save.

set history=100             "Set command history.

syntax enable

set ttyfast                 "Fast scrolling

filetype plugin on

nnoremap Y y$


nnoremap <leader>c :nohl<CR>


" Lets try and keep plugins to a minimum.
call plug#begin("~/.local/share/vim/plugins")

Plug 'NLKNguyen/papercolor-theme'
Plug 'sheerun/vim-polyglot' " Code highlighting for many languages/filetypes
Plug 'junegunn/fzf.vim' " Project search
Plug 'tpope/vim-dadbod' " The only decent, working terminal db client i have found
Plug 'kristijanhusak/vim-dadbod-ui' " UI for the db client

call plug#end()

set t_Co=256   " This is may or may not needed.

set background=dark
colorscheme slate

function! s:ag_to_qf(line)
  let parts = split(a:line, ':')
  return {'filename': parts[0], 'lnum': parts[1], 'col': parts[2],
        \ 'text': join(parts[3:], ':')}
endfunction

function! s:ag_handler(lines)
  if len(a:lines) < 2 | return | endif

  let cmd = get({'ctrl-x': 'split',
               \ 'ctrl-v': 'vertical split',
               \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
  let list = map(a:lines[1:], 's:ag_to_qf(v:val)')

  let first = list[0]
  execute cmd escape(first.filename, ' %#\')
  execute first.lnum
  execute 'normal!' first.col.'|zz'

  if len(list) > 1
    call setqflist(list)
    copen
    wincmd p
  endif
endfunction

command! -nargs=* Ag call fzf#run({
\ 'source':  printf('ag --nogroup --column --color "%s"',
\                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
\ 'sink*':    function('<sid>ag_handler'),
\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
\            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all '.
\            '--color hl:68,hl+:110',
\ 'down':    '50%'
\ })
