local palette

if vim.o.background == "dark" then
	palette = {
		base00 = "#1e1e2e", -- Default Background
		base01 = "#181825", -- Lighter Background (Used for status bars, line number and folding marks)
		base02 = "#313244", -- Selection Background
		base03 = "#45475a", -- Comments, Invisibles, Line Highlighting
		base04 = "#585b70", -- Dark Foreground (Used for status bars)
		base05 = "#cdd6f4", -- Default Foreground, Caret, Delimiters, Operators
		base06 = "#f5e0dc", -- Light Foreground (Not often used)
		base07 = "#b4befe", -- Light Background (Not often used)
		base08 = "#ED4841", -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
		base09 = "#32A22D", -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
		base0A = "#CB4541", -- Classes, Markup Bold, Search Text Background
		base0B = "#205710", -- Strings, Inherited Class, Markup Code, Diff Inserted
		base0C = "#2F8FFB", -- Support, Regular Expressions, Escape Characters, Markup Quotes
		base0D = "#0F6FDB", -- Functions, Methods, Attribute IDs, Headings
		base0E = "#EA802F", -- Keywords, Storage, Selector, Markup Italic, Diff Changed
		base0F = "#B4400A", -- Deprecated, Opening/Closing Embedded Language Tags
	}
end

if vim.o.background == "light" then
	palette = {
		base00 = "#E0E0E0", -- Default Background
		base01 = "#C0C0C0", -- Lighter Background (Used for status bars, line number and folding marks)
		base02 = "#909090", -- Selection Background
		base03 = "#A0A0A0", -- Comments, Invisibles, Line Highlighting
		base04 = "#707070", -- Dark Foreground (Used for status bars)
		base05 = "#505050", -- Default Foreground, Caret, Delimiters, Operators
		base06 = "#303030", -- Light Foreground (Not often used)
		base07 = "#101010", -- Light Background (Not often used)
		base08 = "#ED4841", -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
		base09 = "#32A22D", -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
		base0A = "#CB4541", -- Classes, Markup Bold, Search Text Background
		base0B = "#205710", -- Strings, Inherited Class, Markup Code, Diff Inserted
		base0C = "#2F8FFB", -- Support, Regular Expressions, Escape Characters, Markup Quotes
		base0D = "#0F6FDB", -- Functions, Methods, Attribute IDs, Headings
		base0E = "#EA802F", -- Keywords, Storage, Selector, Markup Italic, Diff Changed
		base0F = "#B4400A", -- Deprecated, Opening/Closing Embedded Language Tags
	}
end

if palette then
	require("mini.base16").setup({ palette = palette })
	vim.g.colors_name = "swahpy"
end
