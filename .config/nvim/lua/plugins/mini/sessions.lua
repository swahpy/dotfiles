return {
	"echasnovski/mini.sessions",
	version = false,
	config = function()
		local session = require("mini.sessions")
		session.setup({
			directory = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"),
			-- Whether to read latest session if Neovim opened without file arguments
			autoread = true,
			-- File for local session (use `''` to disable)
			file = "session.vim",
		})
		--> keymaps
		vim.keymap.set("n", "<Leader>ss", function()
			local cwd = vim.fn.getcwd()
			local basename = vim.fn.fnamemodify(cwd, ":t")
			session.write(basename)
		end, { desc = "[s]ave a global session" })
		vim.keymap.set("n", "<Leader>sl", function()
			session.write(session.config.file)
		end, { desc = "save a [l]ocal session" })
		vim.keymap.set("n", "<Leader>sp", function()
			session.select()
		end, {
			desc = "[p]ick a session",
		})
		vim.keymap.set("n", "<Leader>sd", function()
			local sessions = {}
			local keystr = ""
			local n = 0
			for k, _ in pairs(session.detected) do
				n = n + 1
				sessions[n] = k
				keystr = keystr .. n .. ": " .. k .. "\n"
			end
			local numstr = vim.fn.input(
				"Below are current sessions, please select the one to delete(1/2/...):\n" .. keystr .. "\n> "
			)
			if numstr == "" then
				return
			end
			local num = tonumber(numstr)
			if num <= n then
				session.delete(sessions[num])
			else
				print("You entered a wrong number")
			end
		end, {
			desc = "[d]elete a session",
		})
	end,
}
