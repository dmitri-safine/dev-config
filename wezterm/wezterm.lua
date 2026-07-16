local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()

-- ============================================
--  Portable paths (no hardcoded usernames)
-- ============================================
local home = wezterm.home_dir
local git_bash = home .. "\\scoop\\apps\\git\\current\\bin\\bash.exe"

-- ============================================
--  Aline Sky Color Palette (matches Starship)
-- ============================================
config.colors = {
    foreground = "#E5D9F2",
    background = "#1E1F29",

    cursor_fg = "#1E1F29",
    cursor_bg = "#A8E6CF",

    selection_bg = "#3F3F4A",
    selection_fg = "#FFFFFF",

    ansi = {
        "#1E1F29", -- black
        "#FFD6E0", -- red (rose haze)
        "#A8E6CF", -- green (mint glow)
        "#F2E9E4", -- yellow (warm cream)
        "#6A8CDF", -- blue (twilight blue)
        "#DDBDD5", -- magenta (lavender blush)
        "#C3C7F7", -- cyan (soft sky)
        "#E5D9F2", -- white (lavender mist)
    },

    brights = {
        "#2A2B36",
        "#FFB6C1",
        "#B9F3DA",
        "#FFF0E2",
        "#88A8FF",
        "#ECC8E8",
        "#D8DBFF",
        "#FFFFFF",
    },

    tab_bar = {
        background = "#1E1F29",
        active_tab = {
            bg_color = "#2A2B36",
            fg_color = "#A8E6CF",
            intensity = "Bold",
        },
        inactive_tab = {
            bg_color = "#1E1F29",
            fg_color = "#3F3F4A",
        },
        inactive_tab_hover = {
            bg_color = "#2A2B36",
            fg_color = "#C3C7F7",
        },
        new_tab = {
            bg_color = "#1E1F29",
            fg_color = "#3F3F4A",
        },
        new_tab_hover = {
            bg_color = "#2A2B36",
            fg_color = "#A8E6CF",
        },
    },
}

-- ============================================
--  Font Settings
-- ============================================
config.font = wezterm.font("Cousine Nerd Font Mono")
config.font_size = 12.0
config.line_height = 1.0

-- ============================================
--  Window & Tab Bar
-- ============================================
config.window_decorations = "TITLE | RESIZE"
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = false
config.tab_max_width = 32
config.window_padding = {
    left = 8,
    right = 8,
    top = 4,
    bottom = 4,
}

-- ============================================
--  Default Shell: Git Bash
-- ============================================
config.default_prog = { git_bash, "-l" }

-- ============================================
--  Launch Menu — all environments
-- ============================================
config.launch_menu = {
    {
        label = "🪟 Git Bash",
        args = { git_bash, "-l" },
    },
    {
        label = "🐧 WSL (Ubuntu)",
        args = { "wsl.exe", "--distribution", "Ubuntu-24.04", "--cd", "~" },
    },
    {
        label = "⚡ PowerShell",
        args = { "pwsh.exe", "-NoLogo" },
    },
    {
        label = "📟 CMD",
        args = { "cmd.exe" },
    },
}

-- ============================================
--  Tab Title: show shell type + cwd
-- ============================================
wezterm.on("format-tab-title", function(tab, tabs, panes, conf, hover, max_width)
    local pane = tab.active_pane
    local title = pane.title or ""
    local cwd = pane.current_working_dir

    -- detect environment from process name
    local process = pane.foreground_process_name or ""
    local icon = ""

    if process:find("bash") then
        -- check if it's WSL bash or Git Bash
        if title:find("WSL") or (cwd and tostring(cwd):find("//wsl")) then
            icon = "🐧"
        else
            icon = "🪟"
        end
    elseif process:find("pwsh") or process:find("powershell") then
        icon = "⚡"
    elseif process:find("cmd") then
        icon = "📟"
    elseif process:find("wsl") then
        icon = "🐧"
    elseif process:find("nvim") or process:find("vim") then
        icon = "📝"
    elseif process:find("python") then
        icon = "🐍"
    elseif process:find("node") then
        icon = "🟢"
    end

    -- shorten cwd for tab title
    local short_cwd = ""
    if cwd then
        local cwd_str = tostring(cwd)
        -- extract last path component
        short_cwd = cwd_str:match("([^/\\]+)[/\\]?$") or cwd_str
    end

    local tab_title = icon .. " " .. short_cwd
    if #tab_title > max_width - 2 then
        tab_title = tab_title:sub(1, max_width - 4) .. "…"
    end

    return {
        { Text = " " .. tab_title .. " " },
    }
end)

-- ============================================
--  Right status: current keyboard layout
--  Reads %LOCALAPPDATA%\kb-layout (written by autohotkey/lang-switch.ahk)
-- ============================================
wezterm.on("update-status", function(window, pane)
    local layout = ""
    local f = io.open(wezterm.home_dir .. "\\AppData\\Local\\kb-layout", "r")
    if f then
        layout = (f:read("*a") or ""):gsub("%s+", "")
        f:close()
    end
    if layout ~= "" then
        window:set_right_status(wezterm.format({
            { Foreground = { Color = "#A8E6CF" } },
            { Text = " " .. layout .. " " },
        }))
    else
        window:set_right_status("")
    end
end)

-- ============================================
--  Keybindings
-- ============================================
config.keys = {
    -- Launch menu (pick environment)
    {
        key = "l",
        mods = "ALT",
        action = act.ShowLauncher,
    },

    -- Quick spawn: WSL
    {
        key = "w",
        mods = "ALT|SHIFT",
        action = act.SpawnCommandInNewTab({
            args = { "wsl.exe", "--distribution", "Ubuntu-24.04", "--cd", "~" },
        }),
    },

    -- Quick spawn: Git Bash
    {
        key = "b",
        mods = "ALT|SHIFT",
        action = act.SpawnCommandInNewTab({
            args = { git_bash, "-l" },
        }),
    },

    -- Quick spawn: PowerShell
    {
        key = "p",
        mods = "ALT|SHIFT",
        action = act.SpawnCommandInNewTab({
            args = { "pwsh.exe", "-NoLogo" },
        }),
    },

    -- Pane selector
    { key = "s", mods = "ALT", action = act.PaneSelect },

    -- New tab (same shell)
    { key = "t", mods = "ALT", action = act.SpawnTab("CurrentPaneDomain") },

    -- New window
    { key = "n", mods = "ALT", action = act.SpawnWindow },

    -- Switch tabs
    { key = "[", mods = "ALT", action = act.ActivateTabRelative(-1) },
    { key = "]", mods = "ALT", action = act.ActivateTabRelative(1) },

    -- Split horizontal (down)
    {
        key = "h",
        mods = "ALT",
        action = act.SplitPane({
            direction = "Down",
            size = { Percent = 30 },
        }),
    },

    -- Split vertical (right)
    {
        key = "v",
        mods = "ALT",
        action = act.SplitPane({
            direction = "Right",
            size = { Percent = 50 },
        }),
    },

    -- Close pane
    { key = "x", mods = "ALT", action = act.CloseCurrentPane({ confirm = false }) },

    -- Move between panes
    { key = "LeftArrow", mods = "ALT", action = act.ActivatePaneDirection("Left") },
    { key = "RightArrow", mods = "ALT", action = act.ActivatePaneDirection("Right") },
    { key = "UpArrow", mods = "ALT", action = act.ActivatePaneDirection("Up") },
    { key = "DownArrow", mods = "ALT", action = act.ActivatePaneDirection("Down") },
}

-- ============================================
--  Final Return
-- ============================================
return config
