return {
  'oskarrrrrrr/symbols.nvim',
  config = function()
    local r = require 'symbols.recipes'
    require('symbols').setup(r.DefaultFilters, r.AsciiSymbols, {
      sidebar = {
        open_direction = 'right',
      },
    })
    vim.keymap.set('n', '<leader>p', '<cmd>Symbols<CR>')
    vim.keymap.set('n', '<leader>P', '<cmd>SymbolsClose<CR>')
  end,
}
