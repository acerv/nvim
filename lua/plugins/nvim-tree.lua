return {
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = true,
    event = 'VimEnter',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {
        update_focused_file = {
          enable = true,
        },
      }

      local api = require 'nvim-tree.api'
      vim.keymap.set('n', '<leader>e', api.tree.toggle, { desc = 'Open File tree' })
    end,
  },
}
