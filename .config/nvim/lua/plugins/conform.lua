return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
	opts = {
		formatters_by_ft = {
			go = { "goimports", "gofumpt" }, -- Conform will run multiple formatters sequentially
			jason = { "jq" },
			lua = { "stylua" },
			markdown = { "markdownlint" },
			python = { "ruff" },
			yaml = { "yq" },
		},
		-- Set the log level. Use `:ConformInfo` to see the location of the log file.
		log_level = vim.log.levels.ERROR,
		-- Conform will notify you when a formatter errors
		notify_on_error = true,
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_fallback = true,
		},
	},
	keys = {
		{
			"<leader><leader>f",
			function()
				require("conform").format({
					timeout_ms = 500,
					lsp_fallback = true,
				})
			end,
			mode = { "n", "v" },
			desc = "Format buffer",
		},
	},
}
