return {
    {
        "mason-org/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "rust_analyzer",
                    "pyright",
                    "ts_ls",
                    "stylua",
                    "arduino_language_server",
                    "pylsp",
                    "marksman",
                },
            })
        end,
    },
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function()
                    local opts = { buffer = bufnr, noremap = true, silent = true }
                    local mapNormal = function(keybind, func)
                        vim.keymap.set("n", keybind, func, opts)
                    end

                    opts.desc = "Show documentation under cursor"
                    mapNormal("K", vim.lsp.buf.hover)

                    opts.desc = "Show LSP definition"
                    mapNormal("<leader>gd", vim.lsp.buf.definition)

                    opts.desc = "Go to declaration"
                    mapNormal("<leader>gD", vim.lsp.buf.declaration)

                    opts.desc = "Show LSP implementation"
                    mapNormal("<leader>gi", vim.lsp.buf.implementation)

                    opts.desc = "Show LSP references"
                    mapNormal("<leader>gr", require("telescope.builtin").lsp_references)

                    opts.desc = "Show LSP type definitions"
                    mapNormal("<leader>gt", vim.lsp.buf.type_definition)

                    opts.desc = "Rename Symbol"
                    mapNormal("<leader>rn", vim.lsp.buf.rename)

                    opts.desc = "Show Current Buffer's Symbols"
                    mapNormal("<leader>ds", require("telescope.builtin").lsp_document_symbols)

                    opts.desc = "Show Workpace Symbols"
                    mapNormal("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols)

                    opts.desc = "Show available Code Actions"
                    vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, opts)

                    opts.desc = "Show Line Diagnostic"
                    mapNormal("<leader>d", vim.diagnostic.open_float)

                    opts.desc = "Show Buffer Diagnostics"
                    mapNormal("<leader>D", require("telescope.builtin").diagnostics)

                    opts.desc = "Jump to Next Diagnostic"
                    vim.keymap.set("n", "]d", function()
                        vim.diagnostic.jump({ count = 1, float = true })
                    end, opts)

                    opts.desc = "Jump to Previous Diagnostics"
                    vim.keymap.set("n", "[d", function()
                        vim.diagnostic.jump({ count = -1, float = true })
                    end, opts)

                    opts.desc = "Restart LSP"
                    vim.keymap.set("n", "<leader>lrs", ":LspRestart<CR>", opts)
                end,
            })

            -- vim.lsp.inlay_hint.enable(true)

            local severity = vim.diagnostic.severity

            vim.diagnostic.config({
                virtual_text = {
                    enabled = true,
                },
                signs = {
                    text = {
                        [severity.ERROR] = " ",
                        [severity.WARN] = " ",
                        [severity.HINT] = "󰠠 ",
                        [severity.INFO] = " ",
                    },
                },
                underline = true,
                float = { border = "rounded" },
            })

            vim.lsp.config("gdscript", {})
            vim.lsp.enable("gdscript")
        end,
    }
}
