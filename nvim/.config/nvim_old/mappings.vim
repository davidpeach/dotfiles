
let mapleader = ","         " map leader to comma

" Mappings
nnoremap <leader>nh :Startify<cr>



" -- laravel artisan mappings
" Need to be able to run in each individual container (makefile)

" -- buffer mappings
nnoremap <leader>bb :buffers<cr>:buffer<space>
nnoremap <leader>Q :bufdo bdelete<cr>


" -- docker mappings
nnoremap <leader>dcu :!docker-compose up -d<cr>
nnoremap <leader>dcd :!docker-compose down<cr>
nnoremap <leader>dcl :!docker container ls<cr>


" -- git mappings
nnoremap <leader>gg :G<cr>
nnoremap <leader>gs :G status<cr>
nnoremap <leader>ga :G add -p<cr>


" -- file mappings
nmap <leader>ve :edit ~/.dotfiles/nvim/.config/nvim/init.vim<cr>
nmap <leader>vr :source ~/.dotfiles/nvim/.config/nvim/init.vim<cr>
nmap <leader>ek :edit ~/.dotfiles/kitty/.config/kitty/kitty.conf<cr>
map gf :edit <cfile><cr>

" why have I got this?
nmap <leader>t :tag<space>


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
