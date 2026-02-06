vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
  notify_on_error = false,
	formatters_by_ft = {
		php = { "pint" },
		lua = { "stylua" },
	},
  formatters = {
    mystylua = {
      command = "stylua",
      args = { "--indent-type", "Spaces", "--indent-width", "2", "-" },
    },
    pint = {
      -- Path to pint (when installed with Mason)
      -- Change to vendor/bin/pint if using project version.
      command = "/vendor/bin/pint",
      args = { "$FILENAME" },
      stdin = false,
    },
  },
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		-- require("conform").format({ bufnr = args.buf })
	end,
})
