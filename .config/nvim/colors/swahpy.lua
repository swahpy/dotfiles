require("mini.base16").setup({
	palette = {
		base00 = "#F5F6F7", -- Default Background
		base01 = "#D0D0D0", -- Lighter Background (Used for status bars, line number and folding marks)
		base02 = "#B0B0B0", -- Selection Background
		base03 = "#909090", -- Comments, Invisibles, Line Highlighting
		base04 = "#707070", -- Dark Foreground (Used for status bars)
		base05 = "#505050", -- Default Foreground, Caret, Delimiters, Operators
		base06 = "#303030", -- Light Foreground (Not often used)
		base07 = "#101010", -- Light Background (Not often used)
		base08 = "#32A22D", -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
		base09 = "#205710", -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
		base0A = "#ED4841", -- Classes, Markup Bold, Search Text Background
		base0B = "#CB4541", -- Strings, Inherited Class, Markup Code, Diff Inserted
		base0C = "#2F8FFB", -- Support, Regular Expressions, Escape Characters, Markup Quotes
		base0D = "#0F6FDB", -- Functions, Methods, Attribute IDs, Headings
		base0E = "#F4902A", -- Keywords, Storage, Selector, Markup Italic, Diff Changed
		base0F = "#B4400A", -- Deprecated, Opening/Closing Embedded Language Tags
	},
})

vim.g.colors_name = "swahpy"
