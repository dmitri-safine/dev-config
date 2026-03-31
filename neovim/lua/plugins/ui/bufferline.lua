--[[
Plugin: bufferline.nvim

Purpose:
Displays open buffers as a horizontal tab-like line at the top of the editor.

Why it exists:
Provides a visual overview of open buffers, especially useful when multiple
files are open simultaneously.

Role in this config:
UI context indicator for open buffers.
Not required for navigation, but helpful for orientation.

Characteristics:
- Visual only
- Does not manage files or windows
- Optional but IDE-like
]]

return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("bufferline").setup({
            options = {
                always_show_bufferline = true,
                diagnostics = "nvim_lsp",
            },
        })
    end,
}
