return {
	"echasnovski/mini.pick",
	config = function()
		local pick = require("mini.pick")
		-- Centered on screen
		-- local win_config = function()
		-- 	local height = math.floor(0.618 * vim.o.lines)
		-- 	local width = math.floor(0.618 * vim.o.columns)
		-- 	return {
		-- 		anchor = "NW",
		-- 		height = height,
		-- 		width = width,
		-- 		row = math.floor(0.5 * (vim.o.lines - height)),
		-- 		col = math.floor(0.5 * (vim.o.columns - width)),
		-- 	}
		-- end
		pick.setup({
			-- Keys for performing actions. See `:h MiniPick-actions`.
			mappings = {
				caret_left = "<A-h>",
				caret_right = "<A-l>",

				choose = "<CR>",
				choose_in_split = "<A-s>",
				choose_in_tabpage = "<A-t>",
				choose_in_vsplit = "<A-v>",
				choose_marked = "<A-CR>",

				delete_char = "<BS>",
				delete_char_right = "<Del>",
				delete_left = "<C-u>",
				delete_word = "<A-Backspace>",

				mark = "<A-m>",
				mark_all = "<A-a>",

				move_down = "<A-j>",
				move_start = "<A-g>",
				move_up = "<A-k>",

				paste = "<A-p>",

				refine = "<A-r>",
				refine_marked = "<C-r>",

				scroll_down = "<A-d>",
				scroll_left = "<A-b>",
				scroll_right = "<A-f>",
				scroll_up = "<A-u>",
			},

			-- General options
			options = {
				-- Whether to cache matches (more speed and memory on repeated prompts)
				use_cache = true,
			},
			-- Source definition. See `:h MiniPick-source`.
			source = {
				items = nil,
				name = nil,
				cwd = nil,

				match = nil,
				show = pick.default_show,
				preview = nil,

				choose = nil,
				choose_marked = nil,
			},
		})
		--> keymaps
		local map = vim.keymap.set
		local builtin = pick.builtin
		map("n", "<leader>fb", function()
			builtin.buffers()
		end, { desc = "Pick from buffers" })
		map("n", "<leader>ff", function()
			builtin.files()
		end, { desc = "Pick from files" })
		map("n", "<leader>fg", function()
			builtin.grep_live()
		end, { desc = "Pick from pattern matches with live feedback" })
		map("n", "<leader>fh", function()
			builtin.help()
		end, { desc = "Pick from help tags" })
		map("n", "<leader>fr", function()
			builtin.resume()
		end, { desc = "Pick from help tags" })
	end,
}
