---@diagnostic disable: undefined-global

local M = {}

local function apply(pal)
    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
    vim.opt.background = pal.bg_is_dark and "dark" or "light"
    vim.g.colors_name = "aline-sky"

    local function hi(group, color)
        vim.api.nvim_set_hl(0, group, color)
    end

    hi("Normal", { fg = pal.fg, bg = pal.bg })
    hi("NormalFloat", { fg = pal.fg, bg = pal.highlight })
    hi("Comment", { fg = pal.dim, italic = true })
    hi("Constant", { fg = pal.blue })
    hi("String", { fg = pal.green })
    hi("Identifier", { fg = pal.accent })
    hi("Function", { fg = pal.blue, bold = true })
    hi("Statement", { fg = pal.magenta })
    hi("Keyword", { fg = pal.magenta, bold = true })
    hi("Type", { fg = pal.yellow })
    hi("Special", { fg = pal.cyan })
    hi("Error", { fg = pal.red, bold = true })
    hi("Todo", { fg = pal.yellow, bold = true })
end

function M.load(opts)
    opts = opts or {}

    local theme
    if opts.variant == "light" then
        theme = require("themes.aline-sky-light").palette
        theme.bg_is_dark = false
    elseif opts.variant == "dark" then
        theme = require("themes.aline-sky-dark").palette
        theme.bg_is_dark = true
    else
        -- auto mode: take system background if available
        local bg = vim.o.background
        if bg == "light" then
            theme = require("themes.aline-sky-light").palette
            theme.bg_is_dark = false
        else
            theme = require("themes.aline-sky-dark").palette
            theme.bg_is_dark = true
        end
    end

    apply(theme)
end

return M
