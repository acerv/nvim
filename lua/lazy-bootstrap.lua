if not (jit and jit.version and pcall(require, 'ffi')) then
  vim.schedule(function()
    vim.notify(
      'Plugins disabled: this Neovim build uses plain Lua 5.1; install a LuaJIT build.',
      vim.log.levels.WARN,
      { title = 'Neovim config' }
    )
  end)
  return
end

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }

  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { import = 'plugins' },
}, {
  defaults = { version = '*' },
  performance = {
    rtp = {
      disabled_plugins = {
        'netrwPlugin',
        'tarPlugin',
        'zipPlugin',
        'tutor',
        'tohtml',
        'gzip',
      },
    },
  },
})
