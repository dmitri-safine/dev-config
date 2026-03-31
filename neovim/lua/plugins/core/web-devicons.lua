--[[
Plugin: nvim-web-devicons

Purpose:
Provides file-type and folder icons for Neovim UI components.

Why it exists:
Improves visual recognition and navigation by adding icons to file trees,
buffer lines, status lines, and pickers.

Role in this config:
Shared UI dependency for nvim-tree, bufferline, lualine, and Telescope.

Characteristics:
- Purely visual
- No logic or behavior
- Optional but highly beneficial for UX
]]

return {
    "nvim-tree/nvim-web-devicons",
}
