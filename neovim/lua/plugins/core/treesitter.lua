--[[
Plugin: nvim-treesitter

Purpose:
Provides incremental parsing of source code using Tree-sitter grammars
to enable accurate syntax highlighting, indentation, and structural awareness.

Why it exists:
Replaces regex-based highlighting with real syntax trees, enabling
language-aware editor features.

Role in this config:
Core semantic layer for syntax highlighting and structure.
Required by many modern Neovim features and plugins.

Characteristics:
- Language-aware
- Parser-based (not regex)
- Needs grammar updates via :TSUpdate
]]

return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    priority = 1000,
    build = ":TSUpdate",

    opts = {
        ensure_installed = {
            "lua",
            "vim",
            "vimdoc",
            "bash",
            "json",
            "yaml",
            "toml",
            "markdown",
            "markdown_inline",
            "python",
            "rust",
            "javascript",
            "typescript",
            "tsx",
            "html",
            "css",
        },

        highlight = { enable = true },
        indent = { enable = true },

        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<CR>",
                node_incremental = "<CR>",
                node_decremental = "<BS>",
            },
        },
    },
}
