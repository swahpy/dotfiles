return {
	"echasnovski/mini.splitjoin",
	version = false,
	config = function()
		local sj = require("mini.splitjoin")
		sj.setup({
			mappings = { toggle = "<leader>sj" },
		})
	end,
}
