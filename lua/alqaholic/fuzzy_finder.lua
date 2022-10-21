local M = {}

function M.find_files_dropdown()
	local builtins = require("telescope.builtin")
	local themes = require("telescope.themes")
	builtins.find_files(themes.get_dropdown({ previewer = false }))
end

return M
