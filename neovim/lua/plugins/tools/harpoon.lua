--[[
Plugin: harpoon

Purpose:
Provides instant navigation between a small, manually curated set of
important files within a project.

Why it exists:
Optimizes focused workflows where the same files are revisited repeatedly,
reducing navigation overhead and preserving mental context.

Role in this config:
Task-centric navigation layer.
Used as a working memory when jumping between related models, schemas,
and configuration files (e.g. BioLink ↔ OmniLink transformations).

Characteristics:
- Manual file marking
- Instant jumps via keybindings
- Independent of buffers and window layout
- Complements tree- and search-based navigation
]]

---@diagnostic disable: undefined-global
return {
    "ThePrimeagen/harpoon",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        -- set keymaps
        local keymap = vim.keymap -- for conciseness

        keymap.set(
            "n",
            "<leader>hm",
            "<cmd>lua require('harpoon.mark').add_file()<cr>",
            { desc = "Mark file with harpoon" }
        )

        keymap.set(
            "n",
            "<leader>hu",
            "<cmd>lua require('harpoon.mark').rm_file()<cr>",
            { desc = "Unmark file from harpoon" }
        )

        keymap.set(
            "n",
            "<leader>hn",
            "<cmd>lua require('harpoon.ui').nav_next()<cr>",
            { desc = "Go to next harpoon mark" }
        )
        keymap.set(
            "n",
            "<leader>hp",
            "<cmd>lua require('harpoon.ui').nav_prev()<cr>",
            { desc = "Go to previous harpoon mark" }
        )
    end,
}
