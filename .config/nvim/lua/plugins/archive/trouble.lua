return {
	"folke/trouble.nvim",
	opts = {
		focus = true,
	},
	config = function(_, opts)
		local trouble = require("trouble")
		trouble.setup(opts)
		local nmap_leader = function(suffix, rhs, desc)
			vim.keymap.set("n", "<Leader>" .. suffix, rhs, { desc = desc })
		end
		nmap_leader("ct", "<cmd>Trouble diagnostics toggle<cr>", "Diagnostics (Trouble)")
		nmap_leader("cb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Buffer Diagnostics (Trouble)")
		nmap_leader("cs", "<cmd>Trouble symbols toggle focus=false<cr>", "Symbols (Trouble)")
		nmap_leader(
			"cl",
			"<cmd>Trouble lsp toggle focus=true win.position=bottom<cr>",
			"LSP Definitions / references / ... (Trouble)"
		)
		nmap_leader("cL", "<cmd>Trouble loclist toggle<cr>", "Location List (Trouble)")
		nmap_leader("cQ", "<cmd>Trouble qflist toggle<cr>", "Quickfix List (Trouble)")
	end,
}
