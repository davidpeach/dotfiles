local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Easier window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Open file drawer
keymap("n", "<leader>1", ":Lex 30<cr>", opts)

-- " Using Lua functions
-- nnoremap hleader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
-- nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
-- nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
-- nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>fa", "<cmd>Telescope find_files hidden=true<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope oldfiles<cr>", opts)

-- Vim Test
keymap('n', '<Leader>tn', ':TestNearest<CR>', { silent = false })
keymap('n', '<Leader>tf', ':TestFile<CR>', { silent = false })
keymap('n', '<Leader>ts', ':TestSuite<CR>', { silent = false })
keymap('n', '<Leader>tl', ':TestLast<CR>', { silent = false })
keymap('n', '<Leader>tv', ':TestVisit<CR>', { silent = false })

