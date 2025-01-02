return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    vim.keymap.set("n", "<space>ff", require('telescope.builtin').find_files)
    vim.keymap.set("n", "<space>f/", require('telescope.builtin').live_grep)

    pcall(require("telescope").load_extension, "fzf")
  end
}
