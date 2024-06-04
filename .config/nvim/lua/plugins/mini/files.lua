return {
	"echasnovski/mini.files",
	version = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local files = require("mini.files")
		files.setup({
			-- Module mappings created only inside explorer.
			-- Use `''` (empty string) to not create one.
			mappings = {
				synchronize = "w",
				go_in_plus = "<CR>",
				go_out = "-",
			},
			-- General options
			options = {
				-- Whether to delete permanently or move into module-specific trash
				permanent_delete = false,
			},
			-- Customization of explorer windows
			windows = {
				-- Whether to show preview of file/directory under cursor
				preview = true,
				-- Width of preview window
				width_preview = 80,
				-- Width of focused window
				width_focus = 25,
			},
		})
		--> setup keymap for mini.files
		vim.keymap.set("n", "-", function()
			files.open(vim.api.nvim_buf_get_name(0))
		end, { desc = "Open mini files" })
		--> show/hide dotfiles
		local show_dotfiles = true
		---@diagnostic disable-next-line
		local filter_show = function(fs_entry)
			return true
		end
		local filter_hide = function(fs_entry)
			return not vim.startswith(fs_entry.name, ".")
		end
		local toggle_dotfiles = function()
			show_dotfiles = not show_dotfiles
			local new_filter = show_dotfiles and filter_show or filter_hide
			files.refresh({ content = { filter = new_filter } })
		end
		--> set current working directory
		---@diagnostic disable-next-line
		local files_set_cwd = function(path)
			-- Works only if cursor is on the valid file system entry
			local cur_entry_path = files.get_fs_entry().path
			local cur_directory = vim.fs.dirname(cur_entry_path)
			vim.fn.chdir(cur_directory)
		end
		--> open in split window
		local map_split = function(buf_id, lhs, direction)
			local rhs = function()
				-- Make new window and set it as target
				local new_target_window
				vim.api.nvim_win_call(files.get_target_window(), function()
					vim.cmd(direction .. " split")
					new_target_window = vim.api.nvim_get_current_win()
				end)
				files.set_target_window(new_target_window)
			end
			-- Adding `desc` will result into `show_help` entries
			local desc = "Split " .. direction
			vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
		end

		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniFilesBufferCreate",
			callback = function(args)
				local buf_id = args.data.buf_id
				map_split(buf_id, "gx", "belowright horizontal")
				map_split(buf_id, "gv", "belowright vertical")
				vim.keymap.set("n", "g.", toggle_dotfiles, { buffer = buf_id, desc = "Show/hide dotfiles" })
				vim.keymap.set("n", "gd", files_set_cwd, { buffer = args.data.buf_id, desc = "Set cwd" })
			end,
		})
	end,
}
