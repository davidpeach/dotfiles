require 'user.options'
require 'user.keymaps'
require 'user.plugins'
require 'user.lsp'


local colorscheme = "dracula"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found")
    return
end

require('lualine').setup({
    options = {
        theme = 'dracula-nvim'
    }
})
-- require("laravel").setup({
--     split_cmd = "vertical",
--     split_width = 120,
--     bind_telescope = true,
--     ask_for_args = true,
-- })

-- Load custom tree-sitter grammar for org filetype
require('orgmode').setup_ts_grammar()

-- Tree-sitter configuration
require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {'org'}, -- Required for spellcheck, some LaTex highlights and code block highlights that do not have ts grammar
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}
-- require('orgmode').setup_ts_grammar()
require('orgmode').setup_ts_grammar({
  org_agenda_files = {'~/my-orgs/**/*'},
  org_default_notes_file = '~/org/refile.org',
})

-- require("telescope").load_extension "laravel"
require 'colorizer'.setup()

-- MOVE MOVE
P = function (v)
    print(vim.inspect(v))
    return v
end

vim.keymap.set('n', '<leader><leader>x', ':w<cr> :source %<cr>')
