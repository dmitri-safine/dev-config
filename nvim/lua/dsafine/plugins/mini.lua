return {
	"nvim-mini/mini.nvim",
	version = "*", -- or use 'stable' for the latest stable release
	config = function()
		-- You can configure individual mini.nvim modules here
		require("mini.icons").setup() -- Enable mini.icons
		-- Other mini.nvim modules can be configured similarly
		-- require('mini.statusline').setup()
	end,
}
