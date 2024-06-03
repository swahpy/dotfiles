return {
	"echasnovski/mini.misc",
	version = false,
	config = function()
		local misc = require("mini.misc")
		misc.setup({
			-- Array of fields to make global (to be used as independent variables)
			make_global = { "put", "put_text" },
		})
		misc.setup_restore_cursor()
		--> keymaps
		local map = vim.keymap.set
		map("n", "<leader><leader>z", function()
			misc.zoom()
		end, { desc = "Toggle [z]oom current buffer" })
	end,
}
