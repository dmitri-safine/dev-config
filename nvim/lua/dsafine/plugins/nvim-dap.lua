return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")
		dap.adapters.coreclr = {
			type = "executable",
			command = "C:\\Users\\uxii\\AppData\\Local\\nvim-data\\mason\\packages\\netcoredbg\\netcoredbg\\netcoredbg.exe",
			args = { "--interpreter=vscode" },
		}

		dap.configurations.cs = {
			{
				type = "coreclr",
				name = "launch - netcoredbg",
				request = "launch",
				program = function()
					return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "\\bin\\Debug\\net8.0\\", "file")
				end,
			},
		}

		local keymap = vim.keymap
		keymap.set("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>", { desc = "Continue" })
		keymap.set("n", "<F10>", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Step over" })
		keymap.set("n", "<F11>", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Step into" })
		keymap.set("n", "<F12>", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Step out" })
		keymap.set("n", "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Toggle breakpoint" })
		keymap.set(
			"n",
			"<leader>qc",
			"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
			{ desc = "Set conditional breakpoint" }
		)
		keymap.set(
			"n",
			"<leader>qm",
			"<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
			{ desc = "Set breakpoint with message" }
		)
		keymap.set("n", "<leader>qr", "<cmd>lua require'dap'.repl.open()<CR>", { desc = "Open debugger REPL" })
		keymap.set("n", "<leader>ql", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Run last with the debugger" })
	end,
}
