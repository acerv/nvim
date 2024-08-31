return {
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    config = function()
      vim.cmd [[colorscheme kanagawa]]
      vim.cmd.hi 'Comment gui=none'
    end,
  },
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    config = true,
  },
}
