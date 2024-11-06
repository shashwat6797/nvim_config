local prettier = require("prettier")
local keymap = vim.keymap

prettier.setup({
	bin = "prettierd", -- or `'prettierd'` (v0.23.3+)
	filetypes = {
		"css",
		"graphql",
		"html",
		"java",
		"javascript",
		"javascriptreact",
		"json",
		"less",
		"markdown",
		"scss",
		"typescript",
		"typescriptreact",
		"yaml",
		"lua",
	},
})

keymap.set("n", "<C-I>", "<Cmd>Prettier<cr>", { noremap = true, silent = true })
