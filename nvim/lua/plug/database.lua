vim.pack.add({ "https://github.com/tpope/vim-dadbod" })
vim.pack.add({ "https://github.com/kristijanhusak/vim-dadbod-ui" })
vim.pack.add({ "https://github.com/kristijanhusak/vim-dadbod-completion" })

vim.keymap.set("n", "<leader>db", "<cmd>DBUIToggle<cr>")
vim.g.db_ui_use_nerd_fonts = 1
vim.cmd([[
let g:db_ui_table_helpers = {
\  'postgresql': {
\    'Workshop Clean': 'delete from "history"; delete from "order_sku"; delete from "order"; delete from "order_sku_component"; delete from "component"; delete from "problem"; delete from "box"; delete from "country"; delete from "category"; delete from "size"; delete from "finish"; delete from "legs"; delete from "component_type"; delete from "machine"; delete from "stage"; delete from "barn"; delete from "department"; delete from "role"; delete from "product";'
\  },
\  'mysql': {
\    'OC Admin Clean': 'delete from cutting_list_meta; delete from cutting_master;'
\  }
\}
]])
