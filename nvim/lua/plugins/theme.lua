return { {
  "scottmckendry/cyberdream.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("cyberdream").setup({
      variant = "default",
      -- transparent = true,
      -- italic_comments = true,
      -- hide_fillchars = true,
      -- terminal_colors = false,
      cache = true,
      -- borderless_pickers = true,
      -- overrides = function(c)
      --   return {
      --     CursorLine = { bg = c.bg },
      --     CursorLineNr = { fg = c.magenta },
      --   }
      -- end,
    })

    vim.cmd("colorscheme cyberdream")
  end,

} }
