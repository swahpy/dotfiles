-- set leader key to space
vim.g.mapleader = " "

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

map("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
map("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
map("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
map("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
map("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

map("n", "<C-d>", "12j", { desc = "Scroll down by 12 lines" })
map("n", "<C-u>", "12k", { desc = "Scroll up by 12 lines" })

-- save and quit buffer
map("n", "W", "<cmd>w<cr>", { desc = "Save current buffer" })
map("n", "Q", "<cmd>q<cr>", { desc = "Quit current buffer" })
map("n", "wq", "<cmd>wq<cr>", { desc = "Save and quit current buffer" })
map("n", "so", "<cmd>so %<cr>", { desc = "Source current buffer" })
