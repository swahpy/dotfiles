return {
	"nvim-lua/plenary.nvim", -- lua functions that many plugis use
	"yorickpeterse/nvim-tree-pairs", -- to fix % jump with tree-sitter
	"RRethy/nvim-treesitter-endwise",
	{
		"kylechui/nvim-surround",
		-- Use for stability; omit to use `main` branch for the latest features
		version = "*",
		event = "VeryLazy",
		opts = true,
	},
	{
		"Wansmer/treesj",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesj").setup()
			local nmap_leader = function(suffix, rhs, desc)
				vim.keymap.set("n", "<Leader>" .. suffix, rhs, { desc = desc })
			end
			nmap_leader("<leader>t", "<cmd>TSJToggle<cr>", "[T]oggle join and split")
			nmap_leader("<leader>s", "<cmd>TSJSplit<cr>", "[S]plit node under cursor")
			nmap_leader("<leader>j", "<cmd>TSJSplit<cr>", "[J]oin node under cursor")
		end,
	},
}
