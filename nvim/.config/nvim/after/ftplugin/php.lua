
vim.cmd('setlocal commentstring=//%s')
-- PHP Bindings with <Bslash> leader.
vim.keymap.set("n", "<Bslash>c", ":PhpactorContextMenu<cr>", { desc = "Context Menu" })
vim.keymap.set("n", "<Bslash>t", ":PhpactorTransform<cr>", { desc = "Transform" })
vim.keymap.set("n", "<Bslash>i", ":PhpactorImportClass<cr>", { desc = "Import Class" })
vim.keymap.set("n", "<Bslash>e", ":PhpactorExtractExpression<cr>", { desc = "Extract Expression" })
vim.keymap.set("v", "<Bslash>e", ":PhpactorExtractExpression<cr>", { desc = "Extract Expression" })
vim.keymap.set("n", "<Bslash>p", ":!./vendor/bin/pint %<cr>", { desc = "Format using Pint" })
vim.keymap.set("n", "<Bslash>s", ":!./vendor/bin/phpstan analyse --memory-limit 2G %<cr>", { desc = "Run through PHP Stan" })
