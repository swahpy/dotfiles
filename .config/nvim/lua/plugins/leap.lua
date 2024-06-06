return {
	"ggandor/leap.nvim",
	enabled = true,
	lazy = false,
	keys = {
		{ "S", mode = { "n" }, desc = "Leap Forward or Backward to" },
		{ "<A-s>", mode = { "n" }, desc = "Leap from windows" },
		-- { "s", mode = { "x", "o" }, desc = "Leap Forward to" },
		{ "S", mode = { "x", "o" }, desc = "Leap Forward or Backward to" },
	},
	config = function(_, opts)
		local leap = require("leap")
		for k, v in pairs(opts) do
			leap.opts[k] = v
		end
		local map = vim.keymap.set
		map("n", "S", "<Plug>(leap)")
		map("n", "<A-s>", "<Plug>(leap-from-window)")
		map({ "x", "o" }, "S", "<Plug>(leap)")
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
