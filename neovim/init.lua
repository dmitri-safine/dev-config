---@diagnostic disable: undefined-global

-- Bootstrap lazy.nvim package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Load core modules
require("core.options")
require("core.commands")
require("core.keymaps")
require("core.autocmds")
-- Load plugins
require("config.lazy")

vim.opt.termguicolors = true
