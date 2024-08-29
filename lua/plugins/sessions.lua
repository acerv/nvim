return {
  'stevearc/resession.nvim',
  opts = {},
  config = function()
    local resession = require 'resession'
    resession.setup {}

    vim.api.nvim_create_autocmd('VimLeavePre', {
      callback = function()
        resession.save('last', { notify = false })
      end,
    })

    vim.keymap.set('n', '<leader>Ss', resession.save, { desc = 'Save session' })
    vim.keymap.set('n', '<leader>Sf', resession.load, { desc = 'Show sessions' })
    vim.keymap.set('n', '<leader>Sd', resession.delete, { desc = 'Delete session' })
    vim.keymap.set('n', '<leader>Sl', function()
      resession.load 'last'
    end, { desc = 'Load last session' })
  end,
}
