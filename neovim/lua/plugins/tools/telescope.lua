--[[
Plugin: telescope.nvim

Purpose:
A fuzzy finder framework for searching files, symbols, buffers, and
LSP results using interactive pickers.

Why it exists:
Provides fast, keyboard-driven discovery without persistent UI elements.

Role in this config:
Primary search and discovery tool:
- files
- LSP definitions and references
- symbols and diagnostics

Characteristics:
- Ephemeral UI (opens and closes)
- Highly extensible
- Complements nvim-tree (search vs structure)
]]

---@diagnostic disable: undefined-global

local is_win = vim.fn.has("win32") == 1

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = is_win
					and "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
				or "make",
		},
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				path_display = { "truncate " },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })

		keymap.set("n", "<leader>gd", builtin.lsp_definitions, { desc = "LSP definitions" })
		keymap.set("n", "<leader>gr", builtin.lsp_references, { desc = "LSP references" })
		keymap.set("n", "<leader>gi", builtin.lsp_implementations, { desc = "LSP implementations" })
		keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, { desc = "Document symbols" })
	end,
}
