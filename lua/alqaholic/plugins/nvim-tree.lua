local utils = require("alqaholic.utils")
local import = utils.safe_require

local nvimtree = import("nvim-tree")

if not nvimtree then
	return
end

-- recommended settings from nvim-tree docs
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
	-- change folder arrow icons
	renderer = {
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "", -- arrow when folder is closed
					arrow_open = "", -- arrow when folder is open
				},
			},
		},
	},
	-- disable window_picker for
	-- explorer to work well with
	-- window splits
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
})

local function auto_close_if_last()
	if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
		vim.cmd("quit")
	end
end

vim.api.nvim_create_autocmd("BufEnter", {
	nested = true,
	callback = auto_close_if_last,
})
