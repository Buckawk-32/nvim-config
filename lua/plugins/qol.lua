return {
    {
        "Djancyp/better-comments.nvim",
        lazy = false,
        config = function ()
            require("better-comment").Setup({
                tags = {
                    {
                        name = "TODO",
                        fg = "white",
                        bg = "#0a7aca",
                        bold = true,
                        virtual_text = "",
                    },
                    {
                        name = "FIX",
                        fg = "white",
                        bg = "#f44747",
                        bold = true,
                        virtual_text = "",
                    },
                    {
                        name = "WARNING",
                        fg = "#FFA500",
                        bg = "",
                        bold = false,
                        virtual_text = "",
                    },
                    {
                        name = "!",
                        fg = "#f44747",
                        bg = "",
                        bold = true,
                        virtual_text = "",
                    }
                }
            })
        end,
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
    {
        'nvim-mini/mini.surround',
        version = false,
        config = function ()
            require("mini.surround").setup({
                custom_surroundings = nil,
                highlight_duration = 500,
                mappings = {
                    add = 'sa', -- Add surrounding in Normal and Visual modes
                    delete = 'sd', -- Delete surrounding
                    find = 'sf', -- Find surrounding (to the right)
                    find_left = 'sF', -- Find surrounding (to the left)
                    highlight = 'sh', -- Highlight surrounding
                    replace = 'sr', -- Replace surrounding
                    suffix_last = 'l', -- Suffix to search with "prev" method
                    suffix_next = 'n', -- Suffix to search with "next" method
                },

                -- Number of lines within which surrounding is searched
                n_lines = 20,
                -- Whether to respect selection type:
                -- - Place surroundings on separate lines in linewise mode.
                -- - Place surroundings on each line in blockwise mode.
                respect_selection_type = false,
                search_method = 'cover',
                silent = false,
            })
        end,
    },
    {
        'abecodes/tabout.nvim',
        lazy = false,
        config = function()
            require('tabout').setup({
                tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
                backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
                act_as_tab = true, -- shift content if tab out is not possible
                act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
                -- default_tab = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
                -- default_shift_tab = '<C-d>', -- reverse shift default action,
                enable_backwards = true, -- well ...
                completion = false, -- if the tabkey is used in a completion pum
                tabouts = {
                    { open = "'", close = "'" },
                    { open = '"', close = '"' },
                    { open = '`', close = '`' },
                    { open = '(', close = ')' },
                    { open = '[', close = ']' },
                    { open = '{', close = '}' },
                    { open = '*', close = '*' }
                },
                ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
                exclude = {} -- tabout will ignore these filetypes
            })
        end,
        dependencies = { -- These are optional
            "nvim-treesitter/nvim-treesitter",
            "L3MON4D3/LuaSnip",
            "hrsh7th/nvim-cmp"
        },
        opt = true,  -- Set this to true if the plugin is optional
        event = 'InsertCharPre', -- Set the event to 'InsertCharPre' for better compatibility
        priority = 1000,
    },
    {
        'Wansmer/treesj',
        keys = { '<space>m', '<space>j', '<space>s' },
        dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
        config = function()
            require('treesj').setup({--[[ your config ]]})
        end,
    },
    {
        "j-hui/fidget.nvim",
        config = function ()
            require("fidget").setup({
                notification = {
                    view = {
                        stack_upwards = true,
                        align = "message",
                        reflow = false,             -- Reflow (wrap) messages wider than notification window
                        icon_separator = " ",       -- Separator between group name and icon
                        group_separator = "---",    -- Separator between notification groups
                        group_separator_hl =        -- Highlight group used for group separator
                            "Comment",
                        line_margin = 1,            -- Spaces to pad both sides of each non-empty line
                        render_message =            -- How to render notification messages
                            function(msg, cnt)
                                return cnt == 1 and msg or string.format("(%dx) %s", cnt, msg)
                            end,
                    },
                    window = {
                        normal_hl = "Comment",
                        winblend = 0,
                        border = "none",
                        zindex = 45,
                        x_pading = 1,
                        y_pading = 1,
                        tabstop = 4,
                        align = "bottom",
                        relative = "editor",
                    }
                }
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        lazy = false,
        config = function()
            require("nvim-treesitter-textobjects").setup({
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        include_surrounding_whitespace = false,
                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
                            ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
                            ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
                            ["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
                            ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

                            -- works for javascript/typescript files (custom capture I created in after/queries/ecma/textobjects.scm)
                            ["a:"] = { query = "@property.outer", desc = "Select outer part of an object property" },
                            ["i:"] = { query = "@property.inner", desc = "Select inner part of an object property" },
                            ["l:"] = { query = "@property.lhs", desc = "Select left part of an object property" },
                            ["r:"] = { query = "@property.rhs", desc = "Select right part of an object property" },

                            ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
                            ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

                            ["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
                            ["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

                            ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
                            ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

                            ["af"] = { query = "@call.outer", desc = "Select outer part of a function call" },
                            ["if"] = { query = "@call.inner", desc = "Select inner part of a function call" },

                            ["am"] = { query = "@function.outer", desc = "Select outer part of a method/function definition" },
                            ["im"] = { query = "@function.inner", desc = "Select inner part of a method/function definition" },

                            ["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
                            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
                        },
                    },
                    swap = {
                        enable = true,
                        swap_next = {
                            ["<leader>na"] = "@parameter.inner", -- swap parameters/argument with next
                            ["<leader>n:"] = "@property.outer", -- swap object property with next
                            ["<leader>nm"] = "@function.outer", -- swap function with next
                        },
                        swap_previous = {
                            ["<leader>pa"] = "@parameter.inner", -- swap parameters/argument with prev
                            ["<leader>p:"] = "@property.outer", -- swap object property with prev
                            ["<leader>pm"] = "@function.outer", -- swap function with previous
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true,
                        goto_next_start = {
                            ["]f"] = { query = "@call.outer", desc = "Next function call start" },
                            ["]m"] = { query = "@function.outer", desc = "Next method/function def start" },
                            ["]c"] = { query = "@class.outer", desc = "Next class start" },
                            ["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
                            ["]l"] = { query = "@loop.outer", desc = "Next loop start" },

                            -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
                            -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
                            ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
                            ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
                        },
                        goto_next_end = {
                            ["]F"] = { query = "@call.outer", desc = "Next function call end" },
                            ["]M"] = { query = "@function.outer", desc = "Next method/function def end" },
                            ["]C"] = { query = "@class.outer", desc = "Next class end" },
                            ["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
                            ["]L"] = { query = "@loop.outer", desc = "Next loop end" },
                        },
                        goto_previous_start = {
                            ["[f"] = { query = "@call.outer", desc = "Prev function call start" },
                            ["[m"] = { query = "@function.outer", desc = "Prev method/function def start" },
                            ["[c"] = { query = "@class.outer", desc = "Prev class start" },
                            ["[i"] = { query = "@conditional.outer", desc = "Prev conditional start" },
                            ["[l"] = { query = "@loop.outer", desc = "Prev loop start" },
                        },
                        goto_previous_end = {
                            ["[F"] = { query = "@call.outer", desc = "Prev function call end" },
                            ["[M"] = { query = "@function.outer", desc = "Prev method/function def end" },
                            ["[C"] = { query = "@class.outer", desc = "Prev class end" },
                            ["[I"] = { query = "@conditional.outer", desc = "Prev conditional end" },
                            ["[L"] = { query = "@loop.outer", desc = "Prev loop end" },
                        },
                    },
                },
            })
        end,
    }
}
