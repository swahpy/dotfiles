return {
	"nvimdev/dashboard-nvim",
	enabled = false,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
	event = "VimEnter",
	opts = {
		--  config used for theme
		config = {
			week_header = {
				enable = true, --boolean use a week header
				-- concat = "Hongyun", --concat string after time string line
				append = {
					"⠀⢀⣴⣦⠀⠀⠀⠀⢰⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
					"⣰⣿⣿⣿⣷⡀⠀⠀⢸⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
					"⣿⣿⣿⣿⣿⣿⣄⠀⢸⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⠿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
					"⣿⣿⣿⠈⢿⣿⣿⣦⢸⣿⣿⡇⠀⣠⠴⠒⠢⣄⠀⠀⣠⠴⠲⠦⣄⠐⣶⣆⠀⠀⢀⣶⡖⢰⣶⠀⢰⣶⣴⡶⣶⣆⣴⡶⣶⣶⡄",
					"⣿⣿⣿⠀⠀⠻⣿⣿⣿⣿⣿⡇⢸⣁⣀⣀⣀⣘⡆⣼⠁⠀⠀⠀⠘⡇⠹⣿⡄⠀⣼⡿⠀⢸⣿⠀⢸⣿⠁⠀⢸⣿⡏⠀⠀⣿⣿",
					"⠹⣿⣿⠀⠀⠀⠙⣿⣿⣿⡿⠃⢸⡀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⢀⡏⠀⢻⣿⣸⣿⠁⠀⢸⣿⠀⢸⣿⠀⠀⢸⣿⡇⠀⠀⣿⣿",
					"⠀⠈⠻⠀⠀⠀⠀⠈⠿⠋⠀⠀⠈⠳⢤⣀⣠⠴⠀⠈⠧⣄⣀⡠⠞⠁⠀⠀⠿⠿⠃⠀⠀⢸⣿⠀⢸⣿⠀⠀⠸⣿⡇⠀⠀⣿⡿",
				},
			},
			-- disable_move  = true, -- boolean default is false disable move key
			shortcut = {
				{ desc = "💤 Lazy", group = "lazy", action = "Lazy", key = "L" },
				{ desc = " File Explorer", group = "oil", action = "Oil", key = "e" },
				-- { desc = "󰮗 Find Files", group = "telescope", action = "Telescope find_files", key = "f" },
				-- { desc = " Recent Files", group = "telescope", action = "Telescope oldfiles", key = "r" },
				{ desc = " New File", group = "vim", action = "ene | startinsert", key = "n" },
				{
					desc = "󰦛 Restore Session",
					group = "session",
					action = function()
						require("mini.sessions").select()
					end,
					key = "s",
				},
				{ desc = "󰿅 Quit Neovim", group = "vim", action = "qa", key = "q" },
			},
			footer = function()
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				return {
					"",
					"",
					"If you don't keep moving, you'll quickly fall behind.",
					"",
					"⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
				}
			end,
		},
		hide = {
			statusline = false, -- hide statusline default is true
			tabline = true, -- hide the tabline
			winbar = true, -- hide winbar
		},
	},
	config = function(_, opts)
		local db = require("dashboard")
		db.setup(opts)
		local nmap_leader = function(suffix, rhs, desc)
			vim.keymap.set("n", "<Leader>" .. suffix, rhs, { desc = desc })
		end
		nmap_leader("d", "<cmd>Dashboard<cr>", "+Dashboard")
	end,
}
