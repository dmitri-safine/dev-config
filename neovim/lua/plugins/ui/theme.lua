---@diagnostic disable: undefined-global

-- plugins/theme.lua
-- Local plugin spec for Aline Sky theme

return {
    dir = vim.fn.stdpath("config") .. "/lua/themes",
    name = "aline-sky",
    lazy = false,
    priority = 1000,
    config = function()
        require("themes.aline-sky").load({
            variant = "dark",
        })
    end,
}
