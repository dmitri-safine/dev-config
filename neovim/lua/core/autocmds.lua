---@diagnostic disable: undefined-global

-- core/autocmds.lua
-- Autocommands Suite

local api = vim.api

----------------------------------------------------------
-- Highlight on yank (copy)
----------------------------------------------------------
api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
    end,
})

----------------------------------------------------------
-- Remove trailing whitespace on save
----------------------------------------------------------
api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        local save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})

----------------------------------------------------------
-- Remove trailing blank lines at end of file on save
----------------------------------------------------------
api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        local save_cursor = vim.fn.getpos(".")
        vim.cmd([[silent! %s/\n\+\%$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})

----------------------------------------------------------
-- Auto-create missing directories before saving
----------------------------------------------------------
api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(event)
        local file = event.match
        local dir = vim.fn.fnamemodify(file, ":p:h")
        if not vim.loop.fs_stat(dir) then
            vim.fn.mkdir(dir, "p")
        end
    end,
})

----------------------------------------------------------
-- Restore cursor position when reopening file
----------------------------------------------------------
api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

----------------------------------------------------------
-- Make terminal buffers nicer
----------------------------------------------------------
api.nvim_create_autocmd("TermOpen", {
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
        vim.opt.signcolumn = "no"
    end,
})

----------------------------------------------------------
-- Automatic background detection sync (if ever needed)
----------------------------------------------------------
api.nvim_create_autocmd("OptionSet", {
    pattern = "background",
    callback = function()
        require("themes.aline-sky").load({ variant = "auto" })
    end,
})
