return {
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>gc", "<cmd>Git checkout ")
      vim.keymap.set("n", "<leader>gg", "<cmd>Git ")
      vim.keymap.set("n", "<leader>gl", "<cmd>Git log ")
      vim.keymap.set("n", "<leader>gm", "<cmd>Git merge ")
      vim.keymap.set("n", "<leader>go", "<cmd>Git<cr>")
      vim.keymap.set("n", "<leader>gp", "<cmd>Git push<cr>")
      vim.keymap.set("n", "<leader>gu", "<cmd>Git pull<cr>")
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, { expr = true, desc = "  Go to next hunk" })

          map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, { expr = true, desc = "  Go to previous hunk" })

          -- Actions
          map('n', '<leader>gs', gs.stage_hunk, { desc = "  Stage hunk" })
          map('n', '<leader>gr', gs.reset_hunk, { desc = "  Reset hunk" })
          map('v', '<leader>gs',
            function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
            { desc = "  Stage hunk" })
          map('v', '<leader>gr',
            function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
            { desc = "  Reset hunk" })
          map('n', '<leader>gS', gs.stage_buffer, { desc = "  Stage buffer" })
          map('n', '<leader>gU', gs.undo_stage_hunk, { desc = "  Undo stage hunk" })
          map('n', '<leader>gR', gs.reset_buffer, { desc = "  Reset buffer" })
          map('n', '<leader>gP', gs.preview_hunk, { desc = "  Preview hunk" })
          map('n', '<leader>gB', function() gs.blame_line { full = true } end,
            { desc = "  Blame line" })
          map('n', '<leader>gb', gs.toggle_current_line_blame,
            { desc = "  Toggle blame line" })
          map('n', '<leader>gd', gs.diffthis, { desc = "  Diff this" })
          map('n', '<leader>gD', function() gs.diffthis('~') end,
            { desc = "  Diff this ~" })
          map('n', '<leader>gt', gs.toggle_deleted, { desc = "  Toggle Deleted" })

          -- Text object
          map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end
      });
    end
  }
}
