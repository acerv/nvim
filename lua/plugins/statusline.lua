return {
  {
    'echasnovski/mini.icons',
    lazy = true,
    opts = {},
    init = function()
      package.preload['nvim-web-devicons'] = function()
        require('mini.icons').mock_nvim_web_devicons()
        return package.loaded['nvim-web-devicons']
      end
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'echasnovski/mini.icons' },
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
