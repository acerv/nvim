return {
  'rcarriga/nvim-notify',
  event = { 'VeryLazy' },
  opts = {
    stages = 'static',
    timeout = 1000,
    render = 'wrapped-compact',
  },
  config = function(_, opts)
    local notify = require 'notify'
    notify.setup(opts)
    vim.notify = notify
  end,
}
