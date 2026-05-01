vim.keymap.set("n", "<space>e", "<cmd>Oil<CR>")

vim.keymap.set("n", "<esc>", "<cmd>noh<cr><esc>", { silent = true })

vim.keymap.set("n", "gd", vim.lsp.buf.definition)

vim.keymap.set("n", "<space>we", "<cmd>wincmd =<cr>")
vim.keymap.set("n", "<space>wm", "<cmd>wincmd |<cr>")
vim.keymap.set("n", "<space>wo", "<cmd>only<cr>")
vim.keymap.set("n", "<M-t>", "<cmd>tabnew<cr>")
vim.keymap.set("n", "<M-h>", "<cmd>tabprevious<cr>")
vim.keymap.set("n", "<M-l>", "<cmd>tabnext<cr>")
vim.keymap.set("n", "<M-j>", "<cmd>tabclose<cr>")

