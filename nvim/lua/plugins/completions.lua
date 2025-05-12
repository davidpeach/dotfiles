return { {
  'saghen/blink.cmp',
  dependencies = {
    -- 'rafamadriz/friendly-snippets',
    'moyiz/blink-emoji.nvim',
  },
  version = '1.*',
  opts = {
    keymap = { preset = 'default' },

    completion = {
      menu = { border = 'single' }
    },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono'
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'emoji' },
      per_filetype = {
        mysql = { 'snippets', 'dadbod', 'buffer' },
      },
      providers = {
        dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
        emoji = {
          module = "blink-emoji",
          name = "Emoji",
          score_offset = 15,        -- Tune by preference
          opts = { insert = true }, -- Insert emoji (default) or complete its name
          should_show_items = function()
            return vim.tbl_contains(
            -- Enable emoji completion only for git commits and markdown.
            -- By default, enabled for all file-types.
              { "gitcommit", "markdown", "sh" },
              vim.o.filetype
            )
          end,
        }

      },
    },


  },
  opts_extend = { "sources.default" }
} }
