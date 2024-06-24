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
}
