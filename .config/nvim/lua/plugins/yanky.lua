return {
	"gbprod/yanky.nvim",
	config = function(_, opts)
		local pk = require("yanky.picker")
		local map = require("yanky.telescope.mapping")
		local yk = require("yanky")
		yk.setup(opts)
		yk.setup({
			picker = {
				select = {
					action = pk.actions.put("gp"),
				},
				telescope = {
					mappings = {
						i = {
							["<c-p>"] = map.put("p"),
							["<c-P>"] = map.put("P"),
							["<c-d>"] = map.delete(),
							["<c-r>"] = map.set_register(require("yanky.utils").get_default_register()),
						},
					},
				},
			},
		})

		local wk = require("which-key")
		wk.register({
			["<leader>y"] = {
				name = "+yanky",
				c = {
					"<cmd>YankyClearHistory<cr>",
					"[c]lear yanky history",
				},
				-- Yanky comes with a text object corresponding to last put text
				l = {
					function()
						require("yanky.textobj").last_put()
					end,
					"[l]ast put text",
				},
			},
		})
	end,
}
