-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

if vim.g.vscode then
  -- VSCode Neovim
  require "lua.yuval.keymaps"
  require "lua.yuval.plugins"
  require "lua.yuval.settings"
else
  -- Ordinary Neovim
  require("lazy").setup({
    spec = {
      { "LazyVim/LazyVim",                       import = "lazyvim.plugins" },
      { import = "lazyvim.plugins.extras.vscode" },
    },

  })
end
