-- SETTINGS
vim.opt.guicursor =
"n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
vim.opt.number = true                               -- Show line numbers.
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
vim.opt.signcolumn = "no"                          -- Column for putting diagnostics / git status etc.
vim.opt.isfname:append("@-@")                       -- What chracters does vim consider to be in a filename.
vim.opt.updatetime = 250                            -- milliseconds of inactivity before writing swapfile.
vim.g.mapleader = " "                               -- <Leader> key.
vim.opt.splitbelow = true                           -- Vertical split should always create new window below current one.
vim.opt.splitright = true                           -- Horizontal split should always create new window to right of current one.

vim.g.netrw_banner = 0

-- Tmux runner options.
vim.g.VtrOrientation = "h"  -- Which direction to create tmux pane (for vim-test runner).
vim.g.VtrClearSequence =
""                          -- The characters that vim tmux test runner will use to clear the pane when running next test.
vim.g.vrc_trigger = '<C-c>' -- Not sure how this is effecting things right now :grimacing:

-- PLUGINS
require('packer').startup(function(use)
    use({ 'wbthomason/packer.nvim' })                                 -- Plugin Manager.
    use({ 'nvim-lua/plenary.nvim' })                                  -- Library used by other plugins.
    use({ 'kyazdani42/nvim-web-devicons' })                           -- Icons used by some other plugins.
    use({ 'nvim-telescope/telescope.nvim', tag = '0.1.1' })           -- Incredible fuzzy search.
    use({ 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } }) -- Treesitter for code knowledge.
    use({
        'VonHeikemen/lsp-zero.nvim',                                  -- Helping with LSP setup.
        branch = 'v2.x',
        requires = {
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim', run = function() pcall(vim.cmd, 'MasonUpdate') end, },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    })
    use({ 'hrsh7th/cmp-buffer' })
    use({ 'hrsh7th/cmp-path' })
    use({ 'christoomey/vim-tmux-navigator' })  -- To help navigate between TMUX and vim.
    use({ 'sheerun/vim-polyglot' })     -- Language pack
    use({ 'farmergreg/vim-lastplace' }) -- Remember the last place in a file you were at.
    use({ 'windwp/nvim-autopairs' })    -- Automatcally add paired characters when typing the first.
    use({ 'tpope/vim-fugitive' })       -- Git UI.
    use({ 'tpope/vim-surround' })       -- Surround a selection with chosen symbols / tags.
    use({ 'tpope/vim-unimpaired' })     -- Handy "[ and ]" mappings. 
    use({ 'tpope/vim-commentary' })     -- Easy commenting

    -- DATABASE VIEWER
    use({ 'tpope/vim-dadbod' })             -- Database Client
    use({ 'kristijanhusak/vim-dadbod-ui' }) -- UI for Database Client

    -- TESTING
    use({ 'vim-test/vim-test' })           -- Running tests with ease.
    use({ 'christoomey/vim-tmux-runner' }) -- Used for running Test suite in separate tmux pane next to code.

    -- DEBUGGING
    use({ 'mfussenegger/nvim-dap' })           -- Debugging Client.
    use({ 'rcarriga/nvim-dap-ui' })            -- UI for Debugging Client.
    use({ 'theHamsta/nvim-dap-virtual-text' }) -- Show inline debug info where relevant.

    -- PHP
    use({
        'phpactor/phpactor', -- PHP code actions and refactor tools.
        branch = 'master',
        ft = 'php',
        run = 'composer install --no-dev -o',
    })

    -- THEME
    use({ "ellisonleao/gruvbox.nvim" })
end)

vim.cmd.colorscheme('gruvbox')

-- Telescope config
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>pg', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

require('telescope').setup {
    defaults = {
        preview = {
            treesitter = false
        }
    },
}

-- Treesitter
require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "javascript", "typescript", "c", "lua", "vim", "vimdoc", "query", "markdown", "php", "bash" },
    sync_install = false,
    auto_install = true,
    indent = { enable = true },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
}


-- Autopairs
require("nvim-autopairs").setup{}

-- Vim Test
vim.cmd([[
  let test#php#phpunit#options = '--colors=always'
  let g:test#strategy = 'vtr'
  let test#vtr#orientation = "h"
  let g:test#echo_command = 0
]])

-- DAP
local dap = require('dap')
dap.adapters.php = {
    type = 'executable',
    command = 'node',
    args = { os.getenv("HOME") .. "/vscode-php-debug/out/phpDebug.js" }
}

dap.configurations.php = {
    {
        type = 'php',
        request = 'launch',
        name = 'Listen for Xdebug',
        port = 9003,
        pathMappings = {
            ["/var/www/html"] = "${workspaceFolder}"
        }
    }
}

-- Keybindings
vim.keymap.set("n", ",b", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", ",c", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", ",v", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", ",i", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", ",o", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", ",t", ":lua require'dapui'.toggle()<CR>")

require('nvim-dap-virtual-text').setup {
    enabled = true
}
require("dapui").setup({
    icons = { expanded = "", collapsed = "", current_frame = "" },
    mappings = {
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
    },
    element_mappings = {
    },
    expand_lines = vim.fn.has("nvim-0.7") == 1,
    layouts = {
        {
            elements = {
                { id = "scopes", size = 0.25 },
                "breakpoints",
                "stacks",
                "watches",
            },
            size = 80, -- 40 columns
            position = "left",
        },
        {
            elements = {
                "repl",
                "console",
            },
            size = 0.25, -- 25% of total lines
            position = "bottom",
        },
    },
    controls = {
        enabled = true,
        element = "repl",
        icons = {
            pause = "",
            play = "",
            step_into = "",
            step_over = "",
            step_out = "",
            step_back = "",
            run_last = "",
            terminate = "",
        },
    },
    floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        border = "single", -- Border style. Can be "single", "double" or "rounded"
        mappings = {
            close = { "q", "<Esc>" },
        },
    },
    windows = { indent = 1 },
    render = {
        max_type_length = nil, -- Can be integer or nil.
        max_value_lines = 100, -- Can be integer or nil.
    }
})

-- LSP
local lsp = require('lsp-zero')
lsp.preset("recommended")
lsp.ensure_installed({
    'ansiblels',
    'bashls',
    'cssls',
    'dockerls',
    'emmet_ls',
    'eslint',
    'gopls',
    'lua_ls',
    'intelephense',
    'tailwindcss',
    'terraformls',
    'tsserver',
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

    vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
    vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
    vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
require('lspconfig').tsserver.setup({})
require('lspconfig').terraformls.setup({})
require('lspconfig').bashls.setup({})
lsp.setup()

-- KEYMAPS
-- Remaps for common actions.
vim.keymap.set("v", ">", ">gv") -- Visual mode move block of code up together.
vim.keymap.set("v", "<", "<gv") -- Visual mode move block of code up together.
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv") -- Visual mode move block of code up together.
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv") -- Visual mode move block of code down together.
vim.keymap.set("n", "<C-u>", "<C-u>zz")      -- Keep cursor in centre of screen when jumping upwards.
vim.keymap.set("n", "<C-d>", "<C-d>zz")      -- Keep cursor in centre of screen when jumping downwards.
vim.keymap.set("n", "n", "nzzzv")            -- Keep cursor in centre of screen when going to next occurance of found item.
vim.keymap.set("n", "N", "Nzzzv")            -- Keep cursor in centre of screen when going to previous occurance of found item.

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

-- General Bindings with <Space> leader.
vim.keymap.set("n", "<leader><leader>", [[ :DBUIToggle<cr> ]], { desc = "Toggle Database Viewer" })
vim.keymap.set('n', '<leader>o', ':Explore<CR>') -- Toggle project tree view.
vim.keymap.set("x", "<leader>p", "\"_dP")                       -- When pasting, do not change default register to newly deleted text.
vim.keymap.set("n", "<leader>y", "\"+y")                        -- Yank to system clipboard.
vim.keymap.set("v", "<leader>y", "\"+y")                        -- Yank to system clipboard.
vim.keymap.set("n", "<leader>Y", "\"+Y")                        -- Yank line to system clipboard.
vim.keymap.set("n", "<leader>d", "\"_d")                        -- Delete without saving deleted text to register.
vim.keymap.set("v", "<leader>d", "\"_d")                        -- Delete without saving deleted text to register.
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undo Tree" })

vim.keymap.set("n", "<leader>go", vim.cmd.Git, { desc = "Open Git UI" })

-- Testing and Debugging bindings with , as leader.
vim.keymap.set('n', ',n', ':TestNearest<CR>', { silent = false, desc = "Run Nearest Test" })
vim.keymap.set('n', ',f', ':TestFile<CR>', { silent = false, desc = "Run Current Test File " })
vim.keymap.set('n', ',s', ':TestSuite<CR>', { silent = false, desc = "Run Test Suite" })
vim.keymap.set('n', ',l', ':TestLast<CR>', { silent = false, desc = "Re-run Last Test" })
vim.keymap.set('n', ',v', ':TestVisit<CR>', { silent = false, desc = "Return to Last-ran Test" })
vim.keymap.set('n', ',k', ':VtrKillRunner<CR>', { silent = false, desc = "Close Test Window" })

-- Thanks to @JessArcher
vim.cmd([[
    augroup CreateMissingDirectories
        autocmd!
        autocmd BufWritePre * :call FuncCreateMissingDirectories(expand('<afile>'), +expand('<abuf>'))
    augroup END

    function FuncCreateMissingDirectories(file, buf)
        if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
            let dir=fnamemodify(a:file, ':h')
            if !isdirectory(dir)
                call mkdir(dir, 'p')
            endif
        endif
    endfunction
]])
