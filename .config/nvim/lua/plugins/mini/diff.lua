return {
	"echasnovski/mini.diff",
	version = false,
	config = function()
		local diff = require("mini.diff")
		diff.setup({
			-- source = diff.gen_source.save(),
			view = {
				style = "sign",
				signs = { add = "+", change = "~", delete = "-" },
			},
		})
		vim.keymap.set("n", "<leader><leader>o", function()
			diff.toggle_overlay()
		end, { desc = "+mini diff toggle overlay" })
	end,
}
