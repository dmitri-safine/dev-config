require("lazy").setup(
    {
        { import = "plugins.core" },
        { import = "plugins.lsp" },
        { import = "plugins.tools" },
        { import = "plugins.ui" },
    },
    {
        checker = {
            enabled = true,
            notify = false
        },
        change_detection = {
            notify = false
        }
    }
)
