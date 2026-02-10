return {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    config = function()
        require('lualine').setup({
            options = {
                theme = "catppuccin",
                diasbled_filetypes = {
                    statusline = { "neo-tree" },
                },
            }

        })
    end,

    dependencies = { 'nvim-tree/nvim-web-devicons' }
};

