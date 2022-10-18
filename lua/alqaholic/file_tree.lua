local utils = require("alqaholic.utils")
local nvim_tree = utils.safe_require("nvim-tree")
nvim_tree.setup()

local function auto_close_if_last()
	if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
		vim.cmd("quit")
	end
end
vim.api.nvim_create_autocmd("BufEnter", {
	nested = true,
	callback = auto_close_if_last,
})
