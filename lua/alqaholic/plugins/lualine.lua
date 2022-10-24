local utils = require("alqaholic.utils")
local import = utils.safe_require

local lualine = import("lualine")

if not lualine then
	return
end

lualine.setup({
	options = {
		theme = "gruvbox",
		component_separators = "|",
		section_separators = "",
	},
	tabline = {},
	extensions = { "nvim-tree" },
})
