
call plug#begin('~/.nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'slamdunk/vim-php-static-analysis'
Plug 'fladson/vim-kitty'
Plug 'tpope/vim-fugitive'

call plug#end()
