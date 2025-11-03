return {
	"ontomap/symbio-nvim",
	lazy = false, -- load at startup so the watcher is active
	config = function()
		require("symbio").setup({
			vault_dir = vim.fn.expand("g:/My Drive/obsidian/vaults/symbio"), -- root of your vault
			inbox_dir = nil, -- defaults to vault_dir .. "/inbox"
			archive_dir = vim.fn.expand("g:/My Drive/obsidian/vaults/symbio/backups/inbox-archives"), -- defaults to vault_dir .. "/.archives"
			retention = 0, -- keep archives indefinitely, change tokeep last N archives
			highlight_ms = 2000, -- highlight duration for new files
			watcher = {
				enabled = true,
				debounce_ms = 200,
			},
		})
	end,
	dependencies = { "nvim-tree/nvim-tree.lua" },
}
