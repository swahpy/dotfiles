return {
	"olimorris/persisted.nvim",
	enabled = false,
	lazy = false, -- make sure the plugin is always loaded at startup
	-- comment out below line to enable dashboard first
	-- cmd = "SessionLoad",
	opts = {
		save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"), -- directory where session files are saved
		silent = false, -- silent nvim message when sourcing session file
		use_git_branch = true, -- create session files based on the branch of a git enabled repository
		default_branch = "main", -- the branch to load if a session file is not found for the current branch
		autosave = true, -- automatically save session files when exiting Neovim
		should_autosave = function()
			-- do not autosave if the dashboard is the current filetype
			if vim.bo.filetype == "dashboard" then
				return false
			end
			return true
		end, -- function to determine if a session should be autosaved
		autoload = true, -- automatically load the session for the cwd on Neovim startup
		on_autoload_no_session = function()
			vim.notify("No available session for current workspace yet.")
		end, -- function to run when `autoload = true` but there is no session to load
		follow_cwd = false, -- change session file name to match current working directory if it changes
		allowed_dirs = nil, -- table of dirs that the plugin will auto-save and auto-load from
		ignored_dirs = nil, -- table of dirs that are ignored when auto-saving and auto-loading
		ignored_branches = nil, -- table of branch patterns that are ignored for auto-saving and auto-loading
		telescope = {
			reset_prompt = true, -- Reset the Telescope prompt after an action?
			mappings = { -- table of mappings for the Telescope extension
				change_branch = "<a-b>",
				copy_session = "<a-c>",
				delete_session = "<a-d>",
			},
			icons = { -- icons displayed in the picker, set to nil to disable entirely
				branch = " ",
				dir = " ",
				selected = " ",
			},
		},
	},
	config = function(_, opts)
		-- For a better experience with the plugin,
		-- below sessionoptions is recommended.
		vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

		local persisted = require("persisted")
		persisted.setup(opts)

		local group = vim.api.nvim_create_augroup("PersistedHooks", {})
		--> setup autocommand based on persisted events <--
		-- save current session before open a new session via telescope
		vim.api.nvim_create_autocmd({ "User" }, {
			pattern = "PersistedTelescopeLoadPre",
			group = group,
			---@diagnostic disable-next-line: unused-local
			callback = function(session)
				-- Save the currently loaded session using a global variable
				require("persisted").save({ session = vim.g.persisted_loaded_session })
				-- Delete all of the open buffers
				vim.api.nvim_input("<ESC>:%bd!<CR>")
				-- refresh lualine session name
				require("lualine").refresh()
			end,
		})
		-- print info before loading and saving a session
		vim.api.nvim_create_autocmd({ "User" }, {
			pattern = "PersistedSavePost",
			group = group,
			callback = function()
				print("Session has been saved!")
			end,
		})
	end,
	keys = {
		{ "<leader>ss", "<cmd>SessionSave<cr>", desc = "Save current session" },
		{ "<leader>sr", "<cmd>SessionLoad<cr>", desc = "Load session for cwd" },
		{ "<leader>sl", "<cmd>SessionLoadLast<cr>", desc = "Load most recent session" },
		{ "<leader>sd", "<cmd>SessionDelete<cr>", desc = "Delete current session" },
		{ "<leader>st", "<cmd>SessionToggle<cr>", desc = "To load, start or stop a session" },
	},
}
