return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy',
    config = function()
      require('lualine').setup {
        options = {
          theme = 'tokyonight-night',
        },
        sections = {
          lualine_c = {
            {
              'filename',
              path = 1,
            },
          },
        },
      }
    end,
  },
}
