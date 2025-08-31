vim.pack.add({'https://github.com/stevearc/conform.nvim'});

require("conform").setup({
  formatters_by_ft = {
    php = { "pint" },
    lua = { "stylua" }
  },
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
