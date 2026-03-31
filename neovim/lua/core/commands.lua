---@diagnostic disable: undefined-global

-- Aline Sky theme switching commands

vim.api.nvim_create_user_command("DarkSky", function()
    require("themes.aline-sky").load({ variant = "dark" })
end, {})

vim.api.nvim_create_user_command("LightSky", function()
    require("themes.aline-sky").load({ variant = "light" })
end, {})
