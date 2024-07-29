-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.window_decorations = "RESIZE"
config.color_scheme = "Catppuccin Macchiato"

config.font = wezterm.font({
	family = "FiraMono Nerd Font",
})
config.font_size = 12.0

config.default_cwd = "S:/Git"

config.wsl_domains = {
	{
		name = "WSL:Debian",
		distribution = "Debian",
	},
}

config.launch_menu = {
	{
		label = "Debian",
		args = { "wsl", "-d debian" },
	},
	{
		label = "Rukucli",
		args = { "wsl", "-d debian" },
	},
	{
		label = "Docker Desktop",
		args = { "C:/Program Files/Docker/Docker/Docker Desktop.exe" },
	},
}

config.leader = { key = "m", mods = "ALT", timeout_milliseconds = 1000 }
config.keys = {
	{
		key = "l",
		mods = "LEADER",
		action = wezterm.action.ShowLauncher,
	},
	{
		key = "t",
		mods = "LEADER",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "w",
		mods = "LEADER",
		action = wezterm.action.CloseCurrentTab({ confirm = false }),
	},
	{
		key = "p",
		mods = "LEADER",
		action = wezterm.action.PaneSelect,
	},
	{
		key = "P",
		mods = "LEADER",
		action = wezterm.action.PaneSelect({ mode = "SwapWithActive" }),
	},
	{
		key = "r",
		mods = "LEADER",
		action = wezterm.action.ActivateKeyTable({
			name = "resize_pane",
			one_shot = false,
		}),
	},
	{
		key = "h",
		mods = "LEADER",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "v",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
}

config.key_tables = {
	-- Defines the keys that are active in our resize-pane mode.
	resize_pane = {
		{ key = "h", action = wezterm.action.AdjustPaneSize({ "Left", 1 }) },

		{ key = "l", action = wezterm.action.AdjustPaneSize({ "Right", 1 }) },

		{ key = "k", action = wezterm.action.AdjustPaneSize({ "Up", 1 }) },

		{ key = "j", action = wezterm.action.AdjustPaneSize({ "Down", 1 }) },

		-- Cancel the mode by pressing escape
		{ key = "Escape", action = "PopKeyTable" },
	},
}

return config
