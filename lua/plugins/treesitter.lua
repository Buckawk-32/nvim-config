return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = 'main',
        lazy = false,
        build = ":TSUpdate",
        priority = 50,
        config = function ()
            require("nvim-treesitter.config").setup({
                ensure_installed = {
                    "bash",
                    "c",
                    "c_sharp",
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
                },
                sync_install = false,
                auto_install = true,

                indent = {
                    enable = true
                },
                highlight = {
                    enable = true
                },
            })
        end
    },
}
