local M = {}

local utils = require("alqaholic.utils")
local telescope = utils.safe_require("telescope")
telescope.setup({
	defaults = {
		prompt_prefix = "  ",
	},
})

function M.find_files_dropdown()
	local builtins = require("telescope.builtin")
	local themes = require("telescope.themes")
	builtins.find_files(themes.get_dropdown({ previewer = false }))
end

return M
