local utils = require("alqaholic.utils")
local import = utils.safe_require

local treesitter = import("nvim-treesitter.configs")

if not treesitter then
	return
end

treesitter.setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true },
	incremental_selection = {
		enable = true,
		keymaps = {
			-- TODO: Adjust keymaps
			init_selection = "<c-space>",
			node_incremental = "<c-space>",
			scope_incremental = "<c-s>",
			node_decremental = "<c-backspace>",
		},
	},
	textobjects = {
		select = {
			enable = true,
			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
	},
})
