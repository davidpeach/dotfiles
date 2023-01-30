local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself

  use "tpope/vim-commentary"
  use 'tpope/vim-projectionist'
  use 'tpope/vim-surround'
  use "tpope/vim-eunuch"
  use "tpope/vim-unimpaired"
  use 'tpope/vim-fugitive'
  use 'tpope/vim-repeat'

  use 'sheerun/vim-polyglot'

  use 'jessarcher/vim-heritage'


  use "farmergreg/vim-lastplace"

  use 'windwp/nvim-autopairs'

  use {
    "airblade/vim-rooter",
    setup = function()
      vim.g.rooter_manual_only = 1
    end,
    config = function()
      vim.cmd('Rooter')
    end,
  }

  use 'karb94/neoscroll.nvim'

  use 'famiu/bufdelete.nvim'


  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim

  -- Debugging
  use 'mfussenegger/nvim-dap'
  use "rcarriga/nvim-dap-ui"
  use "theHamsta/nvim-dap-virtual-text"

  use "nvim-telescope/telescope-dap.nvim"
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
  use { 'nvim-telescope/telescope-live-grep-args.nvim' }
  use 'BurntSushi/ripgrep'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use "nvim-telescope/telescope-media-files.nvim"








  use 'lewis6991/gitsigns.nvim'
  use "kyazdani42/nvim-web-devicons"

  use "moll/vim-bbye"

  use 'akinsho/toggleterm.nvim'
  use 'hrsh7th/nvim-cmp'
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "saadparwaiz1/cmp_luasnip"
  use "hrsh7th/cmp-nvim-lsp"

  use 'L3MON4D3/LuaSnip'

  use {
    "neovim/nvim-lspconfig",
    requires = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "j-hui/fidget.nvim",
    }
  }


  use {
    "norcalli/nvim-colorizer.lua"
  }


  use 'folke/which-key.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring',
      'nvim-treesitter/nvim-treesitter-textobjects',
    }
  }

  use {
    'phpactor/phpactor',
    branch = 'master',
    ft = 'php',
    run = 'composer install --no-dev -o',
  }

  use 'vim-test/vim-test'

  use 'diepm/vim-rest-console'

  use 'arcticicestudio/nord-vim'
  use 'Mofiqul/dracula.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use "tpope/vim-dadbod"
  use 'kristijanhusak/vim-dadbod-ui'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

