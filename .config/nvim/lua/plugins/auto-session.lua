return {
  'rmagatti/auto-session',
  lazy = false,
  opts = {
  },
  config = function(_, opts) 
    vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
    local as = require("auto-session")
    as.setup {
      log_level = "info",
      auto_restore_enabled = false,
      auto_session_create_enabled = false,
      auto_save_enabled = false,
      auto_session_suppress_dirs = { "~/Downloads", "/"},
      -- print a message when session is saved.
      post_save_cmds = {
        function()
          print("session has been saved!")
        end
      },
      -- update lualine after cwd changes
      cwd_change_handling = {
        post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
          require("lualine").refresh() -- refresh lualine so the new session name is displayed in the status bar
        end,
      },
    }
  end,
  keys = {
    { "<leader>sr", "<cmd>SessionRestore<cr>", desc = "Restore session in cwd" },
    { "<leader>ss", "<cmd>SessionSave<cr>", desc = "Save session for cwd" },
  },
}
