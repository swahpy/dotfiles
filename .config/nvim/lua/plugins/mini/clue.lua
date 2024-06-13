return {
	"echasnovski/mini.clue",
	version = false,
	config = function()
		local clue = require("mini.clue")
		clue.setup({
			triggers = {
				-- Leader triggers
				{ mode = "n", keys = "<leader>" },
				{ mode = "x", keys = "<leader>" },
				-- Built-in completion
				{ mode = "i", keys = "<C-x>" },

				-- `g` key
				{ mode = "n", keys = "g" },
				{ mode = "x", keys = "g" },

				-- Marks
				{ mode = "n", keys = "'" },
				{ mode = "n", keys = "`" },
				{ mode = "x", keys = "'" },
				{ mode = "x", keys = "`" },

				-- Registers
				{ mode = "n", keys = '"' },
				{ mode = "x", keys = '"' },
				{ mode = "i", keys = "<C-r>" },
				{ mode = "c", keys = "<C-r>" },

				-- Window commands
				{ mode = "n", keys = "<C-w>" },

				-- `z` key
				{ mode = "n", keys = "z" },
				{ mode = "x", keys = "z" },
			},
			clues = {
				-- Enhance this by adding descriptions for <Leader> mapping groups
				clue.gen_clues.builtin_completion(),
				clue.gen_clues.g(),
				clue.gen_clues.marks(),
				clue.gen_clues.registers(),
				clue.gen_clues.windows(),
				clue.gen_clues.z(),
				{ mode = "n", keys = "<Leader>b", desc = "+Buffers" },
				{ mode = "n", keys = "<Leader>c", desc = "+Code" },
				{ mode = "n", keys = "<Leader>l", desc = "+LSP" },
				{ mode = "n", keys = "<Leader>m", desc = "+Mason" },
				{ mode = "n", keys = "<Leader>p", desc = "+Pick" },
				{ mode = "n", keys = "<Leader>s", desc = "+Session" },
				{ mode = "n", keys = "<Leader>t", desc = "+Terminal" },
				{ mode = "n", keys = "<Leader>w", desc = "+Window" },
			},
			window = {
				config = {
					anchor = "SW",
					row = "auto",
					col = "auto",
					width = "auto",
				},
			},
		})
	end,
}
