return {
	"echasnovski/mini.base16",
	version = false,
	config = function()
		local base16 = require("mini.base16")
		base16.setup({
			-- Table with names from `base00` to `base0F` and values being strings of
			-- HEX colors with format "#RRGGBB". NOTE: this should be explicitly
			-- supplied in `setup()`.
			palette = {
				base00 = "#112641",
				base01 = "#3a475e",
				base02 = "#606b81",
				base03 = "#8691a7",
				base04 = "#d5dc81",
				base05 = "#e2e98f",
				base06 = "#eff69c",
				base07 = "#fcffaa",
				base08 = "#ffcfa0",
				base09 = "#cc7e46",
				base0A = "#46a436",
				base0B = "#9ff895",
				base0C = "#ca6ecf",
				base0D = "#42f7ff",
				base0E = "#ffc4ff",
				base0F = "#00a5c5",
			},

			-- Whether to support cterm colors. Can be boolean, `nil` (same as
			-- `false`), or table with cterm colors. See `setup()` documentation for
			-- more information.
			use_cterm = nil,

			-- Plugin integrations. Use `default = false` to disable all integrations.
			-- Also can be set per plugin (see |MiniBase16.config|).
			plugins = { default = true },
		})
	end,
}
