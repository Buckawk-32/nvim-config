return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = 'main',
        lazy = false,
        build = ":TSUpdate",
        priority = 50,
        config = function ()
            -- require("nvim-treesitter.config").setup({
                -- ensure_installed = {
                --     "bash",
                --     "c",
                --     "diff",
                --     "html",
                --     "javascript",
                --     "jsdoc",
                --     "json",
                --     "jsonc",
                --     "lua",
                --     "luadoc",
                --     "luap",
                --     "markdown",
                --     "markdown_inline",
                --     "printf",
                --     "python",
                --     "query",
                --     "regex",
                --     "toml",
                --     "tsx",
                --     "typescript",
                --     "vim",
                --     "vimdoc",
                --     "xml",
                --     "yaml",
                --     "gdscript",
                --     "godot_resource"
                -- },
                -- indent = {
                --     enable = true
                -- },
                -- highlight = {
                --     enable = true
                -- },

            require("nvim-treesitter").setup()
            require("nvim-treesitter").install({
                "bash",
                "c",
                "cpp",
                "diff",
                "html",
                "javascript",
                "jsdoc",
                "json",
                "jsonc",
                "lua",
                "luadoc",
                "luap",
                "markdown",
                "markdown_inline",
                "printf",
                "python",
                "query",
                "regex",
                "toml",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
                "xml",
                "yaml",
                "gdscript",
                "godot_resource"
            }, { max_jobs = 1 }):wait(600000)

            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "*" },
                callback = function (args)
                    local bufnr = args.buf

                    pcall(vim.treesitter.start, bufnr)

                    local winnr = vim.fn.bufwinid(bufnr)
                    if winnr ~= -1 then
                        -- vim.wo.foldmethod = 'expr'
                        -- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
                        vim.api.nvim_set_option_value("foldmethod", "expr", { scope = "local", win = winnr })
                        vim.api.nvim_set_option_value("foldexpr", "v:lua.vim.treesitter.foldexpr()", { scope = "local", win = winnr })
                    end

                    vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

                end,

            })
        end
    },
}
