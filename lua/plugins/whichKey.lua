---@diagnostic disable: undefined-global
return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        -- layout = {
            -- align = "right",
            -- position = "bottom",
        -- },
        preset = "helix",
    },
    keys = {
        {
          "<leader>?",
          function()
            require("which-key").show({ global = false })
          end,
          desc = "Buffer Local Keymaps (which-key)",
        },
    },
    config = function(_, opts)
        require("which-key").setup(opts)
    end,
}
