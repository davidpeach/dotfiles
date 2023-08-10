-- SETTINGS
vim.opt.guicursor =
"n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
vim.opt.number = true                               -- Show line numbers.
vim.opt.relativenumber = true                       -- Show relative line numbers from position.
vim.opt.tabstop = 4                                 -- How many spaces is a tab?
vim.opt.softtabstop = 4                             -- Spaces for a tab.
vim.opt.shiftwidth = 4                              -- How many spaces per indent.
vim.opt.expandtab = true                            -- Spaces per tab in insert mode.
vim.opt.smartindent = true                          -- Auto-indenting next lines where appropriate.
vim.opt.wrap = false                                -- Do not wrap long lines to next line.
vim.opt.swapfile = false                            -- No swapfile.
vim.opt.backup = false                              -- No backups.
vim.opt.writebackup = false                         -- Don't write backup
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undo" -- Where to place undo files.
vim.opt.undofile = true                             -- Whether or not to keep undo files.
vim.opt.termguicolors = true                        -- Turn on nice colors.
vim.opt.scrolloff = 8                               -- How many lines to always keep at top and bottom of a buffer when scrolling.
vim.opt.signcolumn = "yes"                          -- Column for putting diagnostics / git status etc.
vim.opt.isfname:append("@-@")                       -- What chracters does vim consider to be in a filename.
vim.opt.updatetime = 250                            -- milliseconds of inactivity before writing swapfile.
vim.g.mapleader = " "                               -- <Leader> key.
vim.opt.splitbelow = true                           -- Vertical split should always create new window below current one.
vim.opt.splitright = true                           -- Horizontal split should always create new window to right of current one.

-- Tmux runner options.
vim.g.VtrOrientation = "h"  -- Which direction to create tmux pane (for vim-test runner).
vim.g.VtrClearSequence =
""                          -- The characters that vim tmux test runner will use to clear the pane when running next test.
vim.g.vrc_trigger = '<C-c>' -- Not sure how this is effecting things right now :grimacing:

-- PLUGINS
require('packer').startup(function(use)
    use({ 'wbthomason/packer.nvim' })                                 -- Plugin Manager.
    use({ 'nvim-lua/plenary' })                                       -- Library used by other plugins.
    use({ 'kyazdani42/nvim-web-devicons' })                           -- Icons used by some other plugins.
    use({ 'farmergreg/vim-lastplace' })                               -- Remember the last place in a file you were at.
    use({ 'nvim-telescope/telescope.nvim', tag = '0.1.1' })           -- Incredible fuzzy search.
    use({ 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } }) -- Treesitter for code knowledge.
    use({ 'mbbill/undotree' })
    use({ 'tpope/vim-fugitive' })                                     -- Git UI.
    use({
        'VonHeikemen/lsp-zero.nvim',                                  -- Helping with LSP setup.
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    })
    use({ 'hrsh7th/cmp-buffer' })
    use({ 'hrsh7th/cmp-path' })
    use({ 'jose-elias-alvarez/null-ls.nvim' }) -- Run tasks on code i.e. Laravel Pint.

    -- TESTING
    use({ 'vim-test/vim-test' })           -- Running tests with ease.
    use({ 'christoomey/vim-tmux-runner' }) -- Used for running Test suite in separate tmux pane next to code.

    -- DEBUGGING
    use({ 'mfussenegger/nvim-dap' })           -- Debugging Client.
    use({ 'rcarriga/nvim-dap-ui' })            -- UI for Debugging Client.
    use({ 'theHamsta/nvim-dap-virtual-text' }) -- Show inline debug info where relevant.

    use({ 'windwp/nvim-autopairs' })           -- Automatcally add paired characters when typing the first.
    use({ 'tpope/vim-surround' })              -- Surround a selection with chosen symbols / tags.
    use({ 'tpope/vim-unimpaired' })
    use({ 'christoomey/vim-tmux-navigator' })  -- To help navigate between TMUX and vim.
    use({ 'jessarcher/vim-heritage' })         -- Create missing parent directories when creating a file.
    use({ 'tpope/vim-dispatch' })
    use({ 'tpope/vim-projectionist' })
    use({ 'tpope/vim-commentary' })         -- Easy commenting
    use({ 'tpope/vim-dadbod' })             -- Database Client
    use({ 'kristijanhusak/vim-dadbod-ui' }) -- UI for Database Client
    use({ 'kyazdani42/nvim-tree.lua' })     -- A File tree sidebar
    use({
        "folke/which-key.nvim",             -- Show keybindings when beginning a key combination.
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
            }
        end
    })
    use({ 'sheerun/vim-polyglot' })
    use({ 'lewis6991/gitsigns.nvim' })            -- Git helpers.
    use({ 'norcalli/nvim-colorizer.lua' })        -- May not be working.
    use({ 'Mofiqul/dracula.nvim' })               -- Color Scheme.
    use({ 'akinsho/bufferline.nvim', tag = "*" }) -- Show buffers and tabs as tabs along top of window.
    use({ 'nvim-lualine/lualine.nvim' })          -- Show buffer information in footer area.
    use({ 'diepm/vim-rest-console' })             -- Minimal rest endpoint tester like postman.

    use({
        'phpactor/phpactor', -- PHP code actions and refactor tools.
        branch = 'master',
        ft = 'php',
        run = 'composer install --no-dev -o',
    })

    use({
        "nvim-neorg/neorg", -- Wiki / Notes / Zettelkasten
        config = function()
            require('neorg').setup {
                load = {
                    ["core.defaults"] = {},  -- Loads default behaviour
                    ["core.concealer"] = {}, -- Adds pretty icons to your documents
                    ["core.dirman"] = {      -- Manages Neorg workspaces
                        config = {
                            workspaces = {
                                notes = "~/notes",
                            },
                            default_workspace = "notes"
                        },
                    },
                },
            }
        end,
        run = ":Neorg sync-parsers",
    })
end)

vim.cmd.colorscheme('dracula')

-- KEYMAPS

-- Remaps for common actions.
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv") -- Visual mode move block of code up together.
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv") -- Visual mode move block of code down together.
vim.keymap.set("n", "<C-u>", "<C-u>zz")      -- Keep cursor in centre of screen when jumping upwards.
vim.keymap.set("n", "<C-d>", "<C-d>zz")      -- Keep cursor in centre of screen when jumping downwards.
vim.keymap.set("n", "n", "nzzzv")            -- Keep cursor in centre of screen when going to next occurance of found item.
vim.keymap.set("n", "N", "Nzzzv")            -- Keep cursor in centre of screen when going to previous occurance of found item.
vim.keymap.set('i', ';;', '<Esc>A;<Esc>')    -- Easily add semi colon to end of current line.

-- Tag Navigation
vim.keymap.set("n", "<F6>", ":tabprevious<cr>") -- Cycle to previous Tab.
vim.keymap.set("n", "<F7>", ":tabedit %<cr>")   -- Open current buffer in new tab.
vim.keymap.set("n", "<F8>", ":tabnext<cr>")     -- Cycle to next Tab.

-- Quickfix list
vim.keymap.set("n", "<F9>", ":ccl<cr>")   -- Close the Quickfix list.
vim.keymap.set("n", "<F10>", ":cope<cr>") -- Open the Quickfix list.

-- Buffer Navigation
vim.keymap.set("n", "<F11>", ":bp<cr>") -- Cycle to previous Buffer.
vim.keymap.set("n", "<F12>", ":bn<cr>") -- Cycle to next Buffer.

-- My keymaps are split between multiple "leader" keys.
--
-- <Bslash>  => Any PHP-related bindings
-- <Space>   => Generic bindings I add.
-- ,         => Testing / Debuging bindings.
-- <Bslash>, => TO BE DECIDED.


-- General Bindings with <Space> leader.
vim.keymap.set("n", "<leader><leader>", [[ :DBUIToggle<cr> ]], { desc = "Toggle Database Viewer" })
vim.keymap.set('n', '<leader>o', ':NvimTreeFindFileToggle<CR>') -- Toggle project tree view.
vim.keymap.set("x", "<leader>p", "\"_dP")                       -- When pasting, do not change default register to newly deleted text.
vim.keymap.set("n", "<leader>y", "\"+y")                        -- Yank to system clipboard.
vim.keymap.set("v", "<leader>y", "\"+y")                        -- Yank to system clipboard.
vim.keymap.set("n", "<leader>Y", "\"+Y")                        -- Yank line to system clipboard.
vim.keymap.set("n", "<leader>d", "\"_d")                        -- Delete without saving deleted text to register.
vim.keymap.set("v", "<leader>d", "\"_d")                        -- Delete without saving deleted text to register.
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undo Tree" })

vim.keymap.set("n", "<leader>go", vim.cmd.Git, { desc = "Open Git UI" })
local gs = require('gitsigns')
vim.keymap.set('n', '<leader>gs', gs.stage_hunk, { desc = "Stage Hunk" })
vim.keymap.set('n', '<leader>gr', gs.reset_hunk, { desc = "Reset Hunk" })
vim.keymap.set('v', '<leader>gs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
    { desc = "Stage Hunk" })
vim.keymap.set('v', '<leader>gr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
    { desc = "Reset Hunk" })
vim.keymap.set('n', '<leader>gS', gs.stage_buffer, { desc = "Stage the buffer" })
vim.keymap.set('n', '<leader>gu', gs.undo_stage_hunk, { desc = "Undo staging the hunk" })
vim.keymap.set('n', '<leader>gR', gs.reset_buffer, { desc = "Rest the buffer" })
vim.keymap.set('n', '<leader>gp', gs.preview_hunk, { desc = "Preview the hunk" })
vim.keymap.set('n', '<leader>gB', function() gs.blame_line { full = true } end, { desc = "Git blame full" })
vim.keymap.set('n', '<leader>gb', gs.toggle_current_line_blame, { desc = "Git blame oneline" })
vim.keymap.set('n', '<leader>gd', gs.diffthis, { desc = "Diff the file" })
vim.keymap.set('n', '<leader>gD', function() gs.diffthis('~') end, { desc = "Diff the file from HEAD" })

-- PHP Bindings with <Bslash> leader.
vim.keymap.set("n", "<Bslash>c", ":PhpactorContextMenu<cr>", { desc = "Context Menu" })
vim.keymap.set("n", "<Bslash>t", ":PhpactorTransform<cr>", { desc = "Transform" })
vim.keymap.set("n", "<Bslash>i", ":PhpactorImportClass<cr>", { desc = "Import Class" })
vim.keymap.set("n", "<Bslash>e", ":PhpactorExtractExpression<cr>", { desc = "Extract Expression" })
vim.keymap.set("v", "<Bslash>e", ":PhpactorExtractExpression<cr>", { desc = "Extract Expression" })

-- Testing and Debugging bindings with , as leader.
vim.keymap.set('n', ',n', ':TestNearest<CR>', { silent = false, desc = "Run Nearest Test" })
vim.keymap.set('n', ',f', ':TestFile<CR>', { silent = false, desc = "Run Current Test File " })
vim.keymap.set('n', ',s', ':TestSuite<CR>', { silent = false, desc = "Run Test Suite" })
vim.keymap.set('n', ',l', ':TestLast<CR>', { silent = false, desc = "Re-run Last Test" })
vim.keymap.set('n', ',v', ':TestVisit<CR>', { silent = false, desc = "Return to Last-ran Test" })
vim.keymap.set('n', ',k', ':VtrKillRunner<CR>', { silent = false, desc = "Close Test Window" })
