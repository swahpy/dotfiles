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
			local keys = {}
			for k, _ in pairs(session.detected) do
				table.insert(keys, k)
			end
			table.sort(keys)
			local keystr = table.concat(keys, "\n")
			print(keystr)
			local sessionname = vim.fn.input(
				"Below are current sessions, please enter the name you want to delete:\n" .. keystr .. "\n> "
			)
			if sessionname ~= nil then
				session.delete(sessionname)
			else
				print("deletion needs a session name.")
			end
		end, {
			desc = "[d]elete a session",
		})
	end,
}
