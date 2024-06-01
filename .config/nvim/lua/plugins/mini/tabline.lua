return {
	"echasnovski/mini.tabline",
	version = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local tabline = require("mini.tabline")
		tabline.setup({
			-- Function which formats the tab label
			-- By default surrounds with space and possibly prepends with icon
			format = function(buf_id, label)
				local suffix = vim.bo[buf_id].modified and "+ " or ""
				return "▎" .. tabline.default_format(buf_id, label) .. suffix
			end,
		})
	end,
}
