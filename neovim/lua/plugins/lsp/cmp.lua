--[[
Plugin: nvim-cmp

Purpose:
Completion engine that provides code completion from multiple sources
(LSP, snippets, buffer text, filesystem paths).

Why it exists:
Centralizes completion logic and allows fine-grained control over
completion behavior, priorities, and key mappings.

Role in this config:
Primary completion system, integrated with LSP and LuaSnip.
Designed for explicit, predictable completion (no auto-accept magic).

Interactions:
- nvim-lspconfig (LSP completion)
- LuaSnip (snippet expansion)
- Buffer / path sources

Characteristics:
- Source-based
- Highly configurable
- Insert-mode centric
]]

return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        cmp.setup({
            completion = {
                completeopt = "menu,menuone,noinsert",
            },

            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },

            mapping = cmp.mapping.preset.insert({
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),

            sources = cmp.config.sources({
                { name = "nvim_lsp", priority = 100 },
                { name = "luasnip",  priority = 80 },
                { name = "buffer",   priority = 50 },
                { name = "path",     priority = 40 },
            }),

            experimental = {
                ghost_text = true,
            }
        })
    end,
}
