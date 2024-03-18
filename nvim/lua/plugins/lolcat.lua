return {
	"davidpeach/lolcat.nvim",
	dependencies = {
		{
			"ellisonleao/dotenv.nvim",
		},
	},
	dev = true,
	config = function()
		require('dotenv').setup({})
		require'lolcat'.setup({})
	end
}
