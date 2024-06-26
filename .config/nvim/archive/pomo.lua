return {
	"epwalsh/pomo.nvim",
	enabled = true,
	version = "*", -- Recommended, use latest release instead of latest commit
	lazy = true,
	cmd = { "TimerStart", "TimerRepeat" },
	dependencies = {
		-- Optional, but highly recommended if you want to use the "Default" timer
		"rcarriga/nvim-notify",
	},
	opts = {
		-- How often the notifiers are updated.
		update_interval = 1000,

		-- Configure the default notifiers to use for each timer.
		notifiers = {
			-- The "Default" notifier uses 'vim.notify' and works best when you have 'nvim-notify' installed.
			{
				name = "Default",
				opts = {
					-- With 'nvim-notify', when 'sticky = true' you'll have a live timer pop-up
					-- continuously displayed. If you only want a pop-up notification when the timer starts
					-- and finishes, set this to false.
					sticky = true,
					-- Configure the display icons:
					title_icon = "󱎫",
					text_icon = "󰄉",
				},
			},
			-- The "System" notifier sends a system notification when the timer is finished.
			-- Available on MacOS natively and Linux via the `libnotify-bin` package.
			-- Tracking: https://github.com/epwalsh/pomo.nvim/issues/3
			{ name = "System" },
			-- You can also define custom notifiers by providing an "init" function instead of a name.
			-- { init = function(timer) ... end }
		},
	},
	config = function(_, opts)
		require("pomo").setup(opts)

		--> setup key bindings
		local nmap_leader = function(suffix, rhs, desc)
			vim.keymap.set("n", "<Leader>" .. suffix, rhs, { desc = desc })
		end
		nmap_leader("pc", function()
			local params = vim.fn.input("Pomo parameters - time-limit name(could be empty): ")
			vim.cmd("TimerStart " .. params)
		end, "[c]reate a timer")
		nmap_leader("po", function()
			local timerId = vim.fn.input("Pomo timer ID(empty for latest): ")
			vim.cmd("TimerStop " .. timerId)
		end, "st[o]p timer")
		nmap_leader("ph", function()
			local timerId = vim.fn.input("Pomo timer ID(empty for latest): ")
			vim.cmd("TimerHide " .. timerId)
		end, "[h]ide timer")
		nmap_leader("ps", function()
			local timerId = vim.fn.input("Pomo timer ID(empty for latest): ")
			vim.cmd("TimerShow " .. timerId)
		end, "[s]how timer")
		nmap_leader("pp", function()
			local timerId = vim.fn.input("Pomo timer ID(empty for latest): ")
			vim.cmd("TimerPause " .. timerId)
		end, "[p]ause timer")
		nmap_leader("pr", function()
			local timerId = vim.fn.input("Pomo timer ID(empty for latest): ")
			vim.cmd("TimerResume " .. timerId)
		end, "[r]esume timer")
	end,
}
