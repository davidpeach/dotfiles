return {
  "quarto-dev/quarto-nvim",
  ft = { "quarto" },
  dependencies = {
    {
      "jmbuhr/otter.nvim",
      opts = {
        buffers = {
          set_filetype = true,
          write_to_disk = true,
        },
        handle_leading_whitespace = true,
      },
    },
  },
  opts = {
    debug = false,
    closePreviewOnExit = true,
    lspFeatures = {
      enabled = true,
      chunks = "curly",
      languages = { "r", "python", "julia", "bash", "html", "php" },
      diagnostics = {
        enabled = true,
        triggers = { "BufWritePost" },
      },
      completion = {
        enabled = true,
      },
    },
    codeRunner = {
      enabled = true,
      default_method = "slime", -- 'molten' or 'slime'
      ft_runners = {}, -- filetype to runner, ie. `{ python = "molten" }`.
      -- Takes precedence over `default_method`
      never_run = { "yaml" }, -- filetypes which are never sent to a code runner
    },
    -- keymap = false,
    keymap = {
      -- set whole section or individual keys to `false` to disable
      hover = "K",
      definition = "gd",
      type_definition = "gD",
      rename = "<leader>lR",
      format = "<leader>lf",
      references = "gr",
      document_symbols = "gS",
    },
  },

  --{
  --  'neovim/nvim-lspconfig',

  --    lspconfig.yamlls.setup {
  --      capabilities = capabilities,
  --      flags = lsp_flags,
  --      settings = {
  --        yaml = {
  --          schemaStore = {
  --            enable = true,
  --            url = '',
  --          },
  --        },
  --      },
  --    }

  --    local function get_quarto_resource_path()
  --      local function strsplit(s, delimiter)
  --        local result = {}
  --        for match in (s .. delimiter):gmatch('(.-)' .. delimiter) do
  --          table.insert(result, match)
  --        end
  --        return result
  --      end

  --      local f = assert(io.popen('quarto --paths', 'r'))
  --      local s = assert(f:read '*a')
  --      f:close()
  --      return strsplit(s, '\n')[2]
  --    end

  --    local lua_library_files = vim.api.nvim_get_runtime_file('', true)
  --    local lua_plugin_paths = {}
  --    local resource_path = get_quarto_resource_path()
  --    if resource_path == nil then
  --      vim.notify_once 'quarto not found, lua library files not loaded'
  --    else
  --      table.insert(lua_library_files, resource_path .. '/lua-types')
  --      table.insert(lua_plugin_paths, resource_path .. '/lua-plugin/plugin.lua')
  --    end

  --    lspconfig.lua_ls.setup {
  --      capabilities = capabilities,
  --      flags = lsp_flags,
  --      settings = {
  --        Lua = {
  --          completion = {
  --            callSnippet = 'Replace',
  --          },
  --          runtime = {
  --            version = 'LuaJIT',
  --            plugin = lua_plugin_paths,
  --          },
  --          diagnostics = {
  --            globals = { 'vim', 'quarto', 'pandoc', 'io', 'string', 'print', 'require', 'table' },
  --            disable = { 'trailing-space' },
  --          },
  --          workspace = {
  --            library = lua_library_files,
  --            checkThirdParty = false,
  --          },
  --          telemetry = {
  --            enable = false,
  --          },
  --        },
  --      },
  --    }

  --    lspconfig.bashls.setup {
  --      capabilities = capabilities,
  --      flags = lsp_flags,
  --      filetypes = { 'sh', 'bash' },
  --    }
  --  end,
  --},

  -- { -- Autoformat
  --   'stevearc/conform.nvim',
  --   enabled = true,
  --   config = function()
  --     require('conform').setup {
  --       notify_on_error = false,
  --       format_on_save = {
  --         timeout_ms = 500,
  --         lsp_fallback = true,
  --       },
  --       formatters_by_ft = {
  --         lua = { 'mystylua' },
  --         python = { 'isort', 'black' },
  --       },
  --       formatters = {
  --         mystylua = {
  --           command = 'stylua',
  --           args = { '--indent-type', 'Spaces', '--indent-width', '2', '-' },
  --         },
  --       },
  --     }
  --     -- Customize the "injected" formatter
  --   end,
  -- },

  -- completion
  --{
  --  'hrsh7th/nvim-cmp',
  --  event = 'InsertEnter',
  --  dependencies = {
  --    { 'hrsh7th/cmp-nvim-lsp-signature-help' },
  --    { 'hrsh7th/cmp-buffer' },
  --    { 'hrsh7th/cmp-emoji' },
  --    { 'f3fora/cmp-spell' },
  --    { 'ray-x/cmp-treesitter' },
  --    { 'kdheepak/cmp-latex-symbols' },
  --    { 'jmbuhr/cmp-pandoc-references' },
  --    { 'rafamadriz/friendly-snippets' },
  --    { 'onsails/lspkind-nvim' },
  --  },
  --  config = function()
  --    local cmp = require 'cmp'
  --    local luasnip = require 'luasnip'
  --    local lspkind = require 'lspkind'

  --    local has_words_before = function()
  --      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  --      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
  --    end

  --    cmp.setup {
  --      snippet = {
  --        expand = function(args)
  --          luasnip.lsp_expand(args.body)
  --        end,
  --      },
  --      completion = { completeopt = 'menu,menuone,noinsert' },
  --      mapping = {
  --        ['<C-f>'] = cmp.mapping.scroll_docs(-4),
  --        ['<C-d>'] = cmp.mapping.scroll_docs(4),

  --        ['<C-n>'] = cmp.mapping(function(fallback)
  --          if luasnip.expand_or_jumpable() then
  --            luasnip.expand_or_jump()
  --            fallback()
  --          end
  --        end, { 'i', 's' }),
  --        ['<C-p>'] = cmp.mapping(function(fallback)
  --          if luasnip.jumpable(-1) then
  --            luasnip.jump(-1)
  --          else
  --            fallback()
  --          end
  --        end, { 'i', 's' }),
  --        ['<C-e>'] = cmp.mapping.abort(),
  --        ['<c-y>'] = cmp.mapping.confirm {
  --          select = true,
  --        },
  --        ['<CR>'] = cmp.mapping.confirm {
  --          select = true,
  --        },

  --        ['<Tab>'] = cmp.mapping(function(fallback)
  --          if cmp.visible() then
  --            cmp.select_next_item()
  --          elseif has_words_before() then
  --            cmp.complete()
  --          else
  --            fallback()
  --          end
  --        end, { 'i', 's' }),
  --        ['<S-Tab>'] = cmp.mapping(function(fallback)
  --          if cmp.visible() then
  --            cmp.select_prev_item()
  --          else
  --            fallback()
  --          end
  --        end, { 'i', 's' }),

  --        ['<C-l>'] = cmp.mapping(function()
  --          if luasnip.expand_or_locally_jumpable() then
  --            luasnip.expand_or_jump()
  --          end
  --        end, { 'i', 's' }),
  --        ['<C-h>'] = cmp.mapping(function()
  --          if luasnip.locally_jumpable(-1) then
  --            luasnip.jump(-1)
  --          end
  --        end, { 'i', 's' }),
  --      },
  --      autocomplete = false,

  --      ---@diagnostic disable-next-line: missing-fields
  --      formatting = {
  --        format = lspkind.cmp_format {
  --          mode = 'symbol',
  --          menu = {
  --            otter = '[🦦]',
  --            nvim_lsp = '[LSP]',
  --            luasnip = '[snip]',
  --            buffer = '[buf]',
  --            path = '[path]',
  --            spell = '[spell]',
  --            pandoc_references = '[ref]',
  --            tags = '[tag]',
  --            treesitter = '[TS]',
  --            calc = '[calc]',
  --            latex_symbols = '[tex]',
  --            emoji = '[emoji]',
  --          },
  --        },
  --      },
  --      sources = {
  --        { name = 'otter' }, -- for code chunks in quarto
  --        { name = 'path' },
  --        { name = 'nvim_lsp' },
  --        { name = 'nvim_lsp_signature_help' },
  --        { name = 'luasnip', keyword_length = 3, max_item_count = 3 },
  --        { name = 'pandoc_references' },
  --        { name = 'buffer', keyword_length = 5, max_item_count = 3 },
  --        { name = 'spell' },
  --        { name = 'treesitter', keyword_length = 5, max_item_count = 3 },
  --        { name = 'calc' },
  --        { name = 'latex_symbols' },
  --        { name = 'emoji' },
  --      },
  --      view = {
  --        entries = 'native',
  --      },
  --      window = {
  --        documentation = {
  --          border = require('misc.style').border,
  --        },
  --      },
  --    }

  --    -- for friendly snippets
  --    require('luasnip.loaders.from_vscode').lazy_load()
  --    -- for custom snippets
  --    require('luasnip.loaders.from_vscode').lazy_load { paths = { vim.fn.stdpath 'config' .. '/snips' } }
  --    -- link quarto and rmarkdown to markdown snippets
  --    luasnip.filetype_extend('quarto', { 'markdown' })
  --    luasnip.filetype_extend('rmarkdown', { 'markdown' })
  --  end,
  --},

  -- paste an image from the clipboard or drag-and-drop
  -- {
  --   'HakonHarnes/img-clip.nvim',
  --   event = 'BufEnter',
  --   opts = {
  --     filetypes = {
  --       markdown = {
  --         url_encode_path = true,
  --         template = '![$CURSOR]($FILE_PATH)',
  --         drag_and_drop = {
  --           download_images = false,
  --         },
  --       },
  --       quarto = {
  --         url_encode_path = true,
  --         template = '![$CURSOR]($FILE_PATH)',
  --         drag_and_drop = {
  --           download_images = false,
  --         },
  --       },
  --     },
  --   },
  -- },

  -- preview equations
  -- {
  --   'jbyuki/nabla.nvim',
  --   keys = {
  --     { '<leader>qm', ':lua require"nabla".toggle_virt()<cr>', desc = 'toggle [m]ath equations' },
  --   },
  -- },
}
