vim.wo.number = true
vim.o.relativenumber = true


vim.o.clipboard = "unnamedplus"
vim.o.wrap = false
vim.o.linebreak = true

vim.o.mouse = "a"
vim.o.autoindent = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true

vim.api.nvim_set_hl(0, "SameColorCursor", { bg="#cdd6f4" })

vim.opt.guicursor = "n-v-c:block-SameColorCursor,i-ci-ve:ver25-SameColorCursor,r-cr-o:hor20-SameColorCursor"
