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

		-- yanky
		local nmap = function(suffix, rhs, desc)
			vim.keymap.set("n", "" .. suffix, rhs, { desc = desc })
		end
		local nmap_leader = function(suffix, rhs, desc)
			vim.keymap.set("n", "<Leader>" .. suffix, rhs, { desc = desc })
		end
		nmap_leader("yc", "<cmd>YankyClearHistory<cr>", "[c]lear yanky history")
		nmap_leader("yl", function()
			require("yanky.textobj").last_put()
		end, "[l]ast put text")
		nmap("y", "<Plug>(YankyYank)", "Yank text")
		nmap("p", "<Plug>(YankyPutAfter)", "Put yanked text after cursor")
		nmap("P", "<Plug>(YankyPutBefore)", "Put yanked text before cursor")
		nmap("gp", "<Plug>(YankyGPutAfter)", "Put yanked text after selection")
		nmap("gP", "<Plug>(YankyGPutBefore)", "Put yanked text before selection")
		nmap("<A-p>", "<Plug>(YankyPreviousEntry)", "Select previous entry through yank history")
		nmap("<A-n>", "<Plug>(YankyNextEntry)", "Select next entry through yank history")
		nmap("]p", "<Plug>(YankyPutIndentAfterLinewise)", "Put indented after cursor (linewise)")
		nmap("[p", "<Plug>(YankyPutIndentBeforeLinewise)", "Put indented before cursor (linewise)")
		nmap("]P", "<Plug>(YankyPutIndentAfterLinewise)", "Put indented after cursor (linewise)")
		nmap("[P", "<Plug>(YankyPutIndentBeforeLinewise)", "Put indented before cursor (linewise)")
		nmap(">p", "<Plug>(YankyPutIndentAfterShiftRight)", "Put after and indent right")
		nmap("<p", "<Plug>(YankyPutIndentAfterShiftLeft)", "Put after and indent left")
		nmap(">P", "<Plug>(YankyPutIndentBeforeShiftRight)", "Put before and indent right")
		nmap("<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", "Put before and indent left")
		nmap("=p", "<Plug>(YankyPutAfterFilter)", "Put after applying a filter")
		nmap("=P", "<Plug>(YankyPutBeforeFilter)", "Put before applying a filter")
	end,
}
