return {
	{
		"catppuccin/nvim",
		enabled = false,
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "latte", -- latte, frappe, macchiato, mocha
			transparent_background = false, -- disables setting the background color.
			term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
			dim_inactive = {
				enabled = false, -- dims the background color of inactive window
				shade = "dark",
				percentage = 0.15, -- percentage of the shade to apply to the inactive window
			},
			integrations = {
				-- https://github.com/catppuccin/nvim#integrations
				barbar = true,
				lsp_trouble = true,
				mason = true,
				noice = true,
				notify = true,
				which_key = true,
			},
		},
		config = function(_, opts)
			local cpc = require("catppuccin")
			cpc.setup(opts)
			-- setup must be called before loading
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	-- {
	-- 	"uloco/bluloco.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	dependencies = { "rktjmp/lush.nvim" },
	-- 	config = function()
	-- 		require("bluloco").setup({
	-- 			style = "light", -- "auto" | "dark" | "light"
	-- 			transparent = false,
	-- 			italics = false,
	-- 			terminal = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
	-- 			guicursor = true,
	-- 		})
	-- 		vim.opt.termguicolors = true
	-- 		vim.cmd("colorscheme bluloco")
	-- 	end,
	-- },
	{
		"scottmckendry/cyberdream.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			require("cyberdream").setup({
				transparent = false,
				italic_comments = true,
				hide_fillchars = true,
				borderless_telescope = true,
				terminal_colors = true,
			})
			vim.cmd("colorscheme cyberdream") -- set the colorscheme
		end,
	},
}
