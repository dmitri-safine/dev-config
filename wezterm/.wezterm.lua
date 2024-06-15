-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "AdventureTime"

-- configure launch menu
local launch_menu = {}

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	table.insert(launch_menu, {
		label = "PowerShell",
		args = { "pwsh.exe", "-nol" },
	})
	table.insert(launch_menu, {
		label = "MSYS UCRT64",
		args = { "cmd.exe ", "/k", "C:\\msys64\\msys2_shell.cmd -defterm -here -no-start -ucrt64 -shell bash" },
	})
	config.default_prog = { "pwsh", "-nol" }
end

config.launch_menu = launch_menu

-- configure key shortcuts
local keys = {}

-- pane switching
-- activate pane selection mode with
-- the default alphabet
-- (labels are "a", "s", "d", "f" and so on)
table.insert(keys, {
	key = "8",
	mods = "CTRL",
	action = act.PaneSelect,
})

config.keys = keys

-- and finally, return the configuration to wezterm
return config
