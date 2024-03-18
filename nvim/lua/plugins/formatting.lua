return {
	"stevearc/conform.nvim",
	opts = {
		notify_on_error = false,
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
		formatters_by_ft = {
			lua = { "mystylua" },
			php = { "pint" },
			python = { "isort", "black" },
		},

		formatters = {
			mystylua = {
				command = "stylua",
				args = { "--indent-type", "Spaces", "--indent-width", "2", "-" },
			},
			pint = {
				-- Path to pint (when installed with Mason)
				-- Change to vendor/bin/pint if using project version.
				command = vim.fn.stdpath("data") .. "/mason/bin/pint",
				args = { "$FILENAME" },
				stdin = false,
			},
		},
	},
}
