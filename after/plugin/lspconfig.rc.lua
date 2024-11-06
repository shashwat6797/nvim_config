local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local protocol = require("vim.lsp.protocol")

local on_attach = function(client, bufnr)
	--formatting
	if client.server_capabilities.documnetFormattingProvider then
		vim.api.nvim_create_augroup("BufWritePre", {
			group = vim.api.nvim_create_augroup("Format", { clear = true }),
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.formatting_seq_sync()
			end,
		})
	end
end

nvim_lsp.emmet_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {
		"css",
		"eruby",
		"html",
		"javascript",
		"javascriptreact",
		"less",
		"sass",
		"scss",
		"svelte",
		"pug",
		"typescriptreact",
		"vue",
	},
	init_options = {
		html = {
			options = {
				-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
				["output.selfClosingStyle"] = "xhtml",
			},
		},
	},
})

nvim_lsp.tailwindcss.setup({ capabilities = capabilities })
nvim_lsp.pyright.setup({ capabilities = capabilities })
nvim_lsp.clangd.setup({ capabilities = capabilities })
nvim_lsp.lua_ls.setup({ capabilities = capabilities })
nvim_lsp.jdtls.setup({ capabilities = capabilities })

require("mason").setup({})

require("lspconfig").html.setup({
	cmd = { "html-languageserver", "--stdio" },
	capabilities = capabilities,
})

require("lspconfig").tsserver.setup({
	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
	capabilities = capabilities,
})

nvim_lsp.marksman.setup({ capabilities = capabilities })
nvim_lsp.texlab.setup({ capabilities = capabilities })
