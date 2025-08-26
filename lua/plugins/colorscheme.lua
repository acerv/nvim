return {
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    config = function()
      require('kanagawa').setup {
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = 'none',
              },
            },
          },
        },
      }

      vim.cmd 'colorscheme kanagawa'
    end,
  },
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    opts = { style = 'night' },
  },
  {
    'EdenEast/nightfox.nvim',
    priority = 1000,
  },
}
