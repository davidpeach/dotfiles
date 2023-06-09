-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'


	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

    use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
--    use({ 'theprimeagen/harpoon' })
    use({ 'mbbill/undotree' })
    use({ 'tpope/vim-fugitive' })
    use ({
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    })
    use ({ 'hrsh7th/cmp-buffer' })
    use ({ 'hrsh7th/cmp-path' })
    use ({ 'jose-elias-alvarez/null-ls.nvim' })

    use ({ 'mfussenegger/nvim-dap' })
--    use ({
--        'leoluz/nvim-dap-go',
--    })
    use({ 'rcarriga/nvim-dap-ui' })
    use ({ 'theHamsta/nvim-dap-virtual-text' })
--    use ({ 'nvim-telescope/telescope-dap.nvim' })

    use({ 'lervag/wiki.vim' })

    use ({ 'windwp/nvim-autopairs' })

    use ({ 'tpope/vim-surround' })

    use ({ 'christoomey/vim-tmux-navigator' })

    use ({ 'christoomey/vim-tmux-runner' })

    use ({ 'vim-test/vim-test' })
    use ({ 'tpope/vim-commentary' })
    use ({ 'tpope/vim-dadbod' })
    use ({ 'kristijanhusak/vim-dadbod-ui' })
    use ({
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    })
    use ({ 'sheerun/vim-polyglot' })
    use ({ 'lewis6991/gitsigns.nvim' })
    use ({ 'norcalli/nvim-colorizer.lua' })
  use ({ 'Mofiqul/dracula.nvim'})
  use ({
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  })

  use ({ 'diepm/vim-rest-console' })
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
end)
