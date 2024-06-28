return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	opts = {
		lsp = {
			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
			},
		},
		presets = {
			bottom_search = true, -- use a classic bottom cmdline for search
			command_palette = false, -- position the cmdline and popupmenu together
			long_message_to_split = false, -- long messages will be sent to a split
			inc_rename = true, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = false, -- add a border to hover docs and signature help
		},
		commands = {
			history = {
				view = "popup",
			},
			warnings = {
				-- options for the message history that you get with `:Noice`
				view = "popup",
				opts = { enter = true, format = "details" },
				filter = { warning = true },
				filter_opts = { reverse = true },
			},
		},
		routes = {
			{
				filter = {
					event = "msg_show",
					kind = "",
					find = "written",
				},
				opts = { skip = true },
			},
		},
	},
	config = function(_, opts)
		local noice = require("noice")
		noice.setup(opts)

		-- setup keymaps for noice
		local nmap_leader = function(suffix, rhs, desc)
			vim.keymap.set("n", "<Leader>" .. suffix, rhs, { desc = desc })
		end
		nmap_leader("na", "<cmd>Noice<cr>", "+noice message history")
		nmap_leader("nl", "<cmd>NoiceLast<cr>", "+last message")
		nmap_leader("nd", "<cmd>NoiceDismiss<cr>", "+dismiss all messages")
		nmap_leader("ne", "<cmd>NoiceErrors<cr>", "+error messages")
		nmap_leader("nD", "<cmd>NoiceDisable<cr>", "+disable noice")
		nmap_leader("nE", "<cmd>NoiceEnable<cr>", "+enable noice")
		nmap_leader("ns", "<cmd>NoiceStats<cr>", "+debugging stats")
		nmap_leader("nw", "<cmd>NoiceWarnings<cr>", "+warning messages")
		vim.keymap.set({ "n", "i", "s" }, "<A-u>", function()
			if not require("noice.lsp").scroll(4) then
				return "<A-u>"
			end
		end, { silent = true, expr = true })

		vim.keymap.set({ "n", "i", "s" }, "<A-d>", function()
			if not require("noice.lsp").scroll(-4) then
				return "<A-d>"
			end
		end, { silent = true, expr = true })

		--> setup timeout
		require("notify").setup({
			timeout = 1500,
			stages = "fade",
			render = "wrapped-compact",
		})
	end,
}
