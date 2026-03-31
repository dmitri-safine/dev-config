--[[
Plugin: plenary.nvim

Purpose:
A general-purpose Lua utility library for Neovim plugin development.

Why it exists:
Many advanced plugins rely on async helpers, filesystem utilities,
job control, and functional helpers that Neovim core does not provide.

Role in this config:
Infrastructure dependency required by Telescope and other advanced plugins.
Not user-facing; never interacted with directly.

Characteristics:
- Pure dependency
- No UI
- Loaded implicitly by other plugins
]]

return {
    "nvim-lua/plenary.nvim",
}
