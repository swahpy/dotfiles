return {
	"nvim-lua/plenary.nvim", -- lua functions that many plugis use
	"christoomey/vim-tmux-navigator", -- tmux & split window navigation
	"yorickpeterse/nvim-tree-pairs", -- to fix % jump with tree-sitter
	"RRethy/nvim-treesitter-endwise",
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		opts = { ignore = "^$" },
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		enabled = true,
		event = { "BufReadPre", "BufNewFile" },
		main = "ibl",
		opts = {
			indent = { char = "┇" },
			exclude = {
				filetypes = {
					-- disable indent line for dashboard
					"dashboard",
				},
			},
		},
	},
	{
		"szw/vim-maximizer",
		keys = {
			{
				"<leader>wm",
				"<cmd>MaximizerToggle<CR>",
				desc = "Maximize/minimize a split window",
			},
		},
	},
	{
		"kylechui/nvim-surround",
		-- Use for stability; omit to use `main` branch for the latest features
		version = "*",
		event = "VeryLazy",
		opts = true,
	},
}
