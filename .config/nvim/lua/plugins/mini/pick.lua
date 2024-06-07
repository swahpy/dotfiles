return {
	"echasnovski/mini.pick",
	version = false,
	config = function()
		local pick = require("mini.pick")
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

				scroll_down = "<C-d>",
				scroll_left = "<C-b>",
				scroll_right = "<C-f>",
				scroll_up = "<C-u>",
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
				show = nil,
				preview = nil,

				choose = nil,
				choose_marked = nil,
			},
		})
	end,
}
