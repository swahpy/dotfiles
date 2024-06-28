return {
	"Wansmer/treesj",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		local treesj = require("treesj")
		treesj.setup()
		local nmap_leader = function(suffix, rhs, desc)
			vim.keymap.set("n", "<Leader>" .. suffix, rhs, { desc = desc })
		end
		nmap_leader("<leader>t", function()
			treesj.toggle()
		end, "+toggle join and split")
		nmap_leader("<leader>s", function()
			treesj.split()
		end, "+split node under cursor")
		nmap_leader("<leader>j", function()
			treesj.join()
		end, "+join node under cursor")
	end,
}
