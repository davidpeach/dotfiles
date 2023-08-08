vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set('i', ';;', '<Esc>A;<Esc>')

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

vim.keymap.set("n", "<C-[>", ":bp<cr>")
vim.keymap.set("n", "<C-]>", ":bn<cr>")


vim.keymap.set("n", "<M-o>", ":cope<cr>")
vim.keymap.set("n", "<M-c>", ":ccl<cr>")
vim.keymap.set("n", "<M-b>", ":tabprevious<cr>")
vim.keymap.set("n", "<M-n>", ":tabedit %<cr>")
vim.keymap.set("n", "<M-m>", ":tabnext<cr>")
