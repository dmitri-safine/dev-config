return {
	"barreiroleo/ltex-extra.nvim",
	ft = { "markdown", "tex" },
	config = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()
		local on_attach = function(client, bufnr)
			-- on attach options
		end

		require("ltex_extra").setup({
			load_langs = { "en-US" },
			init_check = true,
			path = vim.fn.expand("~") .. "/.local/share/ltex",
			log_level = "none",
			server_opts = {
				capabilities = capabilities,
				on_attach = on_attach,
			},
		})
	end,
}
