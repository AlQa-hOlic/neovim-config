local f = require("alqaholic.utils").f

---@diagnostic disable-next-line: unused-local
local colorscheme = "gruvbox"

local status, _ = pcall(vim.cmd, f("colorscheme {colorscheme}"))
if not status then
	print(f('Colorscheme "{colorscheme}" not found!'))
	return
end
