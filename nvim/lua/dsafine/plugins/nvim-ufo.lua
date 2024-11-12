return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
	},
	config = function()
		local ufo = require("ufo")
		vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
		vim.o.foldcolumn = "1" -- '0' is not bad
		vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		local function get_cell_folds(bufnr)
			local function handleFallbackException(err, providerName)
				if type(err) == "string" and err:match("UfoFallbackException") then
					return ufo.getFolds(bufnr, providerName)
				else
					return require("promise").reject(err)
				end
			end
			return ufo.getFolds(bufnr, "lsp")
				:catch(function(err)
					return handleFallbackException(err, "treesitter")
				end)
				:catch(function(err)
					return handleFallbackException(err, "indent")
				end)
				:thenCall(function(ufo_folds)
					local ok, jupynium = pcall(require, "jupynium")
					if ok then
						for _, fold in ipairs(jupynium.get_folds()) do
							table.insert(ufo_folds, fold)
						end
					end
					return ufo_folds
				end)
		end

		local ftMap = {
			python = get_cell_folds,
		}

		ufo.setup({
			provider_selector = function(bufnr, filetype, buftype)
				return ftMap[filetype]
			end,
		})
	end,
}
