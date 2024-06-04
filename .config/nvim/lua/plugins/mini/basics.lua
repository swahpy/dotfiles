return {
	"echasnovski/mini.basics",
	version = false,
	config = function()
		local opts = vim.opt
		opts.listchars = "tab:  ,extends:…,precedes:…,nbsp:␣" -- Define which helper symbols to show
		local basics = require("mini.basics")
		basics.setup({
			-- Options. Set to `false` to disable.
			options = {
				-- Extra UI features ('winblend', 'cmdheight=0', ...)
				extra_ui = true,
				-- Presets for window borders ('single', 'double', ...)
				win_borders = "bold",
			},
			mappings = {
				windows = true,
				move_with_alt = true,
			},
			autocommands = {
				relnum_in_visual_mode = true,
			},
		})
	end,
}
