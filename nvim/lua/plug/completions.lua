vim.pack.add({'https://github.com/saghen/blink.cmp'})

require('blink.cmp').setup({
    keymap = { preset = 'default' },
    fuzzy = { implementation = "lua" },
    completion = {
      menu = { border = 'single' },
      list = {
        max_items = 10,
      },
      ghost_text = {enabled = false}
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono'
    },
    -- sources = {
    --   default = { 'lsp', 'path', 'snippets', 'buffer', 'emoji' },
    --   per_filetype = {
    --     mysql = { 'snippets', 'dadbod', 'buffer' },
    --     -- markdown = { 'md' }
    --   },
    --   providers = {
    --     lsp = {
    --       name = "LSP",
    --       module = 'blink.cmp.sources.lsp',
    --       transform_items = function(a, items)
    --         for _, item in ipairs(items) do
    --           if item.client_name ~= 'marksman' then goto continue end
    --           item.textEdit.newText = item.filterText
    --           ::continue::
    --         end
    --
    --         return items
    --       end
    --     },
    --     dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
    --     emoji = {
    --       module = "blink-emoji",
    --       name = "Emoji",
    --       score_offset = 15,        -- Tune by preference
    --       opts = { insert = true }, -- Insert emoji (default) or complete its name
    --       should_show_items = function()
    --         return vim.tbl_contains(
    --         -- Enable emoji completion only for git commits and markdown.
    --         -- By default, enabled for all file-types.
    --           { "gitcommit", "markdown", "sh" },
    --           vim.o.filetype
    --         )
    --       end,
    --     }
    --
    --   },
    -- },

});
