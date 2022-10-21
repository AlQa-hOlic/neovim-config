local f = require("alqaholic.utils").f

local colorscheme = "tokyonight"

local status, _ = pcall(vim.cmd, f("colorscheme {colorscheme}"))
if not status then
	print(f('Colorscheme "{colorscheme}" not found!'))
	return
end
