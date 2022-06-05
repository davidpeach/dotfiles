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
  -- My plugins here
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
    use "tpope/vim-commentary"
    use {
        "tpope/vim-projectionist",
        config = function ()
            require 'user.plugins.vim-projectionist'
        end
    }
    use "tpope/vim-fugitive"
    use {
        "lewis6991/gitsigns.nvim",
        config = function ()
            require 'user.plugins.gitsigns'
        end
    }
    use "kyazdani42/nvim-web-devicons"
    use {
        "akinsho/bufferline.nvim",
        config = function ()
            require 'user.plugins.bufferline'
        end
    }
    use "moll/vim-bbye"
    use {
        "akinsho/toggleterm.nvim",
        config = function ()
            require 'user.plugins.toggleterm'
        end
    }
    use {
        'kyazdani42/nvim-tree.lua',
        config = function ()
            require 'user.plugins.nvimtree'
        end
    }

    use "airblade/vim-rooter"
    use "farmergreg/vim-lastplace"
    use {
        "glepnir/dashboard-nvim",
        config = function ()
            require 'user.plugins.dashboard'
        end
    }

    use {
        "hrsh7th/nvim-cmp",
        config = function ()
            require 'user.plugins.cmp'
        end
    }
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "saadparwaiz1/cmp_luasnip"
    use "hrsh7th/cmp-nvim-lsp"

    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"

    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
    use {
        'voldikss/vim-floaterm',
        config = function ()
            require 'user.plugins.floaterm'
        end
    }
    use {
        "nvim-telescope/telescope.nvim",
        config = function()
            require 'user.plugins.telescope'
        end
    }

    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    use 'nvim-telescope/telescope-file-browser.nvim'

    use "nvim-telescope/telescope-media-files.nvim"

    use {
        "luisiacc/gruvbox-baby", branch = "main"
    }

    use {
        "folke/tokyonight.nvim"
    }

    use {
        "norcalli/nvim-colorizer.lua"
    }

    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup()
        end
    }

    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {}
        end
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function ()
            require('user.plugins.treesitter')
        end
    }

    use {
        'phpactor/phpactor',
        branch = 'master',
        ft = 'php',
        run = 'composer install --no-dev -o',
        config = function()
            require 'user.plugins.phpactor'
        end
    }

    use {
        "vim-test/vim-test",
        config = function ()
            require 'user.plugins.vim-test'
        end
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)

