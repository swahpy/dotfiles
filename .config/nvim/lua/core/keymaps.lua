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

-- increment/decrement numbers
map("n", "<leader>+", "<C-a>", { desc = "Increment number" })
map("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- window management
map("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" })
map("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current split window" })

map("n", "<C-d>", "12j", { desc = "Scroll down by 12 lines" })
map("n", "<C-u>", "12k", { desc = "Scroll up by 12 lines" })

-- save and quit buffer
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
map("n", "Q", "<cmd>q<cr>", { desc = "Quit current buffer" })
map("n", "wq", "<cmd>wq<cr>", { desc = "Save and quit current buffer" })
map("n", "so", "<cmd>so %<cr>", { desc = "Source current buffer" })

-- navigation
map("n", "n", "nzz", { noremap = true, silent = true, desc = "" })
map("n", "N", "Nzz", { noremap = true, silent = true, desc = "" })
map("n", "*", "*zz", { noremap = true, silent = true, desc = "" })
map("n", "#", "#zz", { noremap = true, silent = true, desc = "" })

-- indent
map("v", "<", "<gv", { noremap = true, silent = true, desc = "" })
map("v", ">", ">gv", { noremap = true, silent = true, desc = "" })

-- Lazy
map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Open Lazy Pane"} )

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })
