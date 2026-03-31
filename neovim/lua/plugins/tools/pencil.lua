--[[
Plugin: vim-pencil

Purpose:
Optimizes Neovim for long-form writing by enabling soft wrapping,
natural line breaks, and readable text flow.

Why it exists:
Transforms Vim from a code-oriented editor into a comfortable
writing environment for prose, notes, and documentation.

Role in this config:
Writing ergonomics layer for Markdown and text files.
Complements prose-focused workflows without affecting code editing.

Characteristics:
- Activated per filetype
- Soft wrapping and readable layout
- No impact on code buffers
]]

---@diagnostic disable: undefined-global

return {
    "preservim/vim-pencil",
    init = function()
        vim.g["pencil#wrapModeDefault"] = "soft"
    end,
}
