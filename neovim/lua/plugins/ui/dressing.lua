--[[
Plugin: dressing.nvim

Purpose:
Improves Neovim's built-in vim.ui.input and vim.ui.select interfaces
by rendering them as floating windows.

Why it exists:
Replaces command-line prompts with modern, centered floating dialogs.

Role in this config:
Provides floating input UI for:
- nvim-tree file creation
- selections and confirmations

Characteristics:
- UI enhancement only
- Transparent to calling plugins
- Improves overall UX consistency
]]

return {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
}
