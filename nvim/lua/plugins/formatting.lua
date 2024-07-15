return {
  "stevearc/conform.nvim",
  enabled = true,
  config = function()
    require("conform").setup({
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 2000,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { "mystylua" },
        -- php = { "pint" },
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
    })
    require("conform").formatters.injected = {
      -- Set the options field
      options = {
        ignore_errors = false,
        -- Map of treesitter language to file extension
        -- A temporary file name with this extension will be generated during formatting
        -- because some formatters care about the filename.
        lang_to_ext = {
          bash = "sh",
          c_sharp = "cs",
          elixir = "exs",
          javascript = "js",
          julia = "jl",
          latex = "tex",
          markdown = "md",
          php = "php",
          python = "py",
          ruby = "rb",
          rust = "rs",
          teal = "tl",
          r = "r",
          typescript = "ts",
        },
        -- Map of treesitter language to formatters to use
        -- (defaults to the value from formatters_by_ft)
        lang_to_formatters = {},
      },
    }
  end,
}
