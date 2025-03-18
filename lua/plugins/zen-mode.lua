return {
  'folke/zen-mode.nvim',
  window = {
    width = 120,
  },
  config = function()
    vim.keymap.set('n', '<Space>z', ':ZenMode<CR>', { desc = 'Enter in Zen mode' })
  end,
}
