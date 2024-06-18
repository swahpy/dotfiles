return {
	"echasnovski/mini.ai",
	desc = "Enhanced text objects",
	version = false,
	recommended = true,
	config = function()
		local ai = require("mini.ai")
		ai.setup({
			n_lines = 500,
			mappings = {
				-- Move cursor to corresponding edge of `a` textobject
				goto_left = "[[",
				goto_right = "]]",
			},
			custom_textobjects = {
				o = ai.gen_spec.treesitter({
					a = { "@block.outer", "@conditional.outer", "@loop.outer" },
					i = { "@block.inner", "@conditional.inner", "@loop.inner" },
				}, {}),
				f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
				c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
				t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
				d = { "%f[%d]%d+" }, -- digits
				h = { "%f[%S][%w%p]+%f[%s]", "^().*()$" }, -- match content between space
				j = { "%f[^%c][^%c]*", "^%s*().-()%s*$" }, -- match whole line
				e = { -- Word with case
					{
						"%u[%l%d]+%f[^%l%d]",
						"%f[%S][%l%d]+%f[^%l%d]",
						"%f[%P][%l%d]+%f[^%l%d]",
						"^[%l%d]+%f[^%l%d]",
					},
					"^().*()$",
				},
				g = function() -- Whole buffer, similar to `gg` and 'G' motion
					local from = { line = 1, col = 1 }
					local to = {
						line = vim.fn.line("$"),
						col = math.max(vim.fn.getline("$"):len(), 1),
					}
					return { from = from, to = to }
				end,
				u = ai.gen_spec.function_call(), -- u for "Usage"
				U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }), -- without dot in function name
			},
		})
	end,
}
