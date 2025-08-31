vim.pack.add({ "https://github.com/tpope/vim-dadbod" })
vim.pack.add({ "https://github.com/kristijanhusak/vim-dadbod-ui" })
vim.pack.add({ "https://github.com/kristijanhusak/vim-dadbod-completion" })

vim.keymap.set("n", "<leader>db", "<cmd>DBUIToggle<cr>")
vim.g.db_ui_use_nerd_fonts = 1
