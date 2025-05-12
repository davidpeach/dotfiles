return { {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "williamboman/mason.nvim",
  },
  enabled = false,
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
      callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if not client then return end
        if client:supports_method('textDocument/formatting') then
          if vim.bo.filetype == 'html' then
            return
          end
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = event.buf,
            callback = function()
              vim.lsp.buf.format({
                bufnr = event.buf,
                id = client.id
              })
            end,
          })
        end

        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
        end

        local ts = require("telescope.builtin")

        map("gd", ts.lsp_definitions, "[G]oto [D]efinition")
        map("gs", function()
          vim.cmd([[
            vsplit
          ]])
          vim.lsp.buf.definition()
        end, "[G]oto definition in [S]plit")
        map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
        map("gi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplentations")
        map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
        map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
        -- map("K", vim.lsp.buf.hover, "Hover Documentation")
        map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()

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
                unpack(vim.api.nvim_get_runtime_file("",
                  true)),
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
        root_dir = require("lspconfig").util.root_pattern(".git", ".marksman.toml",
          "_quarto.yml"),
      },
      jsonls = {},
      gopls = {
        settings = {
          gopls = {
            gofumpt = true,
          }
        }
      },
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
                description =
                "Maximum file size in bytes.",
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
          )(fname) or vim.fs.dirname(fname)
        end,
      },
      r_language_server = {
        cmd = { "R", "--slave", "-e", "languageserver::run()" },
        filetypes = { "r", "rmd" },
        settings = {
          r = {
            lsp = {
              rich_documentation = false,
            },
          },
        },
      },
      bashls = {
        cmd = { "bash-language-server", "start" },
      },
      tailwindcss = {
        filetypes = {
          "blade",
        },
      },
      ts_ls = {
        filetypes = {
          "javascript",
          "typescript",
        },
      },
    }

    require("mason").setup()
    local ensure_installed = vim.tbl_keys(servers or {})

    require("mason-lspconfig").setup({
      ensure_installed = ensure_installed,
      automatic_installation = true,
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          -- This handles overriding only values explicitly passed
          -- by the server configuration above. Useful when disabling
          -- certain features of an LSP (for example, turning off formatting for tsserver)
          server.capabilities = vim.tbl_deep_extend("force", {}, capabilities,
            server.capabilities or {})
          require("lspconfig")[server_name].setup(server)
        end,
      },
    })
  end,
} }
