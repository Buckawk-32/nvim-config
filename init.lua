---@diagnostic disable: undefined-global
require "core.keymaps"
require "core.options"

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

vim.g.netrw_nogx = 1
vim.g.loaded_netrwPlugin = 1

local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require("lazy").setup({
    require "plugins.neotree",
    require "plugins.git",
    require "plugins.colortheme",
    require "plugins.telescope",
    require "plugins.whichKey",
    require "plugins.markdown",
    require "plugins.treesitter",
    require "plugins.lsp",
    require "plugins.lualine",
    require "plugins.barbar",
    require "plugins.cmp"
})

