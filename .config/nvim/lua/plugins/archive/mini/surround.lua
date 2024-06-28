return {
	"echasnovski/mini.surround",
	version = false,
	config = function()
		local sr = require("mini.surround")
		sr.setup({
			-- Number of lines within which surrounding is searched
			n_lines = 500,

			-- Whether to respect selection type:
			-- - Place surroundings on separate lines in linewise mode.
			-- - Place surroundings on each line in blockwise mode.
			respect_selection_type = true,

			-- How to search for surrounding (first inside current line, then inside
			-- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
			-- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
			-- see `:h MiniSurround.config`.
			search_method = "cover_or_next",
		})
	end,
}
