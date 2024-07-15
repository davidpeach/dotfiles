return {
  "quarto-dev/quarto-nvim",
  ft = { "quarto" },
  dependencies = {
    {
      "jmbuhr/otter.nvim",
      opts = {
        buffers = {
          set_filetype = true,
          write_to_disk = true,
        },
        handle_leading_whitespace = true,
      },
    },
  },
  opts = {
    debug = false,
    closePreviewOnExit = true,
    lspFeatures = {
      enabled = true,
      chunks = "curly",
      languages = { "r", "python", "julia", "bash", "html", "php" },
      diagnostics = {
        enabled = true,
        triggers = { "BufWritePost" },
      },
      completion = {
        enabled = true,
      },
    },
    codeRunner = {
      enabled = true,
      default_method = "slime", -- 'molten' or 'slime'
      ft_runners = {}, -- filetype to runner, ie. `{ python = "molten" }`.
      -- Takes precedence over `default_method`
      never_run = { "yaml" }, -- filetypes which are never sent to a code runner
    },
    -- keymap = false,
    keymap = {
      -- set whole section or individual keys to `false` to disable
      hover = "K",
      definition = "gd",
      type_definition = "gD",
      rename = "<leader>lR",
      format = "<leader>lf",
      references = "gr",
      document_symbols = "gS",
    },
  },
}
