vim.g.mapleader = " "
vim.g.maplocalleader = " "

require('config.lazy')
require('config.options')
require('config.keymap')
require('config.helpers')
require('config.abbreviations')

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.diagnostic.config({
  virtual_text = true,
})

vim.lsp.enable({ 'intelephense' })
-- Clear existing PmenuSel definition (optional)
vim.cmd('highlight clear PmenuSel')

-- Define new colors using vim.api.nvim_set_hl
-- The last argument is a table defining the attributes
vim.api.nvim_set_hl(0, 'BlinkCmpMenu', { fg = '#ffffff', bg = '#202020', bold = true })
vim.api.nvim_set_hl(0, 'BlinkCmpMenuSelection', { bg = '#ff5ef1', fg = '#202020' })
vim.api.nvim_set_hl(0, 'BlinkCmpKind', { fg = '#202020' })
vim.api.nvim_set_hl(0, 'BlinkCmpMenuBorder', { fg = '#ff5ef1', })
vim.api.nvim_set_hl(0, 'BlinkCmpScrollBarThumb', { bg = '#5ef1ff', })










-- vim.g.slime_target = "tmux"
--
-- vim.g.VtrOrientation = "h" -- Which direction to create tmux pane (for vim-test runner).
-- vim.g.VtrClearSequence = "" -- The characters that vim tmux test runner will use to clear the pane when running next test.
-- vim.g.vrc_trigger = "<C-c>" -- Not sure how this is effecting things right now :grimacing:
--
-- vim.cmd([[
--   hi clear SpellBad
--   hi SpellBad cterm=underline guifg=#ff0000
-- ]])
--
--
-- vim.cmd([[
--   let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.2"}
-- ]])



-- vim.cmd([[
--   au FileType php set makeprg=./vendor/bin/phpstan\ analyse\ --memory-limit=2G\ --no-progress\ --error-format=raw\ --configuration=phpstan.neon
-- ]])
--
-- vim.cmd([[
--   autocmd FileType lua setlocal shiftwidth=2 tabstop=2
--   autocmd FileType sh setlocal shiftwidth=2 tabstop=2 softtabstop=2
--   set laststatus=3
--   :highlight WinSeparator guibg=None
--   :highlight WinSeparator guifg=lightgrey
-- ]])
--
-- require("config.keymaps")
-- require("config.abbreviations")

-- DAP
-- local dap = require("dap")
-- dap.adapters.php = {
--   type = "executable",
--   command = "node",
--   args = { os.getenv("HOME") .. "/vscode-php-debug/out/phpDebug.js" },
-- }
--
-- dap.configurations.php = {
--   {
--     type = "php",
--     request = "launch",
--     name = "Listen for Xdebug",
--     port = 9003,
--     pathMappings = {
--       ["/var/www/html"] = "${workspaceFolder}",
--     },
--   },
-- }

-- Keybindings

-- require("nvim-dap-virtual-text").setup({
--   enabled = true,
-- })
-- require("dapui").setup({
--   icons = { expanded = "", collapsed = "", current_frame = "" },
--   mappings = {
--     expand = { "<CR>", "<2-LeftMouse>" },
--     open = "o",
--     remove = "d",
--     edit = "e",
--     repl = "r",
--     toggle = "t",
--   },
--   element_mappings = {},
--   expand_lines = vim.fn.has("nvim-0.7") == 1,
--   layouts = {
--     {
--       elements = {
--         { id = "scopes", size = 0.25 },
--         "breakpoints",
--         "stacks",
--         "watches",
--       },
--       size = 80, -- 80 columns
--       position = "left",
--     },
--     {
--       elements = {
--         "repl",
--         "console",
--       },
--       size = 0.25, -- 25% of total lines
--       position = "bottom",
--     },
--   },
--   controls = {
--     enabled = true,
--     element = "repl",
--     icons = {
--       pause = "",
--       play = "",
--       step_into = "",
--       step_over = "",
--       step_out = "",
--       step_back = "",
--       run_last = "",
--       terminate = "",
--     },
--   },
--   floating = {
--     max_height = nil, -- These can be integers or a float between 0 and 1.
--     max_width = nil, -- Floats will be treated as percentage of your screen.
--     border = "single", -- Border style. Can be "single", "double" or "rounded"
--     mappings = {
--       close = { "q", "<Esc>" },
--     },
--   },
--   windows = { indent = 1 },
--   render = {
--     max_type_length = nil, -- Can be integer or nil.
--     max_value_lines = 100, -- Can be integer or nil.
--   },
-- })
