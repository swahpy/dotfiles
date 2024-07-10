local wezterm = require("wezterm")
local config = {}

config.color_scheme = "Everforest Light (Gogh)"

config.font = wezterm.font("0xProto Nerd Font Mono")
config.font_size = 18

config.enable_tab_bar = false

local act = wezterm.action
config.keys = {
	{ key = "t", mods = "SHIFT|CTRL", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "x", mods = "SHIFT|CTRL", action = wezterm.action.CloseCurrentTab({ confirm = true }) },
	{ key = "F9", mods = "ALT", action = wezterm.action.ShowTabNavigator },
}

return config
