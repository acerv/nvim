return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        direction = 'float',
        open_mapping = [[<A-3>]],
        shade_filetypes = {},
        shade_terminals = true,
        shade_factor = 1,
      }
    end,
  },
}
