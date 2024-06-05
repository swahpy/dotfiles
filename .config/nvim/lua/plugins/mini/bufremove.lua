return {
	"echasnovski/mini.bufremove",
	version = false,
	config = function()
		local br = require("mini.bufremove")
		br.setup()
		local map = vim.keymap.set
		map("n", "<leader>bd", function()
			br.delete()
		end, { desc = "Delete current buffer" })
		map("n", "<leader>bw", function()
			br.wipeout()
		end, { desc = "Wipeout current buffer" })
		map("n", "<leader>bh", function()
			br.unshow()
		end, { desc = "Unshow(hide) current buffer" })
		map("n", "<leader>bU", function()
			br.unshow_in_window()
		end, { desc = "Unshow(hide) current buffer in window" })
	end,
}
