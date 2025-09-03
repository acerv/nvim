return {
  {
    'nmac427/guess-indent.nvim',
    config = function()
      require('guess-indent').setup {}
    end,
  },
  {
    'echasnovski/mini.indentscope',
    version = '*',
    event = 'VeryLazy',
    config = function()
      local indent = require 'mini.indentscope'

      indent.setup {
        draw = {
          delay = 0,
          animation = indent.gen_animation.none(),
        },
        options = {
          indent_at_cursor = false,
        },
        symbol = '▎',
      }

      vim.api.nvim_create_autocmd({ 'FileType' }, {
        desc = 'Disable indentscope for certain filetypes',
        callback = function()
          local ignore_filetypes = {
            'dashboard',
            'help',
            'lazy',
            'mason',
            'NvimTree',
            'toggleterm',
          }
          if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
            vim.b.miniindentscope_disable = true
          end
        end,
      })
    end,
  },
}
