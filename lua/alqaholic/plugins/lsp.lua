local utils = require("alqaholic.utils")
local import = utils.safe_require

local lspconfig = import("lspconfig")

if not lspconfig then
	return
end

local format_on_save_file_paths = {}

-----------------------------------------------------
-- Python language server. Requires python-lsp-server
-----------------------------------------------------
lspconfig.pylsp.setup({
	-- Turn off document formatting as we're using null-ls to perform
	-- formatting using black
	on_attach = function(client)
		client.server_capabilities.document_formatting = false
	end,
})
table.insert(format_on_save_file_paths, "*.py")

-----------------------------------------------------
-- Lua language server. Requires sumneko-lua
-----------------------------------------------------
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig.sumneko_lua.setup({
	on_attach = function(client)
		client.server_capabilities.document_formatting = false
	end,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			format = {
				enable = false,
				--   -- Put format options here
				--   -- NOTE: the value should be STRING!!
				--   defaultConfig = {
				--     indent_style = "space",
				--     indent_size = "2",
				--   }
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})
table.insert(format_on_save_file_paths, "*.lua")

------------------------------------------------------
-- Rust Language server, requires rust analyzer
------------------------------------------------------
lspconfig.rust_analyzer.setup({})
table.insert(format_on_save_file_paths, "*.rs")

------------------------------------------------------
-- TypeScript Language server, requires typescript,typescript-language-server
------------------------------------------------------
lspconfig.tsserver.setup({})

------------------------------------------------------
-- Java Language server, requires jdtls
-- curl https://raw.githubusercontent.com/eruizc-dev/jdtls-launcher/master/install.sh | bash
------------------------------------------------------
lspconfig.jdtls.setup({
	cmd = { "jdtls" },
	root_dir = function(fname)
		return require("lspconfig").util.root_pattern("pom.xml", "gradle.build", ".git")(fname) or vim.fn.getcwd()
	end,
})
