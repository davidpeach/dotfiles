require("mason").setup()
require("mason-lspconfig").setup()

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
})

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    return
end

local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig').sumneko_lua.setup({
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
        },
    },
})

require('lspconfig').volar.setup({
    capabilities = capabilities,
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
});

require('lspconfig').intelephense.setup({
    capabilities = capabilities
});
require('lspconfig').astro.setup({
    capabilities = capabilities
});
require('lspconfig').tsserver.setup({
    capabilities = capabilities
});
-- require('lspconfig')['phpactor'].setup({
--     capabilities = capabilities,
--     flags = {
--         debounce_text_changes = 150,
--     },
--     init_options = {
--         ["language_server.diagnostics_on_update"] = false,
--     }
-- })

vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set("n", "<leader>o", "<cmd>lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>')
vim.keymap.set("n", "gl", '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>')
vim.keymap.set( "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>')
vim.keymap.set( "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>")

vim.api.nvim_create_user_command('Format', vim.lsp.buf.formatting, {})

vim.diagnostic.config({
    virtual_text = false,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = true,
        header = "",
        prefix = "",
        format = function(diagnostic)
            if diagnostic.user_data ~= nil and diagnostic.user_data.lsp.code ~= nil then
                return string.format("%s: %s", diagnostic.user_data.lsp.code, diagnostic.message)
            end
            return diagnostic.message
        end,
    },
})

vim.fn.sign_define("DiagnosticSignError", { texthl = "DiagnosticSignError", text = "", numhl = "" })
vim.fn.sign_define("DiagnosticSignWarn", { texthl = "DiagnosticSignWarn", text = "", numhl = "" })
vim.fn.sign_define("DiagnosticSignHint", { texthl = "DiagnosticSignHint", text = "", numhl = "" })
vim.fn.sign_define("DiagnosticSignInfo", { texthl = "DiagnosticSignInfo", text = "", numhl = "" })

