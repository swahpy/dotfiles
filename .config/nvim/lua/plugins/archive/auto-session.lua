return {
	"rmagatti/auto-session",
	lazy = false,
	opts = {
		log_level = "info",
		auto_session_enable_last_session = false,
		auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
		auto_session_enabled = true,
		auto_save_enabled = true,
		auto_restore_enabled = true,
		auto_session_suppress_dirs = nil,
		auto_session_use_git_branch = true,
		-- the configs below are lua only
		bypass_session_save_file_types = nil,
		cwd_change_handling = {
			post_cwd_changed_hook = function()
				-- load sessin in new cwd if any
				vim.cmd("SessionRestore")
				print("cwd change!")
				-- refresh lualine so the new session name is displayed in the status bar
				require("lualine").refresh()
			end,
		},
		post_save_cmds = {
			function()
				print("Session has been saved!")
			end,
		},
	},
	config = function(_, opts)
		-- For a better experience with the plugin,
		-- below sessionoptions is recommended.
		vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

		-- setup auto-session
		local session = require("auto-session")
		session.setup(opts)

		vim.keymap.set(
			"n",
			"<leader>sf",
			require("auto-session.session-lens").search_session,
			{ noremap = true, desc = "[F]ind sessions" }
		)
	end,
	keys = {
		{ "<leader>ss", "<cmd>SessionSave<cr>", "[S]ave session for cwd" },
		{ "<leader>sr", "<cmd>SessionRestore<cr>", "[R]estore session for cwd" },
		{ "<leader>sD", "<cmd>SessionDelete<cr>", "[D]elete session" },
		{ "<leader>sp", "<cmd>SessionPurgeOrphaned<cr>", "[P]urgeOrphaed: Removes all orphaned sessions" },
		{ "<leader>sF", "<cmd>Autosession search<cr>", "[F]ind a session" },
		{ "<leader>sd", "<cmd>Autosession delete<cr>", "[D]elete session(s)" },
	},
}
