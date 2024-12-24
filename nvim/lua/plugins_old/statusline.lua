return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      theme = "nightfly",
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
  },
}
