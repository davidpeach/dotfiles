-- Disabled cuz I dunno what it actually affects.
-- vim.keymap.set("", "<Space>", "<Nop>", { noremap = true, silent = true })

-- Easier window navigation.
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- Easier buffer navigation.
vim.keymap.set("n", "<Left>", ":bp<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<Right>", ":bn<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<Down>", ":bd<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<Up>", ":%bd<cr>", { noremap = true, silent = true })

-- Open Netrw file drawer.
vim.keymap.set("n", "<leader>1", ":Lex 30<cr>", { noremap = true, silent = true })

