return {
    {
        "lervag/vimtex",
        lazy = false,     -- we don't want to lazy load VimTeX
        -- tag = "v2.15", -- uncomment to pin to a specific release
        init = function()
            -- VimTeX configuration goes here, e.g.
            vim.g.vimtex_view_method = "zathura"
            vim.g.vimtex_compiler_method = "texpresso"
        end
    },
    {
        "let-def/texpresso.vim",
        ft = "tex",
        config = function ()
            local opts = { buffer = bufnr, noremap = true, silent = true }
            local mapNormal = function(keybind, func)
                vim.keymap.set("n", keybind, func, opts)
            end

            opts.desc = "Open TeXpresso"
            mapNormal("<leader>t", ":TeXpresso %<CR>")
        end,
    }
}
