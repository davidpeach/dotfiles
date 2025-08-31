vim.pack.add({ "https://github.com/vim-test/vim-test" })
vim.pack.add({ "https://github.com/christoomey/vim-tmux-runner" })

vim.g["test#strategy"] = "vtr"
vim.g["test#vtr#orientation"] = "h"
vim.g["test#echo_command"] = 0
vim.g.VtrOrientation = "h"
vim.g.VtrClearSequence = ""
vim.g.vrc_trigger = "<C-c>"

vim.keymap.set(
	"n",
	",ta",
	"<cmd>silent !tmux split-window -hd<cr><cmd>silent VtrAttachToPane 2<cr><cmd>silent !dunstify 'Test mode activated'<cr>"
)
vim.keymap.set("n", ",td", "<cmd>silent :VtrKillRunner<cr><cmd>silent !dunstify 'Test mode deactivated'<cr>")
vim.keymap.set("n", ",tr", "<cmd>silent :VtrAttachToPane<cr><cmd>silent !dunstify 'Reattached to pane'<cr>")

vim.keymap.set("n", ",f", "<cmd>TestFile<cr>")
vim.keymap.set("n", ",l", "<cmd>TestLast<cr>")
vim.keymap.set("n", ",n", "<cmd>TestNearest<cr>")
vim.keymap.set("n", ",s", "<cmd>TestSuite<cr>")
vim.keymap.set("n", ",p", "<cmd>TestVisit<cr>")
