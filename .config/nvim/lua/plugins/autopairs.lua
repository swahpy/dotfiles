return {
	"windwp/nvim-autopairs",
	enabled = false,
	event = "InsertEnter",
	opts = {
		check_ts = true,
		ts_config = {
			lua = { "string" }, -- it will not add a pair on that treesitter node
			javascript = { "template_string" },
			java = false, -- don't check treesitter on java
		},
	},
	config = function(_, opts)
		-- import nvim-autopairs completion functionality
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		-- import nvim-cmp plugin (completions plugin)
		local cmp = require("cmp")
		-- make autopairs and completion work together
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		-- setup autopairs
		local ap = require("nvim-autopairs")
		ap.setup(opts)
	end,
}
