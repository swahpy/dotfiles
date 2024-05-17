return {
	"mfussenegger/nvim-lint",
	enabled = false,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft({
			markdown = { "markdownlint" },
			python = { "pylint" },
		})
	end,
}
