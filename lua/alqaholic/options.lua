-- Undo dir (persistent undo's)
local undo_dir = vim.env.HOME .. [[/.cache/nvim/undo]]
if not vim.fn.isdirectory(undo_dir) then
	vim.fn.mkdir(undo_dir)
end

local options = {
	fileencoding = "utf-8", -- File encoding
	spelllang = "en_us",
	-- DOS fileformat
	-- fileformat = "dos",
	-- fileformats = "dos",

	syntax = "on", -- Syntax highlighting
	number = true, -- Line numbers
	relativenumber = true, -- Line numbers relative to the current cursorline
	showcmd = true, -- Show the commands run at the bottom
	wrap = false, -- Text wrapping
	clipboard = "unnamedplus", -- Use system clipboard. Requires xclip
	undodir = undo_dir,
	undofile = true,

	smartindent = true, -- Automatically indent next line
	autoindent = true,

	-- Tab width
	tabstop = 4,
	softtabstop = 4,
	shiftwidth = 4,
	expandtab = true,

	ignorecase = true, -- Always case-insensitive
	smartcase = true, -- Enable smart-case search
	incsearch = true, -- Searches for strings incrementally

	completeopt = { "menu", "menuone", "noselect" }, -- Enable completion
	pumheight = 10, -- Show max. 10 completions

	fillchars = {
		eob = "–",
		fold = " ",
		foldsep = " ",
		foldclose = "",
		foldopen = "",
		horiz = "━",
		horizup = "┻",
		horizdown = "┳",
		vert = "┃",
		vertleft = "┫",
		vertright = "┣",
		verthoriz = "╋",
	}, -- Display chars

	laststatus = 3, -- Global statusline
	mouse = "a", -- Enable mouse in all modes
	scrolloff = 25, -- Keeps a few lines between top and bottom of screen during scroll

	termguicolors = true, -- Required for the gruvbox theme to function properly
	background = "dark", -- Use dark colorscheme when possible
	cursorline = true, -- Highlight the line with cursor
	cursorlineopt = "line",
	signcolumn = "yes",
	ch = 0,
	showmode = false, -- Turn off display of current mode as status line takes care of this
	colorcolumn = "80", -- Ruler for line width guide
	splitright = true, -- Open new splits to the right
	splitbelow = true, -- Open new splits to the bottom
}

for option, value in pairs(options) do
	vim.opt[option] = value
end

vim.opt.listchars:append({
	-- tab = " ",
	-- lead = "·",
	trail = "·",
	-- eol = "﬋",
})

-- Disable builtin vim plugins
local disabled_built_ins = {
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"matchit",
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end

-- Set shorter tabs for some document types
local shorter_tab_filetypes = { "plaintex", "tex", "xml", "html", "css" }
local function set_shorter_tabs()
	vim.schedule(function()
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.shiftwidth = 2
	end)
end

vim.api.nvim_create_autocmd("Filetype", {
	pattern = shorter_tab_filetypes,
	callback = set_shorter_tabs,
})

-- Disable automatic commenting of next line
local function disable_automatic_commenting()
	vim.opt.formatoptions:remove({ "c", "r", "o" })
end

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile", "BufEnter" }, {
	pattern = "*",
	callback = disable_automatic_commenting,
})
