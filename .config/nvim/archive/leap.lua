return {
	"ggandor/leap.nvim",
	enabled = true,
	lazy = false,
	config = function(_, opts)
		local leap = require("leap")
		for k, v in pairs(opts) do
			leap.opts[k] = v
		end
		local nmap = function(lhs, rhs, desc)
			vim.keymap.set("n", lhs, rhs, { desc = desc })
		end
		nmap("S", "<Plug>(leap)", "+leap backward or forward")
		nmap("<A-s>", "<Plug>(leap-from-window)", "+leap from window")
		vim.keymap.set({ "x", "o" }, "S", "<Plug>(leap)", { desc = "+leap backward or forward" })
		-- map({ "x", "o" }, "S", "<Plug>(leap-backward)")
		-- Define equivalence classes for brackets and quotes, in addition to
		-- the default whitespace group.
		leap.opts.equivalence_classes = { " \t\r\n", "([{", ")]}", "'\"`" }

		-- Override some old defaults - use backspace instead of tab (see issue #165).
		leap.opts.special_keys.prev_target = "<backspace>"
		leap.opts.special_keys.prev_group = "<backspace>"

		-- Use the traversal keys to repeat the previous motion without explicitly
		-- invoking Leap.
		require("leap.user").set_repeat_keys("<tab>", "<backspace>")
	end,
}
