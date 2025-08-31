vim.pack.add({ "https://github.com/mfussenegger/nvim-dap" })
vim.pack.add({ "https://github.com/rcarriga/nvim-dap-ui" })
vim.pack.add({ "https://github.com/theHamsta/nvim-dap-virtual-text" })
vim.pack.add({ "https://github.com/nvim-neotest/nvim-nio" })

local dap = require("dap")
dap.adapters.php = {
	type = "executable",
	command = "node",
	args = { os.getenv("HOME") .. "/vscode-php-debug/out/phpDebug.js" },
}

dap.configurations.php = {
	{
		type = "php",
		request = "launch",
		name = "Listen for Xdebug",
		port = 9003,
		pathMappings = {
			["/var/www/html"] = "${workspaceFolder}",
		},
	},
}

-- Keybindings

require("nvim-dap-virtual-text").setup({
	enabled = true,
})
require("dapui").setup({
	icons = { expanded = "", collapsed = "", current_frame = "" },
	mappings = {
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	element_mappings = {},
	expand_lines = vim.fn.has("nvim-0.7") == 1,
	layouts = {
		{
			elements = {
				{ id = "scopes", size = 0.25 },
				"breakpoints",
				"stacks",
				"watches",
			},
			size = 80, -- 80 columns
			position = "left",
		},
		{
			elements = {
				"repl",
				"console",
			},
			size = 0.25, -- 25% of total lines
			position = "bottom",
		},
	},
	controls = {
		enabled = true,
		element = "repl",
		icons = {
			pause = "",
			play = "",
			step_into = "",
			step_over = "",
			step_out = "",
			step_back = "",
			run_last = "",
			terminate = "",
		},
	},
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		border = "single", -- Border style. Can be "single", "double" or "rounded"
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
	render = {
		max_type_length = nil, -- Can be integer or nil.
		max_value_lines = 100, -- Can be integer or nil.
	},
})

vim.keymap.set("n", ",b", ":lua require'dap'.toggle_breakpoint()<CR>")

vim.keymap.set("n", ",c", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", ",v", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", ",i", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", ",o", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", ",dt", ":lua require'dapui'.toggle({reset = true})<CR>")
vim.keymap.set("n", ",dr", ":lua require'dapui'.open({reset = true})<CR>")
vim.keymap.set("n", ",dk", "<cmd>DapTerminate<cr>")
