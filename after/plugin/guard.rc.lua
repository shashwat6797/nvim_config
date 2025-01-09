local ft = require("guard.filetype")

ft("rust"):fmt("rustfmt")

ft("cpp"):fmt("clang-format")

ft("lua"):fmt("stylua")

ft(
	"css",
	"gfaphql",
	"html",
	"javascript",
	"typescript",
	"javascriptreact",
	"json",
	"less",
	"markdown",
	"scss",
	"typescriptreact",
	"yaml",
	"lua"
):fmt("prettier")

ft("typescriptreact"):fmt("prettier")

ft("javascript"):fmt("lsp"):append("prettier")

vim.g.guard_config = {
	-- the only options for the setup function
	fmt_on_save = true,
	-- Use lsp if no formatter was defined for this filetype
	lsp_as_default_formatter = false,
}

vim.keymap.set("n", "<Leader>F", "<cmd>Guard fmt<cr>")
