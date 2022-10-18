vim.cmd([[packadd packer.nvim]])

local utils = require("alqaholic.utils")
local packer = utils.safe_require("packer")

return packer.startup(function(use)
	use({ "wbthomason/packer.nvim" }) -- Package manager

	use({ "folke/tokyonight.nvim" })

	use({
		"kyazdani42/nvim-tree.lua", -- File Tree
		requires = "kyazdani42/nvim-web-devicons",
	})

	use({ "hoob3rt/lualine.nvim", requires = "kyazdani42/nvim-web-devicons" }) -- Status Line

	use({
		"akinsho/bufferline.nvim",
		tag = "v3.*",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				options = {
					-- hover = {
					--     enabled = true,
					--     delay = 200,
					--     reveal = {'close'}
					-- },
					always_show_bufferline = false,
					show_close_icon = false,
				},
			})
		end,
	})

	use({
		"terrortylor/nvim-comment", -- Commenting
		config = function()
			require("nvim_comment").setup()
		end,
	})

	use({
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({})
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter", -- Treesitter AST parser.
		run = ":TSUpdate",
	})

	use({
		"nvim-telescope/telescope.nvim", -- Fuzzy finder
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"windwp/nvim-autopairs", -- Automatically close brackets
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	use({ "neovim/nvim-lspconfig" }) -- LSP and autocompletion
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"L3MON4D3/LuaSnip",
		},
	})
	use({ "hrsh7th/cmp-path" }) -- Adds file paths to completion
	use({ "hrsh7th/cmp-nvim-lua" }) -- Adds lua vim API to suggestions
	use({ "saadparwaiz1/cmp_luasnip" }) -- Adds luasnip snippet completions
	use({ "onsails/lspkind-nvim" }) -- Add source names to completion suggestions
	use({
		"glepnir/lspsaga.nvim", -- Wrapper for nice LSP features
		branch = "main",
		config = function()
			local saga = require("lspsaga")

			saga.init_lsp_saga({
				-- your configuration
			})
		end,
	})
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- Use external formatters, diagnostics etc with LSP

	use({
		"lewis6991/gitsigns.nvim", -- Show git diffs and perform some git operations
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("gitsigns").setup({})
		end,
	})

	use({
		"akinsho/toggleterm.nvim", -- Terminal
		config = function()
			require("toggleterm").setup({
				size = 15,
				open_mapping = [[<C-t>]],
			})
		end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
