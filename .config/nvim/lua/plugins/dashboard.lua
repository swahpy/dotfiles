return {
  'nvimdev/dashboard-nvim',
  dependencies = { {'nvim-tree/nvim-web-devicons'}},
  event = 'VimEnter',
  opts = {
    --  config used for theme
		config = {
      week_header = {
        enable = true, --boolean use a week header
        -- concat = "Hongyun", --concat string after time string line
        append = {
          "⠀⢀⣴⣦⠀⠀⠀⠀⢰⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
          "⣰⣿⣿⣿⣷⡀⠀⠀⢸⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
          "⣿⣿⣿⣿⣿⣿⣄⠀⢸⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⠿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
          "⣿⣿⣿⠈⢿⣿⣿⣦⢸⣿⣿⡇⠀⣠⠴⠒⠢⣄⠀⠀⣠⠴⠲⠦⣄⠐⣶⣆⠀⠀⢀⣶⡖⢰⣶⠀⢰⣶⣴⡶⣶⣆⣴⡶⣶⣶⡄",
          "⣿⣿⣿⠀⠀⠻⣿⣿⣿⣿⣿⡇⢸⣁⣀⣀⣀⣘⡆⣼⠁⠀⠀⠀⠘⡇⠹⣿⡄⠀⣼⡿⠀⢸⣿⠀⢸⣿⠁⠀⢸⣿⡏⠀⠀⣿⣿",
          "⠹⣿⣿⠀⠀⠀⠙⣿⣿⣿⡿⠃⢸⡀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⢀⡏⠀⢻⣿⣸⣿⠁⠀⢸⣿⠀⢸⣿⠀⠀⢸⣿⡇⠀⠀⣿⣿",
          "⠀⠈⠻⠀⠀⠀⠀⠈⠿⠋⠀⠀⠈⠳⢤⣀⣠⠴⠀⠈⠧⣄⣀⡠⠞⠁⠀⠀⠿⠿⠃⠀⠀⢸⣿⠀⢸⣿⠀⠀⠸⣿⡇⠀⠀⣿⡿",
        },
      },
      -- disable_move  = true, -- boolean default is false disable move key
      shortcut = {
        { desc = '💤 Lazy', group = 'lazy', action = 'Lazy', key = 'L' },
        { desc = ' File Explorer', group = 'nvim-tree', action = 'NvimTreeToggle', key = 'e' },
        { desc = '󰮗 Find Files', group = 'telescope', action = 'Telescope find_files', key = 'f' },
        { desc = ' Recent Files', group = 'telescope', action = 'Telescope oldfiles', key = 'r' },
        { desc = ' New File', group = 'vim', action = 'ene', key = 'n' },
        { desc = '󰦛 Restore Session', group = 'session', action = 'SessionRestore', key = 's' },
        { desc = '󰿅 Quit Neovim', group = 'vim', action = 'qa', key = 'q' },
      },
      footer = {
        "",
        "If you don't keep moving, you'll quickly fall behind." 
      },
    },    
		hide = {
			statusline = false,   -- hide statusline default is true
			tabline = true,       -- hide the tabline
			winbar = true,        -- hide winbar
		},
  },
  keys = {
    { "<leader>d", "<cmd>Dashboard<cr>", desc = "Open dashboard" },
  },
}
