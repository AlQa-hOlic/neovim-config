local utils = require("alqaholic.utils")
local import = utils.safe_require

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

local packer = import("packer")

if not packer then
	return
end

-- Install plugins whenever plugin-setup.lua file is modified
local group = vim.api.nvim_create_augroup("packer_user_config", { clear = true })
local install_and_update_plugins = function()
	vim.schedule(function()
		local file_path = vim.fn.expand("<afile>")
		vim.cmd(string.format("source %s", file_path))
		packer.sync()
	end)
end

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "plugin-setup.lua",
	callback = install_and_update_plugins,
	group = group,
})

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

packer.startup(function(use)
	use("wbthomason/packer.nvim")
	-- My plugins here
	-- use 'foo1/bar1.nvim'
	-- use 'foo2/bar2.nvim'

	use("nvim-lua/plenary.nvim")
	use("kyazdani42/nvim-web-devicons")

	-- appearance
	-- use("folke/tokyonight.nvim")
  use({
    "ellisonleao/gruvbox.nvim",
    config = function()
      require("gruvbox").setup({
        transparent_mode = true
      })
      vim.cmd("colorscheme gruvbox")
    end
  })
	use("nvim-lualine/lualine.nvim")

	-- utils
	use("numToStr/Comment.nvim")
	use("christoomey/vim-tmux-navigator")
	-- use 'tpope/vim-surround'

	use("nvim-tree/nvim-tree.lua")
	use("nvim-telescope/telescope.nvim")
	use("lewis6991/gitsigns.nvim")

	-- intellisense
	use({
		"nvim-treesitter/nvim-treesitter", -- Treesitter AST parser.
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	})
	use("neovim/nvim-lspconfig")
	use("glepnir/lspsaga.nvim")
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"onsails/lspkind-nvim",
		},
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
