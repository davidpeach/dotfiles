return {
  {
    "quarto-dev/quarto-nvim",
    ft = { "quarto", "r", "rmd" },
    dependencies = {
      -- Your specific options for the otter.nvim dependency
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
      -- The required slime plugin dependency
      { "jpalardy/vim-slime" },
    },
    -- Your original, detailed opts for quarto-nvim itself
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
        default_method = "slime",
        never_run = { "yaml" },
      },
      keymap = {
        hover = "K",
        definition = "gd",
        type_definition = "gD",
        rename = "<leader>lR",
        format = "<leader>lf",
        references = "gr",
        document_symbols = "gS",
      },
    },
    config = function(_, opts)
      -- This config function runs after the plugin loads

      -- 1. Configure the slime runner to target tmux
      vim.g.slime_target = "tmux"
      vim.g.slime_dont_ask_default = 1

      -- 2. Set up the quarto-nvim plugin itself
      require("quarto").setup(opts)

      -- 3. Create the keymaps to send code to the terminal
      local map = vim.keymap.set
      local qts_opts = { desc = "Quarto: Send Code" }
      map({ "n", "v" }, "<leader>ss", "<Cmd>QuartoSend<CR>", qts_opts)
      qts_opts.desc = "Quarto: Run All Code"
      map("n", "<leader>sa", "<Cmd>QuartoSendAll<CR>", qts_opts)
    end,
  },
}
