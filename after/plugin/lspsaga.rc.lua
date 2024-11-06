local status, saga = pcall(require, "lspsaga")
if not status then
	return
end

saga.setup({
	diagnostic = {
		max_height = 0.8,
		keys = {
			quit = { "q", "<ESC>" },
		},
	},
	finder = {
		max_height = 0.6,
		keys = {
			vsplit = "v",
		},
	},
	definition = {
		keys = {
			edit = "o",
		},
	},
	ui = {
		border = "double",
		expand = "⊞",
		collapse = "⊟",
		actionfix = " ",
		lines = { "┗", "┣", "┃", "━", "┏" },
		imp_sign = "󰳛 ",
	},
})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-j>", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
vim.keymap.set("n", "gd", "<cmd>Lspsaga finder<cr>", opts)
vim.keymap.set("i", "C-k", "<cmd>Lspsaga peek_definition<cr>", opts)
vim.keymap.set("n", "go", "<cmd>Lspsaga goto_definition<cr>", opts)
---@diagnostic disable-next-line: undefined-global
vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<cr>", opts)
vim.keymap.set("n", "ga", "<cmd>Lspsaga code_action<cr>", opts)
vim.keymap.set("n", "ot", "<cmd>Lspsaga outline<cr>", opts)
