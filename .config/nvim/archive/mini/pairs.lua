return {
	"echasnovski/mini.pairs",
	version = false,
	config = function()
		require("mini.pairs").setup({
			modes = { insert = true, command = true, terminal = false },
			mappings = {
				["<"] = { action = "open", pair = "<>", neigh_pattern = "[^\\]." },
				[">"] = { action = "close", pair = "<>", neigh_pattern = "[^\\]." },
			},
		})
	end,
}
