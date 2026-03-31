--[[
Plugin: nvim-colorizer.lua

Purpose:
Displays color values (hex, rgb, hsl, etc.) directly in the buffer using
their actual colors.

Why it exists:
Removes the mental overhead of interpreting color codes by making them
visually self-descriptive.

Role in this config:
Non-intrusive visual enhancement for files that contain color definitions
(e.g. UI configs, themes, CSS, Markdown).

Characteristics:
- Inline visualization only
- No UI windows or commands
- Does not affect editing behavior
]]

return {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local colorizer = require("colorizer")
        colorizer.setup({
            filetypes = { "css", "html", "markdown", "lua" },
        })
    end,
}
