vim.pack.add({ "https://github.com/nvim-tree/nvim-web-devicons" })
vim.pack.add({ "https://github.com/nvim-lualine/lualine.nvim" })

local custom_gruvbox = require("lualine.themes.gruvbox")

-- Change the background of lualine_c section for normal mode
custom_gruvbox.normal.c.bg = "#282828"
custom_gruvbox.insert.c.bg = "#282828"
custom_gruvbox.visual.c.bg = "#282828"
custom_gruvbox.command.c.bg = "#282828"
require("lualine").setup({
	options = {
		theme = custom_gruvbox,
		globalstatus = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "filename", "branch", "diff", "diagnostics" },
		lualine_c = { "" },
		lualine_x = { "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})
