local ft = require("guard.filetype")

local status2, guard = pcall(require, "guard")
if not status2 then
	return
end

ft("cpp"):fmt("clang-format")

ft("lua"):fmt("stylua")

ft(
	"css",
	"graphql",
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

guard.setup({
	-- the only options for the setup function
	fmt_on_save = true,
	-- Use lsp if no formatter was defined for this filetype
	lsp_as_default_formatter = false,
})

vim.keymap.set("n", "<Leader>ft", "<cmd>GuardFmt<cr>")
