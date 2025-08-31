vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- require('config.lazy')
require("config.options")
require("config.keymap")
require("config.abbreviations")
require("plug.theme")
require("plug.oil")
require("plug.tmux")
require("plug.git")
require("plug.completions")
require("plug.mason")
require("plug.hover")
require("plug.telescope")
require("plug.statusline")
require("plug.conform")
require("plug.database")
require("plug.treesitter")
require("plug.trouble")
require("plug.testing")
require("plug.debugging")

vim.lsp.enable({ "tsserver", "intelephense", "lua" })

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if not client then
			return
		end

		if client.name == "marksman" then
			local original_handler = client.handlers["textDocument/completion"]
				or vim.lsp.handlers["textDocument/completion"]

			client.handlers["textDocument/completion"] = function(err, result, ctx, config)
				if result and result.items then
					for _, item in ipairs(result.items) do
						if item.insertText and string.find(item.insertText, "-") then
							item.insertText = string.gsub(item.insertText, "-", " ")
						end
						if item.label and string.find(item.label, "-") then
							item.label = string.gsub(item.label, "-", " ")
						end
					end
				end
				if original_handler then
					original_handler(err, result, ctx, config)
				end
			end
		end
	end,
})

-- vim.cmd([[
--   hi clear SpellBad
--   hi SpellBad cterm=underline guifg=#ff0000
-- ]])
