vim.pack.add({ "https://github.com/folke/trouble.nvim" })
require("trouble").setup()
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>")
