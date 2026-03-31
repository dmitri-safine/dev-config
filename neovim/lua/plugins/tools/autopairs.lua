--[[
Plugin: nvim-autopairs

Purpose:
Automatically inserts matching pairs such as parentheses, brackets,
and quotes during typing.

Why it exists:
Reduces typing friction and prevents common syntax errors when writing code
by handling repetitive structural characters.

Role in this config:
Low-level editing ergonomics tool.
Assists manual coding without adding UI or interfering with navigation.

Characteristics:
- Triggered only in insert mode
- Treesitter-aware for context correctness
- Minimal, non-intrusive behavior
]]

---@diagnostic disable: undefined-field

return {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    dependencies = {
        "hrsh7th/nvim-cmp",
    },
    config = function()
        -- import nvim-autopairs
        local autopairs = require("nvim-autopairs")

        -- configure autopairs
        autopairs.setup({
            check_ts = true,                        -- enable treesitter
            ts_config = {
                lua = { "string" },                 -- don't add pairs in lua string treesitter nodes
                javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
                java = false,                       -- don't check treesitter on java
            },
        })

        -- import nvim-autopairs completion functionality
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")

        -- import nvim-cmp plugin (completions plugin)
        local cmp = require("cmp")

        -- make autopairs and completion work together
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
}
