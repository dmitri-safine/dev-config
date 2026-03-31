--[[
Plugin: gitsigns.nvim

Purpose:
Displays Git diff information directly in the editor gutter, showing
added, modified, and removed lines compared to the current Git index.

Why it exists:
Provides immediate visual feedback about code changes without requiring
explicit Git commands or context switches.

Role in this config:
Lightweight change-awareness tool during editing.
Helps track modifications at a glance while keeping the workflow focused.

Characteristics:
- Inline visual indicators only
- No persistent UI
- Git-aware but non-intrusive
]]

return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = true,
}
