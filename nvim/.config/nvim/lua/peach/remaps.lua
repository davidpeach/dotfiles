vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "<Bslash>c", ":PhpactorContextMenu<cr>")
vim.keymap.set("n", "<Bslash>t", ":PhpactorTransform<cr>")
vim.keymap.set("n", "<Bslash>i", ":PhpactorImportClass<cr>")
vim.keymap.set("n", "<Bslash>e", ":PhpactorExtractExpression<cr>")
vim.keymap.set("v", "<Bslash>e", ":PhpactorExtractExpression<cr>")
--     au FileType php nmap <buffer> ,pc :PhpactorContextMenu<CR>
--     au FileType php nmap <buffer> ,pt :PhpactorTransform<CR>
--     au FileType php nmap <buffer> ,pi :PhpactorImportClass<CR>

--     au FileType php xmap <buffer> ,px :PhpactorExtractExpression<CR>

vim.keymap.set("n", "<Left>", ":bp<cr>")
vim.keymap.set("n", "<Right>", ":bn<cr>")
