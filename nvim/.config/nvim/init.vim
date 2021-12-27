"===================================
"
"    Turning things on and off.
"
"===================================

runtime settings-flags.vim




"===================================
"
"    Bolting things on.
"
"===================================

runtime plugins.vim







let mapleader = ","         " map leader to Space

" Mappings
nnoremap <leader>ev :tabedit ~/.dotfiles/nvim/.config/nvim/init.vim<cr>

nmap <leader>t :tag<space>


" Split Management

set splitbelow
set splitright

nmap <C-H> <C-W><C-H>
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>



" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" NERDtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Automatically source inti.vim on save.
augroup autosource
    autocmd!
    autocmd BufWritePost init.vim source %
augroup END

autocmd vimenter * ++nested colorscheme gruvbox
set encoding=utf8
set guifont=DroidSansMono\ Nerd\ Font\ 11

