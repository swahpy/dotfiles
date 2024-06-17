return {
	"echasnovski/mini.clue",
	version = false,
	config = function()
		local clue = require("mini.clue")
		local compute_dynamic_width = function(buf_id)
			local max_width = 0.4 * vim.o.columns
			local widths = vim.tbl_map(vim.fn.strdisplaywidth, vim.api.nvim_buf_get_lines(buf_id, 0, -1, false))
			table.sort(widths)
			for i = #widths, 1, -1 do
				if widths[i] <= max_width then
					return widths[i]
				end
			end

			return max_width
		end

		local round = function(x)
			return math.floor(x + 0.5)
		end

		local win_config_center = function(buf_id)
			local height = vim.api.nvim_buf_line_count(buf_id)
			local width = compute_dynamic_width(buf_id)
			return {

				height = height,
				width = width,
				anchor = "NW",
				row = round(0.5 * (vim.o.lines - height)),
				col = round(0.5 * (vim.o.columns - width)),
			}
		end
		clue.setup({
			triggers = {
				-- Leader triggers
				{ mode = "n", keys = "<leader>" },
				{ mode = "x", keys = "<leader>" },
				-- Built-in completion
				{ mode = "i", keys = "<C-x>" },
				-- `\` key
				{ mode = "n", keys = "\\" },
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
				config = win_config_center,
			},
		})
	end,
}
