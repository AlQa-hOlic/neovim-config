-- Format for keybindings
-- vim.api.nvim_set_keymap(<mode>, <keys>, <actions>, <options>)

local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true }
local silent_opts = { noremap = true, silent = true }

-- Setting leader key
map("n", "<Space>", "<NOP>", silent_opts)
vim.g.mapleader = " "

map("n", "<C-s>", ":w<CR>", default_opts) -- Save file
map("n", "<C-w>", ":bd<CR>", default_opts) -- Buffer delete/close window
map("n", "<Leader><Space>", ":noh<CR>", silent_opts) -- Remove highlights

-- Yank till line end
map("n", "Y", '"+yg_', silent_opts)

-- Always yank to clipboard
map("n", "y", '"+y', silent_opts)
map("v", "y", '"+y', silent_opts)

map("v", ">", ">gv", default_opts) -- Do not exit visual mode after indenting
map("v", "<", "<gv", default_opts)

-- Fix accidental line joining during visual block selection
map("v", "J", "j", silent_opts)
map("v", "K", "k", silent_opts)

map("", "<A-j>", ":m .+1<CR>==", default_opts) -- Up/Down with Alt+j/k
map("", "<A-k>", ":m .-2<CR>==", default_opts)

map("", "<A-Down>", ":m .+1<CR>==", default_opts) -- Up/Down with Alt+Arrow keys
map("", "<A-UP>", ":m .-2<CR>==", default_opts)

-- Next and Previous buffers
map("n", "<S-Tab>", ":BufferPrevious<CR>", default_opts)
map("n", "<Tab>", ":BufferNext<CR>", default_opts)

-- Window switching
map("n", "<C-h>", "<C-w>h", silent_opts)
map("n", "<C-l>", "<C-w>l", silent_opts)
map("n", "<C-k>", "<C-w>k", silent_opts)
map("n", "<C-j>", "<C-w>j", silent_opts)

map("n", "<Leader>n", ":NvimTreeToggle<CR>", default_opts) -- Toggle file tree
map("n", "<C-p>", "<cmd>lua require('alqaholic.fuzzy_finder').find_files_dropdown()<cr>", default_opts) -- Search filenames
map("n", "<A-p>", ":Telescope live_grep<CR>", default_opts) -- Search inside files
-- Ctrl + /, for some reason _ represents /
map("", "<C-_>", ":CommentToggle<CR>", default_opts) --Toggle comments

map("i", "<C-j>", "<cmd>lua require('alqaholic.snippet').jump_to_next_field()<CR>", default_opts)
map("s", "<C-j>", "<cmd>lua require('alqaholic.snippet').jump_to_next_field()<CR>", default_opts)
map("i", "<C-k>", "<cmd>lua require('alqaholic.snippet').jump_to_previous_field()<CR>", default_opts)
map("s", "<C-k>", "<cmd>lua require('alqaholic.snippet').jump_to_previous_field()<CR>", default_opts)

-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
map("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", silent_opts)

-- Code action
map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", silent_opts)
map("v", "<leader>ca", "<cmd>Lspsaga code_action<CR>", silent_opts)

-- Rename
map("n", "gr", "<cmd>Lspsaga rename<CR>", silent_opts)

-- Peek Definition
-- you can edit the definition file in this float window
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
map("n", "gd", "<cmd>Lspsaga peek_definition<CR>", silent_opts)

-- Show line diagnostics
map("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", silent_opts)

-- Show cursor diagnostic
map("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", silent_opts)

-- Diagnsotic jump can use `<c-o>` to jump back
map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", silent_opts)
map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", silent_opts)

-- Only jump to error
map(
	"n",
	"[E",
	"<cmd>lua require('lspsaga.diagnostic').goto_prev({ severity = vim.diagnostic.severity.ERROR })",
	silent_opts
)
map(
	"n",
	"]E",
	"<cmd>lua require('lspsaga.diagnostic').goto_next({ severity = vim.diagnostic.severity.ERROR })",
	silent_opts
)

-- Outline
map("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", silent_opts)

-- Hover Doc
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", silent_opts)
