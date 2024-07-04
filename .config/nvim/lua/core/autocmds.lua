local autocmd = vim.api.nvim_create_autocmd
--> setup for formatoptions
autocmd({ "FileType" }, {
	group = vim.api.nvim_create_augroup("FormatOptions", { clear = true }),
	pattern = { "*" },
	callback = function()
		vim.opt_local.fo:append("2")
		vim.opt_local.fo:remove("o")
	end,
})
--> setup lsp related keymaps
autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
	callback = function(event)
		local map = vim.keymap.set
		local opt = { buffer = event.buf, silent = true }

		opt.desc = "Show line diagnostics"
		map("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opt)
		-- opt.desc = "Go to previous diagnostic"
		-- map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opt)
		-- opt.desc = "Go to next diagnostic"
		-- map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opt)
		opt.desc = "Show documentation for what is under cursor"
		map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opt)
		-- opt.desc = "Show LSP definitions"
		-- map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opt)
		-- opt.desc = "Go to declaration"
		-- map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opt)
		-- opt.desc = "Show LSP implementations"
		-- map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opt)
		-- opt.desc = "Show LSP type definitions"
		-- map("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opt)
		-- opt.desc = "Show LSP references"
		-- map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opt)
		-- opt.desc = "Show LSP signature help"
		-- map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opt)
		opt.desc = "Smart rename"
		map("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", opt)
		opt.desc = "Format code"
		map({ "n", "x" }, "<leader>cf", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opt)
		opt.desc = "See available code actions"
		map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opt)
	end,
})
-- setup for certain filetypes
autocmd({ "FileType" }, {
	desc = "Splitjoin behavior for lua file",
	callback = function()
		if vim.bo.filetype == "lua" then
			local gen_hook = require("mini.splitjoin").gen_hook
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
