return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    config = function()
    end,
    lazy = false,
    opt = {
        hijack_netrw_behavior = "disabled"
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    }
}


