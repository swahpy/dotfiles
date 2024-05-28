return {
	"echasnovski/mini.splitjoin",
	version = false,
	config = function()
		local sj = require("mini.splitjoin")
		sj.setup({
			mappings = { toggle = "<leader>sj" },
		})
		-- setup for certain filetypes
		vim.api.nvim_create_autocmd({ "FileType" }, {
			desc = "Splitjoin behavior for lua file",
			callback = function()
				if vim.bo.filetype == "lua" then
					local gen_hook = sj.gen_hook
					local curly = { brackets = { "%b{}" } }
					-- Add trailing comma when splitting inside curly brackets
					local add_comma_curly = gen_hook.add_trailing_separator(curly)
					-- Delete trailing comma when joining inside curly brackets
					local del_comma_curly = gen_hook.del_trailing_separator(curly)
					-- Pad curly brackets with single space after join
					local pad_curly = gen_hook.pad_brackets(curly)
					-- Create buffer-local config
					vim.b.minisplitjoin_config = {
						split = { hooks_post = { add_comma_curly } },
						join = { hooks_post = { del_comma_curly, pad_curly } },
					}
				end
			end,
		})
	end,
}
