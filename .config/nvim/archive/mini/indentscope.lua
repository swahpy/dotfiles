return {
	"echasnovski/mini.indentscope",
	version = false,
	config = function()
		local indent = require("mini.indentscope")
		indent.setup({})
		-- Disable for certain filetypes
		vim.api.nvim_create_autocmd({ "FileType" }, {
			desc = "Disable indentscope for certain filetypes",
			callback = function()
				local ignore_filetypes = {
					"dashboard",
					"floaterm",
					"help",
					"lazy",
					"mason",
					"notify",
					"Trouble",
				}
				if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
					vim.b.miniindentscope_disable = true
				end
			end,
		})
	end,
}
