--[[
Plugin: which-key.nvim

Purpose:
Displays contextual keybinding hints when entering partial key
sequences, improving discoverability without interrupting workflow.

Why it exists:
Helps manage complex keybinding layouts by revealing available
commands on demand, reducing cognitive load.

Role in this config:
Optional discoverability layer for leader-based keybindings.
Acts as a passive reference rather than an active guide.

Characteristics:
- Appears only when needed
- No impact on editing performance
- Complements mnemonic keybinding design
]]

---@diagnostic disable: undefined-global

return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
    end,
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
}
