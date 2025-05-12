return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim', build = 'make'
    }
  },
  config = function()
    vim.keymap.set("n", "<space>ff", require('telescope.builtin').find_files)
    vim.keymap.set("n", "<space>f/", require('telescope.builtin').live_grep)
    vim.keymap.set("n", "<space>fw", require('telescope.builtin').grep_string)
    vim.keymap.set("n", "<space>fr", require('telescope.builtin').resume)
    vim.keymap.set("n", "<space>fb", require('telescope.builtin').buffers)

    pcall(require("telescope").load_extension, "fzf")
  end
}
