return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",
		-- Optional.
		-- For completion
		"hrsh7th/nvim-cmp",
		-- For pickers
		"nvim-telescope/telescope.nvim",
		-- For syntax highlighting
		"nvim-treesitter/nvim-treesitter",
		-- For running lightweight timer
		"epwalsh/pomo.nvim",
	},
	init = function()
		vim.opt.conceallevel = 2
	end,
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "~/Documents/obsidian/wanghy/",
			},
			{
				name = "no-vault",
				path = function()
					-- alternatively use the CWD:
					-- return assert(vim.fn.getcwd())
					return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
				end,
				overrides = {
					notes_subdir = vim.NIL, -- have to use 'vim.NIL' instead of 'nil'
					new_notes_location = "current_dir",
					templates = {
						folder = vim.NIL,
					},
					daily_notes = {
						folder = vim.NIL,
					},
					disable_frontmatter = true,
				},
			},
		},

		-- Optional, if you keep notes in a specific subdirectory of your vault.
		notes_subdir = "notes",

		log_level = vim.log.levels.INFO,

		daily_notes = {
			-- Optional, if you keep daily notes in a separate directory.
			folder = "dailies",
			-- Optional, if you want to change the date format for the ID of daily notes.
			date_format = "%Y-%m-%d",
			-- Optional, if you want to change the date format of the default alias of daily notes.
			alias_format = "%Y%B%d",
			-- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
			template = "daily.md",
		},

		-- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
		completion = {
			-- Set to false to disable completion.
			nvim_cmp = true,
			-- Trigger completion at 2 chars.
			min_chars = 3,
		},

		-- Optional, configure key mappings. These are the defaults. If you don't want to set any keymappings this
		-- way then set 'mappings = {}'.
		mappings = {
			-- Smart action depending on context, either follow link or toggle checkbox.
			["<cr>"] = {
				action = function()
					-- follow link if possible
					if require("obsidian").util.cursor_on_markdown_link(nil, nil, true) then
						vim.cmd("ObsidianFollowLink")
						return
					end
					-- toggle task if possible, and update todo to done
					-- cycles through your custom UI checkboxes, default: [ ] [x]
					local api = vim.api
					local line = api.nvim_get_current_line()
					local row, _ = unpack(api.nvim_win_get_cursor(api.nvim_get_current_win()))
					if line:find("#todo") then
						line = line:gsub("#todo", "#done")
						api.nvim_buf_set_lines(0, row - 1, row, true, { line })
					elseif line:find("#done") then
						line = line:gsub("#done", "#todo")
						api.nvim_buf_set_lines(0, row - 1, row, true, { line })
					end
					require("obsidian").util.toggle_checkbox()
				end,
				opts = { buffer = true },
			},
		},

		-- Where to put new notes. Valid options are
		--  * "current_dir" - put new notes in same directory as the current buffer.
		--  * "notes_subdir" - put new notes in the default notes subdirectory.
		new_notes_location = "current_dir",

		-- Optional, customize how note IDs are generated given an optional title.
		---@param title string|?
		---@return string
		note_id_func = function(title)
			if title ~= nil then
				-- If title is given, transform it into valid file name.
				return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
			else
				return string.char(math.random(65, 90))
			end
		end,

		-- Optional, customize how wiki links are formatted. You can set this to one of:
		--  * "use_alias_only", e.g. '[[Foo Bar]]'
		--  * "prepend_note_id", e.g. '[[foo-bar|Foo Bar]]'
		--  * "prepend_note_path", e.g. '[[foo-bar.md|Foo Bar]]'
		--  * "use_path_only", e.g. '[[foo-bar.md]]'
		-- Or you can set it to a function that takes a table of options and returns a string, like this:
		wiki_link_func = "prepend_note_path",

		-- Optional, alternatively you can customize the frontmatter data.
		---@return table
		note_frontmatter_func = function(note)
			-- Add the title of the note as an alias.
			if note.title then
				note:add_alias(note.title)
			end
			local out = { id = note.id, aliases = note.aliases, tags = note.tags }

			-- `note.metadata` contains any manually added fields in the frontmatter.
			-- So here we just make sure those fields are kept in the frontmatter.
			if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
				for k, v in pairs(note.metadata) do
					out[k] = v
				end
			end

			-- insert note update date and time
			out.updated_at = os.date("%Y-%m-%d %H:%M")

			return out
		end,

		-- Optional, for templates (see below).
		templates = {
			folder = "templates",
			date_format = "%Y-%m-%d",
			time_format = "%H:%M",
			-- A map for custom variables, the key should be the variable and the value a function
			substitutions = {},
		},

		picker = {
			-- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
			name = "telescope.nvim",
			-- Optional, configure key mappings for the picker. These are the defaults.
			-- Not all pickers support all mappings.
			mappings = {
				-- Create a new note from your query.
				new = "<C-n>",
				-- Insert a link to the selected note.
				insert_link = "<C-l>",
			},
		},

		-- Optional, configure additional syntax highlighting / extmarks.
		-- This requires you have `conceallevel` set to 1 or 2. See `:help conceallevel` for more details.
		ui = {
			-- Define how various check-boxes are displayed
			checkboxes = {
				[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
				["x"] = { char = "", hl_group = "ObsidianDone" },
			},
		},
	},
	config = function(_, opts)
		local obs = require("obsidian")
		obs.setup(opts)
		-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
		vim.keymap.set("n", "gf", function()
			if require("obsidian").util.cursor_on_markdown_link() then
				return "<cmd>ObsidianFollowLink<CR>"
			else
				return "gf"
			end
		end, { noremap = false, expr = true, desc = "Obsidian gf_passthrough or normal go to file under cursor" })
		-- setup keymaps
		local wk = require("which-key")
		wk.register({
			["<leader>o"] = {
				name = "+obsidian",
				O = {
					function()
						local query = vim.fn.input("Please enter a query(nil for current buffer): ")
						vim.cmd("ObsidianOpen " .. query)
					end,
					"[o]pen current note in Obsidian App",
				},
				n = {
					function()
						local title = vim.fn.input("Enter title or path: ")
						if title ~= "" then
							vim.cmd("ObsidianNew " .. title)
						else
							print("Cancelled.")
						end
					end,
					"[n]ew: Create a new note",
				},
				a = {
					function()
						local tag = vim.fn.input("Tag: ")
						vim.cmd("ObsidianTags " .. tag)
					end,
					"T[a]g: Find notes of the specified tag",
				},
				o = {
					function()
						local offset = vim.fn.input("Please enter offset(0 or nil for today): ")
						vim.cmd("ObsidianToday " .. offset)
					end,
					"T[o]day: Open or create daily note for today",
				},
				S = {
					"<cmd>ObsidianQuickSwitch<cr>",
					"[S]witch to another note in the vault",
				},
				f = {
					function()
						local split = vim.fn.input("Enter split(h/v): ")
						if split == "v" then
							vim.cmd("ObsidianFollowLink " .. "vsplit")
						elseif split == "h" then
							vim.cmd("ObsidianFollowLink " .. "hsplit")
						else
							vim.cmd("ObsidianFollowLink")
						end
					end,
					"[f]ollowlink: Open note reference under the cursor in a horizontal or vertical split window",
				},
				b = {
					"<cmd>ObsidianBacklinks<cr>",
					"[b]acklinks: Getting a picker list of references to the current buffer",
				},
				y = {
					"<cmd>ObsidianYesterday<cr>",
					"[Y]esterday: Open or create a daily note for yesterday",
				},
				t = {
					"<cmd>ObsidianTomorrow<cr>",
					"[T]omorrow: Open or create a daily note for tomorrow",
				},
				d = {
					function()
						local input = vim.fn.input("Please enter daily range(nil for no all dailies): ")
						if input == "" then
							vim.cmd("ObsidianDailies")
						else
							local match = input:match("%d+%s%d+")
							if match then
								local range = vim.split(input, " ")
								local start = range[1]
								local stop = range[2]
								vim.cmd("ObsidianDailies " .. start .. " " .. stop)
							else
								print("Please enter in following format: [number number].")
							end
						end
					end,
					"[d]aily: Get the list of daily notes",
				},
				m = {
					function()
						local temp = vim.fn.input("Please enter template name: ")
						vim.cmd("ObsidianTemplate " .. temp)
					end,
					"Te[m]plate: Insert a template from the template list",
				},
				s = {
					function()
						local search = vim.fn.input("Please enter you search: ")
						vim.cmd("ObsidianSearch " .. search)
					end,
					"[s]earch: Find or create a note in the vault",
				},
				l = {
					"<cmd>ObsidianLinks<cr>",
					"[L]inks: Collect all links within the current buffer into a picker window",
				},
				e = {
					function()
						local title = vim.fn.input("please enter the note title: ")
						vim.cmd("ObsidianExtractNote " .. title)
					end,
					mode = "v",
					"[e]xtract the visually selected text into a new note and link to it",
				},
				c = {
					"<cmd>ObsidianToggleCheckbox<cr>",
					"[c]heckbox: Cycle through checkbox options",
				},
				i = {
					function()
						local img = vim.fn.input("Please enter the image name: ")
						vim.cmd("ObsidianPasteImg " .. img)
					end,
					"[i]mage: Paste an image from the clipboard into the note at the cursor position",
				},
			},
		})
		wk.register({
			["<leader>o"] = {
				name = "+obsididan",
				e = {
					function()
						local query = vim.fn.input("Please enter a query(nil for selected text): ")
						vim.cmd("ObsidianLink " .. query)
					end,
					"[e]xisted: Link an existed inline visual selection of text to a note",
				},
				n = {
					function()
						local title = vim.fn.input("Please enter note title(nil for selected text): ")
						vim.cmd("ObsidianLinkNew " .. title)
					end,
					"[n]ew: Create a new note and link it to an inline visual selection of text",
				},
			},
		}, { mode = "v" })
	end,
}
