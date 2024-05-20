return {
	"abecodes/tabout.nvim",
	enabled = false,
	dependencies = { -- These are optional
		"nvim-treesitter/nvim-treesitter",
		"L3MON4D3/LuaSnip",
		"hrsh7th/nvim-cmp",
	},
	event = "InsertCharPre", -- Set the event to 'InsertCharPre' for better compatibility
	priority = 1000,
	config = function()
		local tb = require("tabout")
		tb.setup({
			tabkey = "", -- key to trigger tabout, set to an empty string to disable
			backwards_tabkey = "", -- key to trigger backwards tabout, set to an empty string to disable
			act_as_tab = false, -- shift content if tab out is not possible
			act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
			default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
			default_shift_tab = "<C-d>", -- reverse shift default action,
			enable_backwards = true, -- well ...
			completion = true, -- if the tabkey is used in a completion pum
			tabouts = {
				{ open = "'", close = "'" },
				{ open = '"', close = '"' },
				{ open = "`", close = "`" },
				{ open = "(", close = ")" },
				{ open = "[", close = "]" },
				{ open = "{", close = "}" },
				{ open = "<", close = ">" },
			},
			ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
			exclude = {}, -- tabout will ignore these filetypes
		})
	end,
	keys = {
		{ "<A-f>", "<Plug>(TaboutMulti)", mode = "i", desc = "Tabout of current context (multiple lines)" },
		{
			"<A-b>",
			"<Plug>(TaboutBackMulti)",
			mode = "i",
			desc = "Tabout backwards of current context (multiple lines)",
		},
	},
}
