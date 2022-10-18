local utils = require("alqaholic.utils")
local fn = vim.fn

-- Automatically install packer if not installed
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

local packer = utils.safe_require("packer")

-- Install plugins whenever plugin_list.lua file is modified
local group = vim.api.nvim_create_augroup("packer_user_config", { clear = true })
local function install_and_update_plugins()
	vim.schedule(function()
		local file_path = vim.fn.expand("<afile>")
		vim.cmd(string.format("source %s", file_path))
		packer.sync()
	end)
end

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "plugin_list.lua",
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
