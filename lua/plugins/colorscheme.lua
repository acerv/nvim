return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd 'colorscheme tokyonight-night'
    vim.cmd 'hi link @string.documentation.python Comment'
  end,
}
