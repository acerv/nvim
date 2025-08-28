return {
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    init = function()
      vim.g.barbar_auto_setup = false

      vim.keymap.set('n', '<leader>bb', '<cmd>BufferPrevious<CR>', { desc = 'Previous buffer' })
      vim.keymap.set('n', '<leader>bn', '<cmd>BufferNext<CR>', { desc = 'Next buffer' })
      vim.keymap.set('n', '<leader>ba', '<cmd>BufferCloseAllButCurrent<CR>', { desc = 'Close other buffers' })
      vim.keymap.set('n', '<leader>bc', '<cmd>BufferClose<CR>', { desc = 'Close buffer' })
      vim.keymap.set('n', '<leader>bA', '<cmd>BufferCloseAllButPinned<CR>', { desc = 'Close all buffers' })
    end,
    opts = {
      animation = false,
      auto_hide = true,
      sidebar_filetypes = {
        NvimTree = true,
        ['neo-tree'] = true,
      },
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
}
