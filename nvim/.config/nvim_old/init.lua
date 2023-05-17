vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- PLUGINS
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({

{
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' }
},

{ 'folke/which-key.nvim' },
{ "tpope/vim-commentary" },
{ "tpope/vim-surround" },
{ "tpope/vim-unimpaired" },
{ 'tpope/vim-repeat' },
{ 'jessarcher/vim-heritage' },
{
  "airblade/vim-rooter",
  init = function()
    vim.g.rooter_manual_only = 1
  end,
  config = function()
    vim.cmd('Rooter')
  end,
},
{
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'kyazdani42/nvim-web-devicons',
    'nvim-telescope/telescope-live-grep-args.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-media-files.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  }
},


{ 'BurntSushi/ripgrep' },
{ 'sheerun/vim-polyglot' },

{
    "williamboman/mason.nvim",
    build = ":MasonUpdate" -- :MasonUpdate updates registry contents
}     

})

-- use {
--   "neovim/nvim-lspconfig",
--   requires = {
--     "williamboman/mason.nvim",
--     "williamboman/mason-lspconfig.nvim",
--     "j-hui/fidget.nvim",
--   }
-- }

-- use {
--   'phpactor/phpactor',
--   branch = 'master',
--   ft = 'php',
--   run = 'composer install --no-dev -o',
-- }
-- -- Git Integration
-- use 'lewis6991/gitsigns.nvim'
-- use 'tpope/vim-fugitive'

-- use {
--   'hrsh7th/nvim-cmp',
--   requires = {
--     use "hrsh7th/cmp-nvim-lsp",
--     use "hrsh7th/cmp-nvim-lsp-signature-help",
--     use "hrsh7th/cmp-buffer",
--     use "hrsh7th/cmp-path",
--   }
-- }

-- -- Code Debugging
-- use 'mfussenegger/nvim-dap'
-- use "rcarriga/nvim-dap-ui"
-- use "theHamsta/nvim-dap-virtual-text"
-- use "nvim-telescope/telescope-dap.nvim"

-- use {
--   'nvim-treesitter/nvim-treesitter',
--   run = function()
--     pcall(require('nvim-treesitter.install').update { with_sync = true })
--   end,
--   requires = {
--     'JoosepAlviste/nvim-ts-context-commentstring',
--     'nvim-treesitter/nvim-treesitter-textobjects',
--   }
-- }


-- -- Testing Integration
-- use 'vim-test/vim-test'

-- -- Rest endpoint Integration
-- use 'diepm/vim-rest-console'


-- use "tpope/vim-dadbod"
-- use 'kristijanhusak/vim-dadbod-ui'

-- -- Wiki Wiki wild wild west
-- use {
--   "vimwiki/vimwiki",
-- }




-- OPTIONS

-- vim.opt.expandtab = true
-- vim.opt.shiftwidth = 4
-- vim.opt.tabstop = 4
-- vim.opt.softtabstop = 4

-- vim.opt.smartindent = true

-- vim.opt.wrap = false

-- vim.opt.number = true
-- vim.opt.relativenumber = true

-- vim.opt.wildmode = 'longest:full,full'
-- vim.opt.completeopt = "menuone,longest,preview"

-- vim.opt.termguicolors = true
-- vim.opt.spell = true

-- vim.opt.ignorecase = true
-- vim.opt.smartcase = true

-- vim.opt.list = true
-- vim.opt.listchars = "tab:> ,trail:."

-- vim.opt.splitbelow = true
-- vim.opt.splitright = true

-- vim.opt.scrolloff = 8
-- vim.opt.sidescrolloff = 8

-- vim.opt.clipboard = "unnamedplus"

-- vim.opt.confirm = true

-- vim.opt.undofile = true
-- vim.opt.backup = true
-- vim.opt.backupdir:remove('.')

-- vim.opt.fileencoding = "utf-8"
-- vim.opt.hlsearch = false
-- vim.opt.swapfile = false
-- vim.opt.updatetime = 250
-- vim.opt.signcolumn = "yes:2"
-- vim.opt.guifont = "monospace:h17"
-- vim.opt.breakindent = true

-- -- vim.cmd [[colorscheme dracula]]


-- -- KEYMAPS
-- -- Easier window navigation.
-- vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- -- Easier buffer navigation.
-- vim.keymap.set("n", "<Left>", ":bp<cr>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<Right>", ":bn<cr>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<Down>", ":bd<cr>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<Up>", ":%bd<cr>", { noremap = true, silent = true })

-- -- Macros
-- vim.keymap.set("n", "<leader>1", ":r !date +\\%Y\\%m\\%d\\%H\\%M\\%S<cr>ddPjdd", { noremap = true, silent = true })
