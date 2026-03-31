--[[
Plugin: nvim-lspconfig

Purpose:
Provides configurations for connecting Neovim to Language Server Protocol (LSP)
servers for different languages.

Why it exists:
Abstracts the boilerplate required to attach, configure, and manage LSP servers.

Role in this config:
Core language intelligence layer:
- diagnostics
- go-to-definition
- references
- hover documentation

Characteristics:
- Does not install servers (that is Mason's job)
- Focuses on attachment and configuration
- Works per-buffer via LspAttach
]]

---@diagnostic disable: undefined-global

return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        local augroup = vim.api.nvim_create_augroup("LspAttach", { clear = true })
        vim.api.nvim_create_autocmd("LspAttach", {
            group = augroup,
            callback = function(args)
                local bufnr = args.buf
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if not client then return end

                local opts = { buffer = bufnr, silent = true }
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

                if client.server_capabilities.documentFormattingProvider then
                    local fmt_group = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = false })
                    vim.api.nvim_clear_autocmds({ group = fmt_group, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = fmt_group,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = bufnr, async = false })
                        end,
                    })
                end
            end,
        })

        vim.lsp.config("lua_ls", {
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                    format = { enable = true },
                },
            },
        })

        vim.lsp.config("pyright", {
            capabilities = capabilities,
            settings = {
                python = {
                    analysis = {
                        typeCheckingMode = "basic",
                    },
                },
            },
        })

        vim.lsp.config("ltex", {
            capabilities = capabilities,
            settings = {
                ltex = {
                    language = "en-US",
                },
            },
        })

        vim.lsp.config("ruff", {
            capabilities = capabilities,
        })

        vim.lsp.config("yamlls", {
            capabilities = capabilities,
            settings = {
                yaml = {
                    keyOrdering = false,
                    validate = true,
                    schemaStore = {
                        enable = true,
                    },
                },
            },
        })

        vim.lsp.config("jsonls", {
            capabilities = capabilities,
            settings = {
                json = {
                    validate = { enable = true },
                },
            },
        })

        vim.lsp.config("marksman", {
            capabilities = capabilities,
        })

        vim.lsp.enable({ "lua_ls", "pyright", "ltex" })

        -- Diagnostics
        vim.diagnostic.config({
            virtual_text = {
                severity = { min = vim.diagnostic.severity.ERROR },
            },
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
            float = {
                border = "rounded",
                source = "always",
            },
        })

        -- Diagnostic signs
        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = " ",
                    [vim.diagnostic.severity.WARN] = " ",
                    [vim.diagnostic.severity.INFO] = " ",
                    [vim.diagnostic.severity.HINT] = "󰠠 ",
                },
                linehl = {
                    [vim.diagnostic.severity.ERROR] = "Error",
                    [vim.diagnostic.severity.WARN] = "Warn",
                    [vim.diagnostic.severity.INFO] = "Info",
                    [vim.diagnostic.severity.HINT] = "Hint",
                },
            },
        })

        -- Hover / Signature borders
        vim.lsp.handlers["textDocument/hover"] =
            vim.lsp.with(vim.lsp.handlers.hover, {
                border = "rounded",
            })

        vim.lsp.handlers["textDocument/signatureHelp"] =
            vim.lsp.with(vim.lsp.handlers.signature_help, {
                border = "rounded",
            })

        -- Keymap
        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
        vim.keymap.set("n", "<leader>td", function()
            local current = vim.diagnostic.config().virtual_text
            vim.diagnostic.config({
                virtual_text = not current,
            })
        end, { desc = "Toggle diagnostics virtual text" })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition)
        vim.keymap.set("n", "gr", vim.lsp.buf.references)
        vim.keymap.set("n", "K", vim.lsp.buf.hover)
        vim.keymap.set("n", "<leader>ds", vim.lsp.buf.document_symbol)
    end,
}
