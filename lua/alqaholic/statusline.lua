local utils = require("alqaholic.utils")
local lualine = utils.safe_require("lualine")

lualine.setup({
	options = {
		theme = "tokyonight",
		component_separators = "|",
		section_separators = "",
	},
	tabline = {},
	extensions = { "nvim-tree" },
})
