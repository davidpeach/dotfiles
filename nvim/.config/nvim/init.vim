"===================================
"
"    Turning things on and off.
"    
"===================================

set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set smartindent             " todo
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set relativenumber
set wildmode=longest,list   " get bash-like tab completions
set cc=120                  " set an 80 column border for good coding style
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set clipboard=unnamedplus   " using system clipboard
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set scrolloff=8
set splitbelow
set splitright
set termguicolors

""===================================
""
""    Key Mappings
""
""===================================


let mapleader = "," 

nnoremap <silent> <C-f> :silent !tmux neww tmux-sessionizer<CR>

" -- Make switching windows easier on the hands.
nmap <C-H> <C-W><C-H>
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>


" -- Jump to commonly-edited files
nmap <leader>ve :edit ~/.dotfiles/nvim/.config/nvim/init.vim<cr>
nmap <leader>vr :source ~/.dotfiles/nvim/.config/nvim/init.vim<cr>
nmap <leader>ek :edit ~/.dotfiles/kitty/.config/kitty/kitty.conf<cr>
map gf :edit <cfile><cr>


"" -- Buffer 
" nnoremap <leader>bb :buffers<cr>:buffer<space>
nnoremap <leader>Q :bufdo bdelete<cr>


"" -- Docker mappings
nnoremap <leader>dcu :!docker-compose up -d<cr>
nnoremap <leader>dcd :!docker-compose down<cr>
nnoremap <leader>dcl :!docker container ls<cr>


""===================================
""
""    Bolting things on.
""
""===================================


call plug#begin('~/.nvim/plugged')


source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/commentary.vim
source ~/.config/nvim/plugins/eunuch.vim
source ~/.config/nvim/plugins/fugitive.vim
source ~/.config/nvim/plugins/fzf.vim
"source ~/.config/nvim/plugins/gruvbox.vim
source ~/.config/nvim/plugins/kitty.vim
source ~/.config/nvim/plugins/lightline.vim
source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/peekaboo.vim
source ~/.config/nvim/plugins/php-static-analysis.vim
source ~/.config/nvim/plugins/plenary.vim
" source ~/.config/nvim/plugins/projectionist.vim
source ~/.config/nvim/plugins/quickscope.vim
source ~/.config/nvim/plugins/snippets.vim
source ~/.config/nvim/plugins/solarized.vim
source ~/.config/nvim/plugins/vim-surround.vim
source ~/.config/nvim/plugins/startify.vim
source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/vim-test.vim
source ~/.config/nvim/plugins/visual-multi.vim
source ~/.config/nvim/plugins/which-key.vim

call plug#end()

doautocmd User PlugLoaded

set encoding=utf8
colorscheme NeoSolarized

let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1
let g:startify_change_to_dir = 1
let g:startify_session_persistence = 1
let g:startify_enable_special = 0
let g:startify_session_dir = '~/.config/nvim-sessions'
""===================================
""
""    Keeping our ears open
""
""===================================


"" -- Automatically source inti.vim on save.
augroup autosource
    autocmd!
    autocmd BufWritePost init.vim source %
augroup END
