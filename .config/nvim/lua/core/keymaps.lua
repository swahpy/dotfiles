-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set -- for conciseness

---------------------
-- General Keymaps -------------------
---------------------

-- use jk to exit insert mode
map("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
map("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
-- clear visual selection
map("v", "<leader>nv", "<Esc>", { desc = "Exit visual mode" })

-- execute command in commandline window
-- map("n", ":", ":<C-f>", { desc = "Open commandline window instead of just commandline" })

-- window management
map("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>w|", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>w-", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" })
map("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current split window" })
-- Resize window
map("n", "<leader>wk", "<cmd>resize +6<cr>", { desc = "Increase Window Height" })
map("n", "<leader>wj", "<cmd>resize -6<cr>", { desc = "Decrease Window Height" })
map("n", "<leader>wl", "<cmd>vertical resize +6<cr>", { desc = "Increase Window Width" })
map("n", "<leader>wh", "<cmd>vertical resize -6<cr>", { desc = "Decrease Window Width" })

-- move and navigation
map("n", "<C-d>", "12j", { desc = "Scroll down by 12 lines" })
map("n", "<C-u>", "12k", { desc = "Scroll up by 12 lines" })
map({ "n", "i" }, "<C-e>", "<Esc>$a", { noremap = true, silent = true, desc = "move to end of line in insert mode" })
map({ "n", "i" }, "<C-a>", "<Esc>^i", { noremap = true, silent = true, desc = "move to start of line in insert mode" })
map("i", "<A-l>", "<Right>", { desc = "Moving right in insert mode " })
map("i", "<A-h>", "<Left>", { desc = "Moving left in insert mode " })
map("i", "<A-m>", "<Up>", { desc = "Moving up in insert mode " })
map("i", "<A-n>", "<Down>", { desc = "Moving down in insert mode " })
-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- search navigation
map("n", "n", "nzz", { noremap = true, silent = true, desc = "center content when searching" })
map("n", "N", "Nzz", { noremap = true, silent = true, desc = "center content when searching" })
map("n", "*", "*zz", { noremap = true, silent = true, desc = "center content when searching" })
map("n", "#", "#zz", { noremap = true, silent = true, desc = "center content when searching" })
-- navigation in command mode
map("c", "<A-h>", "<Left>", { desc = "Move left" })
map("c", "<A-l>", "<Right>", { desc = "Move right" })
map("c", "<A-b>", "<S-Left>", { desc = "Move back a word" })
map("c", "<A-f>", "<S-Right>", { desc = "Move forward a word" })
map("c", "<C-a>", "<Home>", { desc = "Move to start" })
map("c", "<C-e>", "<End>", { desc = "Move to end" })
map("c", "<A-k>", "<Up>", { desc = "Previous history" })
map("c", "<A-j>", "<Down>", { desc = "Next history" })

-- save and quit buffer
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
map("n", "<a-q>", "<cmd>qa<cr>", { desc = "Quit nvim" })
-- seldom use this, disable it.
-- map("n", "so", "<cmd>so %<cr>", { desc = "Source current buffer" })

-- indent
map("v", "<", "<gv", { noremap = true, silent = true, desc = "" })
map("v", ">", ">gv", { noremap = true, silent = true, desc = "" })

-- Lazy
map("n", "<leader><leader>l", "<cmd>Lazy<cr>", { desc = "Open Lazy Pane" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- undo & redo
map("i", "<C-u>", "<cmd>undo<cr>", { desc = "Undo in insert mode" })
map("i", "<C-r>", "<cmd>redo<cr>", { desc = "Redo in insert mode" })
