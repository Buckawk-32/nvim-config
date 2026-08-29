return {
    {
        'L3MON4D3/LuaSnip',
        lazy = false,
        dependencies = {
            'saadparwaiz1/cmp_luasnip',
            "rafamadriz/friendly-snippets"
        }
    },
    { 'hrsh7th/cmp-nvim-lsp',
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            vim.lsp.config("*", {
                capabilities = capabilities,
            })
        end,
    },
    {
        'hrsh7th/nvim-cmp',
        lazy = false,
        config = function ()
            local cmp = require'cmp'
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                  -- REQUIRED - you must specify a snippet engine
                  expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                  end,
                },
                window = {
                  completion = cmp.config.window.bordered({
                    border = "none",
                    winhighlight = 'Normal:NormalFloat,CursorLine:Visual,Search:None',
                  }),
                  documentation = cmp.config.window.bordered({
                    border = "single",
                    winhighlight = 'Normal:NormalFloat,CursorLine:Visual,Search:None',
                  }),
                },
                mapping = cmp.mapping.preset.insert({
                  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                  ['<C-f>'] = cmp.mapping.scroll_docs(4),
                  ['<C-Space>'] = cmp.mapping.complete(),
                  ['<C-e>'] = cmp.mapping.abort(),
                  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'buffer' },
                    { name = "path" },
                })
              })

        end,

    },



    -- 'saghen/blink.cmp',
    -- opts = {
        -- keymap = { preset = "default" },
        -- appearance = { nerd_font_variant = "mono" },
        -- completion = { documentation = { auto_show = false } },
        -- sources = {
            -- default = { "lsp", "path", "snippets", "buffer" },
        -- },
        -- fuzzy = { implementation = "prefer_rust_with_warning" }
    -- },
    -- opts_extend = { "source.default" }
    {
        "antosha417/nvim-lsp-file-operations",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-neo-tree/neo-tree.nvim",
        },
        config = function()
            require("lsp-file-operations").setup()
        end,
    },
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        config = function ()
            require("lazydev").setup()
        end,
    },
}
