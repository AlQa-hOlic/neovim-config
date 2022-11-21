local utils = require("alqaholic.utils")
local import = utils.safe_require

local telescope = import("telescope")

if not telescope then
	return
end

telescope.setup({
	defaults = {
		prompt_prefix = "   ",
	},
})
