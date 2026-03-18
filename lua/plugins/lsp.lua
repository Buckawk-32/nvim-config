---@diagnostic disable: undefined-global
return {
    {
        "mason-org/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "rust_analyzer",
                    "ts_ls",
                    "stylua",
                    "arduino_language_server",
                    "ty",
                    "ruff",
                    "marksman"
                },
            })
        end,
    },
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup({
                registries = {
                    "github:mason-org/mason-registry",
                    "github:Crashdummyy/mason-registry",
                },
            })
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

                    opts.desc = "Show Documentation Under Cursor"
                    mapNormal("K", vim.lsp.buf.hover)

                    opts.desc = "Show LSP Definition"
                    mapNormal("<leader>gd", vim.lsp.buf.definition)

                    opts.desc = "Go to Declaration"
                    mapNormal("<leader>gD", vim.lsp.buf.declaration)

                    opts.desc = "Show LSP Implementation"
                    mapNormal("<leader>gi", vim.lsp.buf.implementation)

                    opts.desc = "Show LSP References"
                    mapNormal("<leader>gr", require("telescope.builtin").lsp_references)

                    opts.desc = "Show LSP Type Definition"
                    mapNormal("<leader>gt", vim.lsp.buf.type_definition)

                    opts.desc = "Rename Symbol"
                    mapNormal("<leader>rn", vim.lsp.buf.rename)

                    opts.desc = "Show Current Buffer's Symbols"
                    mapNormal("<leader>ds", require("telescope.builtin").lsp_document_symbols)

                    opts.desc = "Show Workspace Symbols"
                    mapNormal("<leader>ws", require("telescope.builtin").lsp_workspace_symbols)

                    opts.desc = "Show Available Code Actions"
                    vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, opts)

                    opts.desc = "Show Line Diagnostics"
                    mapNormal("<leader>d", vim.diagnostic.open_float)

                    opts.desc = "Show Buffer Diagnostics"
                    mapNormal("<leader>D", require("telescope.builtin").diagnostics)

                    opts.desc = "Jump to Next Diagnostics"
                    mapNormal("]d", function ()
                        vim.diagnostic.jump({ count = 1, float = true })
                    end)

                    opts.desc = "Jump to Previous Diagnostics"
                    mapNormal("[d", function ()
                        vim.diagnostic.jump({ count = -1, float = true })
                    end)

                    opts.desc = "Restart LSP"
                    mapNormal("<leader>lrs", ":LspRestart<CR>")
                end,
            })

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

            vim.lsp.config("gdscript", {
                cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
                -- cmd = { "godot-wsl-lsp", "--useMirroredNetworking" },
                filetype = { "gd", "gdscript" },
                root_markers = { "project.godot", ".git" },
            })
            vim.lsp.enable("gdscript")
        end,
    }
}
