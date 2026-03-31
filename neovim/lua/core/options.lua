---@diagnostic disable: undefined-global

-- core/options.lua
-- Base comfort options for NeoVim

local opt = vim.opt

-- UI
opt.number = true         -- show line numbers
opt.relativenumber = true -- relative numbers for navigation
opt.cursorline = true     -- highlight current line
opt.signcolumn = "yes"    -- always show sign column
opt.termguicolors = true  -- enable true color support
opt.wrap = false          -- no line wrap
opt.scrolloff = 8         -- keep 8 lines above/below cursor
opt.sidescrolloff = 8     -- same for horizontal
opt.showmode = false      -- statusline already shows it

-- Layout & Splits
opt.splitright = true -- vertical split to the right
opt.splitbelow = true -- horizontal split below

-- Indentation
opt.expandtab = true   -- use spaces instead of tabs
opt.shiftwidth = 2     -- indent size
opt.tabstop = 2        -- tab width
opt.smartindent = true -- smarter indenting

-- Searching
opt.ignorecase = true -- case-insensitive search
opt.smartcase = true  -- case-sensitive if caps present
opt.incsearch = true  -- live incremental search
opt.hlsearch = true   -- highlight search results

-- Files & buffers
opt.undofile = true  -- persistent undo
opt.swapfile = false -- don't use swap files
opt.backup = false   -- disable backup files

-- Clipboard
opt.clipboard = "unnamedplus" -- integrate system clipboard

-- Performance
opt.updatetime = 200 -- faster completion & diagnostics
opt.timeoutlen = 400 -- faster key sequences

-- Appearance
opt.fillchars = {
    vert = "│",
    eob = " ", -- hide ~ at end of buffer
}
