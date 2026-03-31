--[[
Plugin: Comment.nvim

Purpose:
Provides fast and consistent commenting and uncommenting of code
using language-aware comment syntax.

Why it exists:
Eliminates the need to manually manage comment characters for different
languages and removes friction when toggling comments during editing.

Role in this config:
Primary commenting utility for both code and prose.
Used for quickly commenting single lines or blocks in normal and visual modes.

Characteristics:
- Language-aware
- Non-visual
- Editing-focused
- Lightweight and reliable
]]

return {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
        -- import comment plugin safely
        local comment = require("Comment")

        local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

        -- enable comment
        comment.setup({
            -- for commenting tsx and jsx files
            pre_hook = ts_context_commentstring.create_pre_hook(),
        })
    end,
}
