--[[
Plugin: mason.nvim

Purpose:
Manages installation of external developer tools such as LSP servers,
formatters, and linters.

Why it exists:
Removes the need to install language tools manually outside of Neovim.

Role in this config:
Tooling manager for LSP servers and related utilities.
Works in conjunction with nvim-lspconfig.

Characteristics:
- UI for managing tools
- Does not configure LSP behavior
- Purely about installation and updates
]]

---@diagnostic disable: undefined-global
return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        -- import mason
        local mason = require("mason")

        -- import mason-lspconfig
        local mason_lspconfig = require("mason-lspconfig")

        local mason_tool_installer = require("mason-tool-installer")

        -- enable mason and configure icons
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        local servers = {
            "lua_ls",
            "ltex",
            "yamlls",
            "jsonls",
            "marksman",
            "rust_analyzer",
            -- "ts_ls",
            -- "graphql",
            -- "cypher_ls",
        }

        -- Python tools only where python3 is available
        if vim.fn.executable("python3") == 1 or vim.fn.executable("python") == 1 then
            vim.list_extend(servers, { "pyright", "ruff" })
        end

        mason_lspconfig.setup({
            -- list of servers for mason to install
            ensure_installed = servers,
            -- auto-install configured servers (with lspconfig)
            automatic_installation = true, -- not the same as ensure_installed
        })

        mason_tool_installer.setup({
            ensure_installed = {
                "stylua", -- lua formatter
            },
        })
        vim.g.loaded_perl_provider = 0
        vim.g.loaded_python3_provider = 0
        vim.g.loaded_ruby_provider = 0
    end,
}
