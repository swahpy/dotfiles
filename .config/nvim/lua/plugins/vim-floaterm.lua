return {
	"voldikss/vim-floaterm",
	config = function()
		--> setup Alt-N to enter normal mode
		vim.keymap.set("t", "<A-n>", "<C-\\><C-n>", { desc = "Enter normal mode in terminal" })
		--> setup floaterm
		vim.g.floaterm_height = 0.9
		vim.g.floaterm_width = 0.8
		vim.g.floaterm_title = "term$1/$2"
		vim.g.floaterm_titleposition = "center"
		--> setup floaterm keymaps
		local wk = require("which-key")
		wk.register({
			["<leader>t"] = {
				name = "floaterm",
				O = {
					function()
						local param = vim.fn.input("Please enter options and cmd:")
						vim.cmd("FloatermNew " .. param)
					end,
					"Open a floaterm window",
				},
				o = {
					function()
						local param = vim.fn.input("Please enter options and cmd:")
						vim.cmd("FloatermNew! " .. param)
					end,
					"Open a floaterm window, exec command in $SHELL",
				},
				p = {
					"<cmd>FloatermPrev<cr>",
					"Navigate to previous floaterm",
				},
				n = {
					"<cmd>FloatermNext<cr>",
					"Navigate to next floaterm",
				},
				f = {
					"<cmd>FloatermFirst<cr>",
					"Navigate to first floaterm",
				},
				l = {
					"<cmd>FloatermLast<cr>",
					"Navigate to last floaterm",
				},
				u = {
					"<cmd>FloatermUpdate<cr>",
					"Update floaterm window attributes",
				},
				T = {
					function()
						local name = vim.fn.input("Please enter floaterm name: ")
						vim.cmd("FloatermToggle " .. name)
					end,
					"Open or hide the floaterm window",
				},
				t = {
					"<cmd>FloatermToggle!<cr>",
					"Toggle all floaterm windows",
				},
				S = {
					function()
						local name = vim.fn.input("Please enter floaterm name: ")
						vim.cmd("FloatermShow " .. name)
					end,
					"Show current floaterm window",
				},
				s = {
					"<cmd>FloatermShow!<cr>",
					"Show all floaterm windows",
				},
				H = {
					function()
						local name = vim.fn.input("Please enter floaterm name: ")
						vim.cmd("FloatermHide " .. name)
					end,
					"Hide current floaterm window",
				},
				h = {
					"<cmd>FloatermToggle!<cr>",
					"Hide all floaterm windows",
				},
				K = {
					function()
						local name = vim.fn.input("Please enter floaterm name: ")
						vim.cmd("FloatermKill " .. name)
					end,
					"Kill current floaterm window",
				},
				k = {
					"<cmd>FloatermKill!<cr>",
					"Kill all floaterm windows",
				},
				r = {
					function()
						local cmd = vim.fn.input("Please input the command to send: ")
						vim.cmd("FLoatermSend " .. cmd)
					end,
					"Send(Run) command to floaterm",
				},
			},
		})
	end,
}
