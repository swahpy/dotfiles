return {
	"kawre/neotab.nvim",
	enabled = true,
	event = "InsertCharPre",
	opts = {
		tabkey = "",
		act_as_tab = true,
		---@diagnostic disable-next-line
		behavior = "nested", ---@type ntab.behavior
		---@diagnostic disable-next-line
		pairs = { ---@type ntab.pair[]
			{ open = "(", close = ")" },
			{ open = "[", close = "]" },
			{ open = "{", close = "}" },
			{ open = "'", close = "'" },
			{ open = '"', close = '"' },
			{ open = "`", close = "`" },
			{ open = "<", close = ">" },
		},
		exclude = {},
		smart_punctuators = {
			enabled = false,
			semicolon = {
				enabled = false,
				ft = { "cs", "c", "cpp", "java" },
			},
			escape = {
				enabled = false,
				---@diagnostic disable-next-line
				triggers = {}, ---@type table<string, ntab.trigger>
			},
		},
	},
}
