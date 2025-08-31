vim.pack.add({'https://github.com/nvim-telescope/telescope.nvim'})
vim.pack.add({'https://github.com/nvim-lua/plenary.nvim'});

vim.keymap.set("n", "<space>ff", require('telescope.builtin').find_files)
vim.keymap.set("n", "<space>f/", require('telescope.builtin').live_grep)
vim.keymap.set("n", "<space>fw", require('telescope.builtin').grep_string)
vim.keymap.set("n", "<space>fr", require('telescope.builtin').resume)
vim.keymap.set("n", "<space>fb", require('telescope.builtin').buffers)
