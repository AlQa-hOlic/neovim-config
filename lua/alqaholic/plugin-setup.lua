-- auto install packer if not installed
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
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

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

-- add list of plugins to install
return packer.startup(function(use)
  -- packer can manage itself
  use("wbthomason/packer.nvim")

  use("nvim-lua/plenary.nvim")
  use("kyazdani42/nvim-web-devicons")

  use("ellisonleao/gruvbox.nvim")
  use("nvim-lualine/lualine.nvim")
  use("nvim-tree/nvim-tree.lua")
  use("nvim-telescope/telescope.nvim")
  use("lewis6991/gitsigns.nvim")

  use("numToStr/Comment.nvim")
  use("christoomey/vim-tmux-navigator")
  -- use("tpope/vim-surround")

  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local tsUpdate = require("nvim-treesitter.install").update({ with_sync = true })
      tsUpdate()
    end,
  })
  use("windwp/nvim-autopairs")

  use("L3MON4D3/LuaSnip")

  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-nvim-lsp")
  use("saadparwaiz1/cmp_luasnip")
  use("onsails/lspkind.nvim")

  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")

  use("neovim/nvim-lspconfig")
  use("jose-elias-alvarez/typescript.nvim")
  use("glepnir/lspsaga.nvim")

  use("jose-elias-alvarez/null-ls.nvim")
  use("jayp0521/mason-null-ls.nvim")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
