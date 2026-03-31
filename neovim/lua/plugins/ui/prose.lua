--[[
Plugin: nvim-prose

Purpose:
Provides a prose-focused editing mode with improved text flow,
wrapping, and visual comfort for writing.

Why it exists:
Optimizes Neovim for long-form writing rather than code.

Role in this config:
UI mode switch for writing contexts (Markdown, prose, notes).
Integrates with lualine to reflect writing state.

Characteristics:
- Mode-based
- Affects buffer presentation
- Part of the UI layer, not tooling
]]

return {
    "skwee357/nvim-prose",
    config = function()
        require("nvim-prose").setup({
            wpm = 200.0,
            filetypes = { "markdown", "asciidoc" },
            placeholders = {
                words = "words",
                minutes = "min",
            },
        })
    end,
}
