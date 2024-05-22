return {
	"echasnovski/mini.sessions",
	version = false,
	config = function()
		require("mini.sessions").setup({
			directory = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"),
		})
	end,
}
