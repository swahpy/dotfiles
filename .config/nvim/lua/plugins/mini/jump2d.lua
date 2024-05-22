return {
	"echasnovski/mini.jump2d",
	version = false,
	config = function()
		local jump2d = require("mini.jump2d")
		jump2d.setup({
			-- Module mappings. Use `''` (empty string) to disable one.
			mappings = {
				start_jumping = "gw",
			},
		})
	end,
}
