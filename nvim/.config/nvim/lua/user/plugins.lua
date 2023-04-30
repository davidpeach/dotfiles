local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').reset()
require('packer').init({
  compile_path = vim.fn.stdpath('data')..'/site/plugin/packer_compiled.lua',
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'solid' })
    end,
  },
})

local use = require('packer').use

-- Have Packer manage itself
use "wbthomason/packer.nvim" 

use 'Mofiqul/dracula.nvim'

use {
  'nvim-lualine/lualine.nvim',
  requires = { opt = true, 'kyazdani42/nvim-web-devicons' }
}

-- Passive Plugins
use 'windwp/nvim-autopairs'
use({
  'sickill/vim-pasta',
  config = function()
    vim.g.pasta_disabled_filetypes = { 'fugitive' }
  end,
})
use "norcalli/nvim-colorizer.lua"

-- Utility Plugins
use 'folke/which-key.nvim'
use "tpope/vim-commentary"
use 'tpope/vim-projectionist'
use "tpope/vim-surround"
use "tpope/vim-eunuch"
use "tpope/vim-unimpaired"
use 'tpope/vim-repeat'
use 'jessarcher/vim-heritage'
use {
  "airblade/vim-rooter",
  setup = function()
    vim.g.rooter_manual_only = 1
  end,
  config = function()
    vim.cmd('Rooter')
  end,
}

-- Project Search
use({
  'nvim-telescope/telescope.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    'kyazdani42/nvim-web-devicons',
    'nvim-telescope/telescope-live-grep-args.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-media-files.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
  }
})
use 'BurntSushi/ripgrep'

-- Code Plugins
use 'sheerun/vim-polyglot'
use {
  "neovim/nvim-lspconfig",
  requires = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "j-hui/fidget.nvim",
  }
}

use {
  'phpactor/phpactor',
  branch = 'master',
  ft = 'php',
  run = 'composer install --no-dev -o',
}
-- Git Integration
use 'lewis6991/gitsigns.nvim'
use 'tpope/vim-fugitive'

use {
  'hrsh7th/nvim-cmp',
  requires = {
    use "hrsh7th/cmp-nvim-lsp",
    use "hrsh7th/cmp-nvim-lsp-signature-help",
    use "hrsh7th/cmp-buffer",
    use "hrsh7th/cmp-path",
    use 'L3MON4D3/LuaSnip',
    use "saadparwaiz1/cmp_luasnip",
    use 'onsails/lspkind-nvim'
  }
}

-- Code Debugging
use 'mfussenegger/nvim-dap'
use "rcarriga/nvim-dap-ui"
use "theHamsta/nvim-dap-virtual-text"
use "nvim-telescope/telescope-dap.nvim"

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


-- Testing Integration
use 'vim-test/vim-test'

-- Rest endpoint Integration
use 'diepm/vim-rest-console'


use "tpope/vim-dadbod"
use 'kristijanhusak/vim-dadbod-ui'

-- Wiki Wiki wild wild west
use {
  "vimwiki/vimwiki",
}
use "tools-life/taskwiki"

if packer_bootstrap then
    require('packer').sync()
end
