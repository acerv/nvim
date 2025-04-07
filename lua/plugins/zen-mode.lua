return {
  'folke/zen-mode.nvim',
  window = {
    width = 120,
  },
  config = function()
    vim.keymap.set('n', '<leader>z', ':ZenMode<CR>', { desc = 'Enter in Zen mode' })
  end,
}
