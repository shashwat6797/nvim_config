local status, cmp = pcall(require, "cmp")
if not status then
	return
end

local lspkind = require("lspkind")

local luasnip = require("luasnip.loaders.from_vscode").lazy_load()

local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local isn = ls.indent_snippet_node

ls.add_snippets("cpp", {
	s("lc", {
		isn(1, {
			t({
				"#include<bits/stdc++.h>",
				"",
				"using namespace std;",
				"",
				"class Solution{",
				"public:",
				"};",
				"",
				"int main(){",
				"Solution obj;",
				"return 0;",
				"}",
			}),
		}, ""),
	}),
	s("cp", {
		isn(1, {
			t({
				"#include<bits/stdc++.h>",
				"",
				"#define ll long long",
				"#define vi vector<int>",
				"#define vl vector<ll>",
				"#define vs vector<string>",
				"#define vd vector<double>",
				"",
				"using namespace std;",
				"",
				"void solve() {};",
				"",
				"int main(){",
				"int T;",
				"cin>>T;",
				"while(T--) {",
				"}",
				"return 0;",
				"}",
			}),
		}, ""),
	}),
})

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items,
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip ~= nil then
				luasnip.expand_or_jumpable()
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		--{ name = "cmp_tabnine" },
		{ name = "nvim_lsp" },
		-- { name = 'vsnip' }, -- For vsnip users.
		{ name = "luasnip" }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = "buffer" },
	}),
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol",
			maxwidth = 50,
			ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
			show_labelDetails = true, -- show labelDetails in menu. Disabled by defaul
		}),
	},
})

vim.cmd([[
    set completeopt=menuone,noinsert,noselect
    highlight! default link CmpItemKind CmpItemMenuDefault
  ]])
