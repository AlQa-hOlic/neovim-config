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
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {
			{ "filename" },
		},
		lualine_x = { "encoding" }, -- "fileformat", "filetype"
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
})
