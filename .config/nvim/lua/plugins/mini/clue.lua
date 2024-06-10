return {
	"echasnovski/mini.clue",
	version = false,
	config = function()
		local clue = require("mini.clue")
		clue.setup({
			triggers = {
				{ mode = "n", keys = "<leader>" },
				{ mode = "x", keys = "<leader>" },
			},
			window = {
				config = {
					anchor = "SW",
					row = "auto",
					col = "auto",
					width = "auto",
				},
			},
		})
	end,
}
