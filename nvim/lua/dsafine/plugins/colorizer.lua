return {
	"NvChad/nvim-colorizer.lua",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local colorizer = require("colorizer")
		colorizer.setup({
			filetypes = { "css", "html" },
		})
	end,
}
