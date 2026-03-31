---@diagnostic disable: undefined-global

-- core/keymaps.lua
-- Ergonomic keymaps for NORMAL mode

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

----------------------------------------------------------
-- Navigation
----------------------------------------------------------
-- Move between windows with Alt + arrow keys
map("n", "<A-Left>", "<C-w>h", opts)
map("n", "<A-Right>", "<C-w>l", opts)
map("n", "<A-Down>", "<C-w>j", opts)
map("n", "<A-Up>", "<C-w>k", opts)

-- Resize splits
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

----------------------------------------------------------
-- Buffers
----------------------------------------------------------
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)
map("n", "<leader>bd", ":bdelete<CR>", opts)

----------------------------------------------------------
-- Quick actions
----------------------------------------------------------
map("n", "<leader>w", ":write<CR>", opts)
map("n", "<leader>q", ":quit<CR>", opts)
map("n", "<leader>h", ":nohlsearch<CR>", opts)

----------------------------------------------------------
-- File explorer (will integrate with telescope / netrw)
----------------------------------------------------------
map("n", "<leader>e", ":Ex<CR>", opts)

----------------------------------------------------------
-- System clipboard helpers
----------------------------------------------------------
map("v", "<leader>y", '"+y', opts)
map("n", "<leader>y", '"+y', opts)
map("n", "<leader>Y", '"+Y', opts)

----------------------------------------------------------
-- Theme toggles
----------------------------------------------------------
map("n", "<leader>sd", ":DarkSky<CR>", opts)
map("n", "<leader>sl", ":LightSky<CR>", opts)

----------------------------------------------------------
-- Foundation for future plugins (we will fill these later)
----------------------------------------------------------
-- Telescope
map("n", "<leader>ff", function() end, opts) -- placeholder
map("n", "<leader>fg", function() end, opts)
map("n", "<leader>fb", function() end, opts)

-- LSP
map("n", "<leader>lr", function() end, opts)
map("n", "<leader>ld", function() end, opts)
map("n", "<leader>lf", function() end, opts)

-- Git
map("n", "<leader>gs", function() end, opts)
map("n", "<leader>gd", function() end, opts)
map("n", "<leader>gb", function() end, opts)

----------------------------------------------------------
--- INSERT mode
----------------------------------------------------------

-- jk -> Normal mode
map("i", "jk", "<Esc>", opts)

-- escape behind the closing bracket
map("i", "<C-l>", function()
    local col = vim.fn.col(".")
    local line = vim.fn.getline(".")
    local next_char = line:sub(col, col)

    if next_char == ")" or next_char == "]" or next_char == "}" or next_char == "'" or next_char == '"' or next_char == "`" then
        vim.api.nvim_feedkeys(
            vim.api.nvim_replace_termcodes("<Right>", true, false, true),
            "n",
            true
        )
    end
end, { silent = true })
