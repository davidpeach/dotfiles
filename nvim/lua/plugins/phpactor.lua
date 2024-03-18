return {
	'phpactor/phpactor',
	version = "*",
	ft = { "php", "blade" },
	build = "composer install --no-dev -o",
	keys = {
		vim.keymap.set("n", ",i", ":PhpactorImportClass<cr>", { desc = "PHP Import Class" }),
		vim.keymap.set("n", ",I", ":PhpactorImportMissingClasses<cr>", { desc = "PHP Import Missing Classes" }),
		vim.keymap.set("n", ",e", ":PhpactorExtractExpression<cr>", { desc = "PHP Extract expression to variable." }),
		vim.keymap.set({"n", "v"}, ",x", "<cmd>PhpactorExtractMethod<cr>", { desc = "PHP Extract selection to method." }),
	},
}
