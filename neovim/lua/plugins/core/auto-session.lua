--[[
Plugin: auto-session

Purpose:
Automatically saves and restores Neovim sessions on a per-project basis.

Why it exists:
Eliminates the need to manually create, load, or manage session files.
Allows the editor to resume exactly where work was left off, including
open buffers, window splits, and working directory.

Role in this config:
Project state manager.
Preserves editor context across restarts and enables a "continue working"
workflow when reopening the same project.

Typical behavior:
- Automatically saves a session when leaving a project
- Automatically restores the session when re-entering the project directory
- Works transparently in the background

Important considerations:
- Should ignore non-project directories (e.g. home, root)
- Should not persist UI-only state unnecessarily
- Complements, but does not replace, file navigation or search tools

Characteristics:
- Non-visual
- State-focused
- Enhances continuity rather than interaction
]]

---@diagnostic disable: undefined-global
return {
    "rmagatti/auto-session",
    config = function()
        local auto_session = require("auto-session")

        auto_session.setup({
            auto_restore = true,
            suppressed_dirs = { "~/", "~/dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
        })

        local keymap = vim.keymap

        keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })             -- restore last workspace session for current directory
        keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory
        vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
    end,
}
