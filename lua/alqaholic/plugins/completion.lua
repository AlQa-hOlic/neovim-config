local utils = require("alqaholic.utils")
local import = utils.safe_require

local cmp = import("cmp")

if not cmp then
	return
end

local lspkind = import("lspkind")

if not lspkind then
	return
end

local luasnip = import("luasnip")

if not luasnip then
	return
end

cmp.setup({
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Down>"] = cmp.mapping.select_next_item(),
		["<Up>"] = cmp.mapping.select_prev_item(),
	}),
	sources = {
		{ name = "luasnip" },
		{ name = "nvim_lsp" },
		{ name = "buffer", keyword_length = 4 }, -- Only use suggestions from buffer after 4 chars
		{ name = "path " },
	},
	formatting = {
		format = lspkind.cmp_format({
			with_text = true,
			maxwidth = 50,
			menu = {
				buffer = "[Buf]",
				nvim_lsp = "[LSP]",
				path = "[Path]",
				luasnip = "[Snip]",
			},
		}),
	},
	experimental = {
		native_menu = false,
	},
})
