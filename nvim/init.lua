vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.number = false
vim.opt.showmode = true
vim.opt.breakindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.scrolloff = 11
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.wo.signcolumn = "yes:2"
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.cursorline = false
vim.opt.hlsearch = true
vim.opt.expandtab = true
vim.o.exrc = true
vim.opt.laststatus = 3
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.termguicolors = false
vim.opt.shiftwidth = 2

vim.g.netrw_banner = 0
vim.g.slime_target = "tmux"

vim.g.VtrOrientation = "h" -- Which direction to create tmux pane (for vim-test runner).
vim.g.VtrClearSequence = "" -- The characters that vim tmux test runner will use to clear the pane when running next test.
vim.g.vrc_trigger = "<C-c>" -- Not sure how this is effecting things right now :grimacing:

vim.cmd([[
  hi clear SpellBad
  hi SpellBad cterm=underline guifg=#ff0000
]])

vim.cmd([[
  let test#php#pest#options = '--colors=always'
  " let test#php#pest#executable = 'docker compose exec laravel-website php artisan test'
  let g:test#strategy = 'vtr'
  let test#vtr#orientation = "h"
  let g:test#echo_command = 0
]])

vim.cmd([[
  let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.2"}
]])

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

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

require("lazy").setup("plugins", {
  dev = {
    path = "~/repos/github.com/davidpeach/",
    fallback = false,
  },
})

vim.cmd([[
  au FileType php set makeprg=./vendor/bin/phpstan\ analyse\ --memory-limit=2G\ --no-progress\ --error-format=raw\ --configuration=phpstan.neon
]])

vim.cmd([[
  autocmd FileType lua setlocal shiftwidth=2 tabstop=2 
  autocmd FileType sh setlocal shiftwidth=2 tabstop=2 softtabstop=2
  set laststatus=3
  :highlight WinSeparator guibg=None
  :highlight WinSeparator guifg=lightgrey
]])

require("config.keymaps")
require("config.abbreviations")

-- DAP
local dap = require("dap")
dap.adapters.php = {
  type = "executable",
  command = "node",
  args = { os.getenv("HOME") .. "/vscode-php-debug/out/phpDebug.js" },
}

dap.configurations.php = {
  {
    type = "php",
    request = "launch",
    name = "Listen for Xdebug",
    port = 9003,
    pathMappings = {
      ["/var/www/html"] = "${workspaceFolder}",
    },
  },
}

-- Keybindings

require("nvim-dap-virtual-text").setup({
  enabled = true,
})
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
  element_mappings = {},
  expand_lines = vim.fn.has("nvim-0.7") == 1,
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 80, -- 80 columns
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
  },
})
