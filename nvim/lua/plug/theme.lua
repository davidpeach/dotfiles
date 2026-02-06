-- vim.pack.add({
-- 	{
-- 		src = "https://github.com/scottmckendry/cyberdream.nvim",
-- 	},
-- })
--
-- require("cyberdream").setup({
-- 	variant = "dark",
-- 	-- transparent = true,
-- 	italic_comments = true,
-- 	-- hide_fillchars = true,
-- 	-- terminal_colors = false,
-- 	cache = true,
-- 	-- borderless_pickers = true,
-- 	-- overrides = function(c)
-- 	--   return {
-- 	--     CursorLine = { bg = c.bg },
-- 	--     CursorLineNr = { fg = c.magenta },
-- 	--   }
-- 	-- end,
-- })

vim.pack.add({ "https://github.com/ellisonleao/gruvbox.nvim" })
-- vim.pack.add({ "https://github.com/huyvohcmc/atlas.vim" })

vim.cmd([[colorscheme gruvbox]])
