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
	key = "s",
	mods = "ALT",
	action = act.PaneSelect,
})

-- spawn a new window
table.insert(keys, {
	key = "n",
	mods = "ALT",
	action = act.SpawnWindow,
})

-- spawn a new tab
table.insert(keys, {
	key = "t",
	mods = "ALT",
	action = act.SpawnTab("CurrentPaneDomain"),
})

-- switch to the tab on the left
table.insert(keys, {
	key = "[",
	mods = "ALT",
	action = act.ActivateTabRelative(-1),
})

-- switch to the tab on the right
table.insert(keys, {
	key = "]",
	mods = "ALT",
	action = act.ActivateTabRelative(1),
})

-- split horizontally at 30% height
-- good for terminal commands
-- when top pane using nvim
table.insert(keys, {
	key = "h",
	mods = "ALT",
	action = act.SplitPane({
		direction = "Down",
		size = { Percent = 30 },
	}),
})

-- close current pane
table.insert(keys, {
	key = "x",
	mods = "ALT",
	action = act.CloseCurrentPane({ confirm = false }),
})

config.keys = keys

-- and finally, return the configuration to wezterm
return config
