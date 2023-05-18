local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<Bslash><leader>", mark.add_file)
vim.keymap.set("n", "<Bslash>g", ui.toggle_quick_menu)
vim.keymap.set("n", "<Bslash>v", function() ui.nav_file(1) end)
vim.keymap.set("n", "<Bslash>b", function() ui.nav_file(2) end)
vim.keymap.set("n", "<Bslash>n", function() ui.nav_file(3) end)
vim.keymap.set("n", "<Bslash>m", function() ui.nav_file(4) end)
