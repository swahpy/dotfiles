return {
	"christoomey/vim-tmux-navigator", -- tmux & split window navigation
	{
		"szw/vim-maximizer",
		keys = {
			{
				"<leader>wm",
				"<cmd>MaximizerToggle<CR>",
				desc = "Maximize/minimize a split window",
			},
		},
	},
}
