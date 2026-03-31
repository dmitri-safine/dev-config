--[[
Plugin: nvim-surround

Purpose:
Provides commands to add, change, and delete surrounding characters
such as parentheses, quotes, brackets, and HTML tags.

Why it exists:
Enables fast structural editing and refactoring without retyping or
manual text manipulation.

Role in this config:
Structural editing utility used in normal and visual modes.
Complements autopairs by operating on existing text rather than during input.

Characteristics:
- Operates after text is written
- No UI or background processing
- Predictable, mnemonic keybindings
]]

return {
    "kylechui/nvim-surround",
    event = { "BufReadPre", "BufNewFile" },
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = true,
}
