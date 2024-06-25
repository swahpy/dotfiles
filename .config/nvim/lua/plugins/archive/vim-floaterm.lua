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
		local nmap_leader = function(suffix, rhs, desc)
			vim.keymap.set("n", "<Leader>" .. suffix, rhs, { desc = desc })
		end
		nmap_leader("tf", "<cmd>FloatermFirst<cr>", "Navigate to first floaterm")
		nmap_leader("th", "<cmd>FloatermToggle!<cr>", "Hide all floaterm windows")
		nmap_leader("tH", function()
			local name = vim.fn.input("Please enter floaterm name: ")
			vim.cmd("FloatermHide " .. name)
		end, "Hide current floaterm window")
		nmap_leader("tk", "<cmd>FloatermKill!<cr>", "Kill all floaterm windows")
		nmap_leader("tK", function()
			local name = vim.fn.input("Please enter floaterm name: ")
			vim.cmd("FloatermKill " .. name)
		end, "Kill current floaterm window")
		nmap_leader("tl", "<cmd>FloatermLast<cr>", "Navigate to last floaterm")
		nmap_leader("tn", "<cmd>FloatermNext<cr>", "Navigate to next floaterm")
		nmap_leader("to", function()
			local param = vim.fn.input("Please enter options and cmd:")
			vim.cmd("FloatermNew! " .. param)
		end, "Open a floaterm window, exec command in $SHELL")
		nmap_leader("tO", function()
			local param = vim.fn.input("Please enter options and cmd:")
			vim.cmd("FloatermNew " .. param)
		end, "+open a floaterm window")
		nmap_leader("tp", "<cmd>FloatermPrev<cr>", "Navigate to previous floaterm")
		nmap_leader("tr", function()
			local cmd = vim.fn.input("Please input the command to send: ")
			vim.cmd("FLoatermSend " .. cmd)
		end, "Send(Run) command to floaterm")
		nmap_leader("ts", "<cmd>FloatermShow!<cr>", "Show all floaterm windows")
		nmap_leader("tS", function()
			local name = vim.fn.input("Please enter floaterm name: ")
			vim.cmd("FloatermShow " .. name)
		end, "Show current floaterm window")
		nmap_leader("tt", "<cmd>FloatermToggle!<cr>", "+toggle all floaterm windows")
		nmap_leader("tT", function()
			local name = vim.fn.input("Please enter floaterm name: ")
			vim.cmd("FloatermToggle " .. name)
		end, "+toggle a floaterm window")
		nmap_leader("tu", function()
			local params = vim.fn.input("Please enter floaterm window attributes: \n> ")
			vim.cmd("FloatermUpdate " .. params)
		end, "Update floaterm window attributes")
	end,
}
