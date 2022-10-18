local M = {}
-- Load in JSON snippets (VSCode syntax)
local loader = require("luasnip.loaders.from_vscode")

-- Load only the filetype appropriate snippets
loader.lazy_load({
	paths = { vim.fn.stdpath("config") .. "/snippets" },
})

local utils = require("alqaholic.utils")
local luasnip = utils.safe_require("luasnip")

function M.jump_to_next_field()
	if luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	end
end

function M.jump_to_previous_field()
	if luasnip.jumpable(-1) then
		luasnip.jump(-1)
	end
end

return M
