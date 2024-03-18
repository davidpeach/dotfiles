return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
			opts = {
				custom_calculation = function(_, language_tree)
					if
						vim.bo.filetype == "blade"
						and language_tree._lang ~= "javascript"
						and language_tree._lang ~= "php"
					then
						return "{{-- %s --}}"
					end
				end,
			},
		},
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"bash",
				"blade",
				"c",
				"html",
				"javascript",
				"lua",
				"markdown",
				"php",
				"query",
				"vim",
				"vimdoc",
			},
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		parser_config.blade = {
			install_info = {
				url = "https://github.com/EmranMR/tree-sitter-blade",
				files = { "src/parser.c" },
				branch = "main",
			},
			filetype = "blade",
		}
	end,
}
