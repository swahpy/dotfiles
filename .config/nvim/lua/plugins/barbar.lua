return {
	'romgrk/barbar.nvim',
  version = '^1.0.0', -- optional: only update when a new 1.x version is released
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function() vim.g.barbar_auto_setup = false end,
  opts = {
    focus_on_close = "previous",
    icons = {
      buffer_index = true,
      buffer_number = "subscript",
      present = "powerline",
    },
    -- Comment below because I use nvim-tree in float mode.
    -- If you set it to sidebar, then enable below config.
		-- sidebar_filetypes = {
		-- 	-- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
		-- 	NvimTree = true,
		-- },
  },
  keys = {

  },
}
