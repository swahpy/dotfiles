return {
	"echasnovski/mini.diff",
	version = false,
	config = function()
		local diff = require("mini.diff")
		diff.setup({
			view = {
				style = "sign",
				signs = { add = "+", change = "~", delete = "-" },
			},
		})
	end,
}
