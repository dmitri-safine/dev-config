--[[
Plugin: mini.nvim

Purpose:
A modular collection of small, focused Lua plugins that provide common
editor enhancements (text objects, pairs, commenting, status helpers, etc.).

Why it exists:
Instead of installing many single-purpose plugins, mini.nvim offers
well-designed, lightweight building blocks with consistent APIs and
minimal overhead.

Role in this config:
Provides targeted micro-features without turning the configuration into
a plugin zoo. Each module is enabled intentionally and configured locally.

Characteristics:
- Lightweight and fast
- Highly composable
- No heavy global assumptions
]]

return {
    'nvim-mini/mini.nvim',
    version = '*',
}
