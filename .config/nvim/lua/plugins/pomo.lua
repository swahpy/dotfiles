return {
	"epwalsh/pomo.nvim",
	enabled = false,
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

		require("telescope").load_extension("pomodori")

		vim.keymap.set("n", "<leader>fp", function()
			require("telescope").extensions.pomodori.timers()
		end, { desc = "[P]omodori Timers" })

		--> setup key bindings
		local wk = require("which-key")
		wk.register({
			["<leader>p"] = {
				name = "+[p]omodori",
			},
		})
	end,
	keys = {
		{
			"<leader>pc",
			function()
				local params = vim.fn.input("Pomo parameters - time-limit name(could be empty): ")
				vim.cmd("TimerStart " .. params)
			end,
			desc = "[c]reate a timer",
		},
		{
			"<leader>po",
			function()
				local timerId = vim.fn.input("Pomo timer ID(empty for latest): ")
				vim.cmd("TimerStop " .. timerId)
			end,
			desc = "st[o]p timer",
		},
		{
			"<leader>ph",
			function()
				local timerId = vim.fn.input("Pomo timer ID(empty for latest): ")
				vim.cmd("TimerHide " .. timerId)
			end,
			desc = "[h]ide timer",
		},
		{
			"<leader>ps",
			function()
				local timerId = vim.fn.input("Pomo timer ID(empty for latest): ")
				vim.cmd("TimerShow " .. timerId)
			end,
			desc = "[s]how timer",
		},
		{
			"<leader>pp",
			function()
				local timerId = vim.fn.input("Pomo timer ID(empty for latest): ")
				vim.cmd("TimerPause " .. timerId)
			end,
			desc = "[p]ause timer",
		},
		{
			"<leader>pr",
			function()
				local timerId = vim.fn.input("Pomo timer ID(empty for latest): ")
				vim.cmd("TimerResume " .. timerId)
			end,
			desc = "[r]esume timer",
		},
	},
}
