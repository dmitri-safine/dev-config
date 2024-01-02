return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-tree/nvim-tree.lua",
	},
	config = function()
		-- configure setup
		local neogit = require("neogit")
		neogit.setup({
			kind = "split",
		})

		-- set nvim-tree to refresh on git status update
		vim.cmd([[ autocmd User NeogitStatusRefreshed :NvimTreeRefresh ]])

		-- configure key maps
		local keymap = vim.keymap
		keymap.set("n", "<leader>gg", "<cmd>Neogit<CR>", { desc = "Open git" })
		keymap.set("n", "<leader>gc", "<cmd>Neogit commit<CR>", { desc = "Open git commit popup" })
	end,
}
