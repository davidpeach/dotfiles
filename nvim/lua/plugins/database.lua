return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    {
      'tpope/vim-dadbod',
      lazy = true,
    },
  },
  -- lazy = false,
  config = function()
    vim.keymap.set("n", "<leader>db", "<cmd>DBUIToggle<cr>")
  end,
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1
  end,
}
