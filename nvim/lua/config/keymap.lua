vim.keymap.set("n", "<space>e", "<cmd>Oil<CR>")

vim.keymap.set("n", "<esc>", "<cmd>noh<cr><esc>", { silent = true })

vim.keymap.set("n", "gd", vim.lsp.buf.definition)

vim.keymap.set("n", "<space>we", "<cmd>wincmd =<cr>")
vim.keymap.set("n", "<space>wm", "<cmd>wincmd |<cr>")
vim.keymap.set("n", "<space>wo", "<cmd>only<cr>")
