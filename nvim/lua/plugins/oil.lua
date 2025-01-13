return {
  {
    'stevearc/oil.nvim',
    opts = {
      view_options = {
        show_hidden = true,
      },
      use_default_keymaps = false,
      keymaps = {
        ["<CR>"] = "actions.select",
        ["<C-t>"] = { "actions.select", opts = { tab = true } },
        ["<C-p>"] = "actions.preview",
        ["-"] = { "actions.parent", mode = "n" },
        ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
        ["g."] = { "actions.toggle_hidden", mode = "n" },
      },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  }
}
