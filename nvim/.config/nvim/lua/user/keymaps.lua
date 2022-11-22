local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }

local keymap = vim.keymap.set

-- Set my <Leader> key as <Space> bar.
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<leader><leader>pf", ":!vendor/bin/pint && vendor/bin/phpstan<CR>", opts)

-- Easier window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Easier buffer navigation
keymap("n", "<Left>", ":bp<cr>", opts)
keymap("n", "<Right>", ":bn<cr>", opts)
keymap("n", "<Leader>bd", ":bd<cr>", opts)
keymap("n", "<Leader>bo", ":%bd|e#<cr>", opts)
-- Open file drawer
-- keymap("n", "<leader>1", ":Lex 30<cr>", opts)
keymap("n", "<leader>1", ":NvimTreeToggle<cr>", opts)

-- File Searching
-- Vim Test
keymap('n', '<Leader>tn', ':TestNearest<CR>', { silent = false })
keymap('n', '<Leader>tf', ':TestFile<CR>', { silent = false })
keymap('n', '<Leader>ts', ':TestSuite<CR>', { silent = false })
keymap('n', '<Leader>tl', ':TestLast<CR>', { silent = false })
keymap('n', '<Leader>tv', ':TestVisit<CR>', { silent = false })

keymap('n', '<F1>', ':FloatermToggle scratch<CR>', opts)
keymap('t', '<F1>', '<C-\\><C-n>:FloatermToggle scratch<CR>', opts)

