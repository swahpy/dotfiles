return {
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
}
