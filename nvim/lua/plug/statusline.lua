vim.pack.add({'https://github.com/nvim-tree/nvim-web-devicons'});
vim.pack.add({'https://github.com/nvim-lualine/lualine.nvim'});

require("lualine").setup({
    options = {
      theme = "auto",
      globalstatus = true,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "filename", "branch", "diff", "diagnostics" },
      lualine_c = { "" },
      lualine_x = { "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  });
