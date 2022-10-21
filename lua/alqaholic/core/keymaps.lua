vim.g.mapleader = " "

local keymap = vim.keymap

-- general
keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<leader>nh", "<cmd>nohl<CR>")

keymap.set("n", "x", '"_x')
keymap.set("n", "Y", '"+yg_')
keymap.set("n", "y", '"+y')
keymap.set("v", "y", '"+y')

keymap.set("v", ">", ">gv") -- Do not exit visual mode after indenting
keymap.set("v", "<", "<gv")

keymap.set("v", "J", "j") -- Fix accidental line joining during visual block selection
keymap.set("v", "K", "k")

keymap.set("", "<A-j>", ":m .+1<CR>==") -- Up/Down with Alt+j/k
keymap.set("", "<A-k>", ":m .-2<CR>==")

keymap.set("", "<A-Down>", ":m .+1<CR>==") -- Up/Down with Alt+Arrow keys
keymap.set("", "<A-UP>", ":m .-2<CR>==")

keymap.set("n", "<S-Tab>", ":bprevious<CR>")
keymap.set("n", "<Tab>", ":bnext<CR>")

keymap.set("n", "<leader>v", "<C-w>v") -- split pane vertically
keymap.set("n", "<leader>h", "<C-w>s") -- split pane horizontally
keymap.set("n", "<leader>x", "<cmd>close<CR>") -- close current pane

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
keymap.set("n", "<C-p>", "<cmd>lua require('alqaholic.fuzzy_finder').find_files_dropdown()<cr>")
keymap.set("n", "<A-p>", ":Telescope live_grep<CR>")
keymap.set("i", "<C-j>", "<cmd>lua require('alqaholic.snippet').jump_to_next_field()<CR>")
keymap.set("s", "<C-j>", "<cmd>lua require('alqaholic.snippet').jump_to_next_field()<CR>")
keymap.set("i", "<C-k>", "<cmd>lua require('alqaholic.snippet').jump_to_previous_field()<CR>")
keymap.set("s", "<C-k>", "<cmd>lua require('alqaholic.snippet').jump_to_previous_field()<CR>")

keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>")
keymap.set("v", "<leader>ca", "<cmd>Lspsaga code_action<CR>")
keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>")
-- support tagstack C-t jump back
keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>")
keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

-- Diagnsotic jump can use `<c-o>` to jump back
keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- Only jump to error
keymap.set("n", "[E", "<cmd>lua require('lspsaga.diagnostic').goto_prev({ severity = vim.diagnostic.severity.ERROR })")
keymap.set("n", "]E", "<cmd>lua require('lspsaga.diagnostic').goto_next({ severity = vim.diagnostic.severity.ERROR })")

-- Outline
keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>")

-- Hover Doc
keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")
