return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- @type lspconfig.options
      servers = {
        intelephense = {
          filetypes = { "php" },
          settings = {
            intelephense = {
              filetypes = { "php" },
              files = {
                associations = { "*.php" }, -- Associating .blade.php files as well
                maxSize = 5000000,
              },
            },
          },
        },
      },
    },
  },
}
