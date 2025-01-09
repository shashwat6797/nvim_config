local status, packer = pcall(require, "packer")
if not status then
	print("packer is not installed")
	return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use({
		"svrana/neosolarized.nvim",
		requires = { "tjdevries/colorbuddy.nvim" },
	})
	use("hoob3rt/lualine.nvim") -- Statusline
	use("akinsho/toggleterm.nvim")
	use({ "CRAG666/code_runner.nvim", requires = "nvim-lua/plenary.nvim" })
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	})
	use("terrortylor/nvim-comment")
	use("neovim/nvim-lspconfig")

	--tmux navigation
	use("christoomey/vim-tmux-navigator")

	--debugger adapter
	use("mfussenegger/nvim-dap")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })

	--null-ls and prettier
	use({
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
	})
	use("nvimtools/none-ls-extras.nvim")
	use("MunifTanjim/prettier.nvim")

	--gaurd formatter
	use({
		"nvimdev/guard.nvim",
	})
	use({
		"nvimdev/guard-collection",
	})

	--completion extensions
	use("nvim-lua/completion-nvim")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use({ "L3MON4D3/LuaSnip", dependencies = {
		"saadparwaiz1/cmp_luasnip",
	} })
	use("saadparwaiz1/cmp_luasnip")
	use("onsails/lspkind-nvim")
	use("mlaursen/vim-react-snippets")
	use({ "rafamadriz/friendly-snippets" })
	--use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })

	--lsp saga
	use({
		"nvimdev/lspsaga.nvim",
		after = "nvim-lspconfig",
		config = function()
			require("lspsaga").setup({})
		end,
	})

	--markdown preview
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
	--colorscheme
	use("lukas-reineke/indent-blankline.nvim")
	use("AstroNvim/astrotheme")
	use({
		"philosofonusus/morta.nvim",
		name = "morta",
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd.colorscheme("morta")
		end,
	})
	use({ "bluz71/vim-moonfly-colors", as = "moonfly" })
	use({ "bluz71/vim-nightfly-colors", as = "nightfly" })
	use("jiangmiao/auto-pairs")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("folke/neodev.nvim")
	use("mattn/emmet-vim")
	use("mfussenegger/nvim-jdtls")
	use("williamboman/mason.nvim")
	--use("neoclide/coc.nvim")
	-- These optional plugins should be loaded directly because of a bug in Packer lazy loading
	use("nvim-tree/nvim-web-devicons") -- OPTIONAL: for file icons
	use("lewis6991/gitsigns.nvim") -- OPTIONAL: for git status
	use("romgrk/barbar.nvim")
	use("lervag/vimtex")
	use({
		"VonHeikemen/fine-cmdline.nvim",
		requires = {
			{ "MunifTanjim/nui.nvim" },
		},
	})
	use("xiyaowong/transparent.nvim")
	use("kabouzeid/nvim-lspinstall")
	use({ "nvim-treesitter/nvim-treesitter" })
	use("Shougo/ddc.vim")

	--use("vim-denops/denops.vim")
	--use("vim-denops/denops-helloworld.vim")
end)
