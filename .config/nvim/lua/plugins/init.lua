return {
	"nvim-lua/plenary.nvim", -- lua functions that many plugis use
	"christoomey/vim-tmux-navigator", -- tmux & split window navigation
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
		end,
		keys = {
			{ "<leader><leader>t", "<cmd>TSJToggle<cr>", desc = "[T]oggle join and split" },
			{ "<leader><leader>j", "<cmd>TSJJoin<cr>", desc = "[J]oin node under cursor" },
			{ "<leader><leader>s", "<cmd>TSJSplit<cr>", desc = "[S]plit node under cursor" },
		},
	},
}
