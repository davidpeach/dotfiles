return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "williamboman/mason.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    {
      "hedyhli/outline.nvim",
      lazy = true,
      cmd = { "Outline", "OutlineOpen" },
      opts = {
        -- Your setup opts here
      },
    },
  },
  config = function()
    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
        map("gs", function()
          vim.cmd([[
            vsplit
          ]])
          vim.lsp.buf.definition()
        end, "[G]oto definition in [S]plit")
        map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
        map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplentations")
        map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
        map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
        map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
        map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
        map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
        map("K", vim.lsp.buf.hover, "Hover Documentation")
        map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

    if capabilities.workspace == nil then
      capabilities.workspace = {}
      capabilities.workspace.didChangeWatchedFiles = {}
    end
    capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

    local servers = {
      lua_ls = {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
              checkThirdParty = false,
              -- Tells lua_ls where to find all the Lua files that you have loaded
              -- for your neovim configuration.
              library = {
                "${3rd}/luv/library",
                unpack(vim.api.nvim_get_runtime_file("", true)),
              },
              -- If lua_ls is really slow on your computer, you can try this instead:
              -- library = { vim.env.VIMRUNTIME },
            },
            completion = {
              callSnippet = "Replace",
            },
            telemetry = {
              enable = false,
            },
            -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
            -- diagnostics = { disable = { 'missing-fields' } },
          },
        },
      },
      marksman = {
        filetypes = { "markdown", "quarto" },
        root_dir = require("lspconfig").util.root_pattern(".git", ".marksman.toml", "_quarto.yml"),
      },
      jsonls = {},
      html = {
        filetypes = { "html" },
        configurationSection = { "html", "css", "javascript", "php" },
        embeddedLanguages = {
          css = true,
          javascript = true,
          php = true,
        },
        provideFormatter = true,
      },
      intelephense = {
        filetypes = { "php", "blade" },
        settings = {
          intelephense = {
            files = {
              maxSize = {
                type = "number",
                default = 1000000,
                description = "Maximum file size in bytes.",
                scope = "window",
              },
            },
          },
        },
      },
      pyright = {
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = false,
              diagnosticMode = "workspace",
            },
          },
        },
        root_dir = function(fname)
          return require("lspconfig").util.root_pattern(
            ".git",
            "setup.py",
            "setup.cfg",
            "pyproject.toml",
            "requirements.txt"
          )(fname) or require("lspconfig").util.path.dirname(fname)
        end,
      },
      r_language_server = {
        -- filetypes = { "r", "quarto" },
        settings = {
          r = {
            lsp = {
              rich_documentation = false,
            },
          },
        },
      },
      tailwindcss = {
        filetypes = {
          "blade",
        },
      },
    }

    require("mason").setup()
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      "stylua",
      "black",
      "r_language_server",
    })
    require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

    require("mason-lspconfig").setup({
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          -- This handles overriding only values explicitly passed
          -- by the server configuration above. Useful when disabling
          -- certain features of an LSP (for example, turning off formatting for tsserver)
          server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
          require("lspconfig")[server_name].setup(server)
        end,
      },
    })
  end,
}
