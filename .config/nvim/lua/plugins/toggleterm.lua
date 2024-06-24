return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		local toggleterm = require("toggleterm")
		toggleterm.setup({
			-- size can be a number or function which is passed the current terminal
			size = function(term)
				if term.direction == "horizontal" then
					return vim.o.lines * 0.4
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.4
				end
			end,
			open_mapping = [[<C-t>]],
			autochdir = false,
		})
		--> keymaps
		local nmap_leader = function(suffix, rhs, desc)
			vim.keymap.set("n", "<Leader>" .. suffix, rhs, { desc = desc })
		end
		nmap_leader("Tx", function()
			local params = vim.fn.input("Please enter terminal parameters(size/dir/name):\n> ")
			vim.cmd("ToggleTerm direction=horizontal " .. params)
		end, "+open a horizontal split terminal")
		nmap_leader("Tv", function()
			local params = vim.fn.input("Please enter terminal parameters(size/dir/name):\n> ")
			vim.cmd("ToggleTerm direction=vertical " .. params)
		end, "+open a vertical split terminal")
		nmap_leader("Ta", "<cmd>ToggleTermToggleAll<cr>", "+toggle all terminals")
	end,
}
