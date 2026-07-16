--[[
Plugin: lualine.nvim

Purpose:
Customizable status line that displays editor state, file information,
LSP diagnostics, and plugin status.

Why it exists:
Replaces the default statusline with a performant and modular alternative.

Role in this config:
Primary status indicator:
- mode
- file
- diagnostics
- plugin update status (lazy.nvim)

Characteristics:
- Global statusline enabled
- UI-only
- Highly extensible
]]

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local lualine = require("lualine")
        local lazy_status = require("lazy.status") -- to configure lazy pending updates count
        local prose = require("nvim-prose")

        -- Keyboard layout indicator: reads the file written by autohotkey/lang-switch.ahk.
        -- Path resolved once: native Windows uses %LOCALAPPDATA%; WSL maps it via wslpath.
        local kb_layout_file = (function()
            if vim.fn.has("win32") == 1 then
                local lad = os.getenv("LOCALAPPDATA")
                return lad and (lad .. "\\kb-layout") or nil
            elseif vim.fn.has("wsl") == 1 then
                local win = (vim.fn.system({ "cmd.exe", "/c", "echo %LOCALAPPDATA%" }) or ""):gsub("[\r\n]+$", "")
                if win == "" then return nil end
                local p = (vim.fn.system({ "wslpath", win }) or ""):gsub("[\r\n]+$", "")
                return p ~= "" and (p .. "/kb-layout") or nil
            end
            return nil
        end)()

        local function kb_layout()
            if not kb_layout_file then return "" end
            local f = io.open(kb_layout_file, "r")
            if not f then return "" end
            local s = f:read("*a") -- "*a" for LuaJIT (Lua 5.1) compatibility
            f:close()
            if not s then return "" end
            s = s:gsub("%s+", "")
            if s == "" then return "" end
            return " " .. s
        end

        local colors = {
            blue = "#65D1FF",
            green = "#3EFFDC",
            violet = "#FF61EF",
            yellow = "#FFDA7B",
            red = "#FF4A4A",
            fg = "#c3ccdc",
            bg = "#112638",
            inactive_bg = "#2c3043",
        }

        local my_lualine_theme = {
            normal = {
                a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
                b = { bg = colors.bg, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
            },
            insert = {
                a = { bg = colors.green, fg = colors.bg, gui = "bold" },
                b = { bg = colors.bg, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
            },
            visual = {
                a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
                b = { bg = colors.bg, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
            },
            command = {
                a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
                b = { bg = colors.bg, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
            },
            replace = {
                a = { bg = colors.red, fg = colors.bg, gui = "bold" },
                b = { bg = colors.bg, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
            },
            inactive = {
                a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
                b = { bg = colors.inactive_bg, fg = colors.semilightgray },
                c = { bg = colors.inactive_bg, fg = colors.semilightgray },
            },
        }

        -- configure lualine with modified theme
        lualine.setup({
            options = {
                theme = my_lualine_theme,
                refresh = { statusline = 500 },
            },
            sections = {
                lualine_x = {
                    { kb_layout },
                    { prose.word_count,   cond = prose.is_available },
                    { prose.reading_time, cond = prose.is_available },
                    {
                        lazy_status.updates,
                        cond = lazy_status.has_updates,
                        color = { fg = "#ff9e64" },
                    },
                    { "encoding" },
                    { "fileformat" },
                    { "filetype" },
                },
            },
        })
    end,
}
