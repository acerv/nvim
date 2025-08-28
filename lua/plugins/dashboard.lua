return {
  {
    'goolord/alpha-nvim',
    dependences = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      local dashboard = require 'alpha.themes.dashboard'

      dashboard.section.header.val = {
        [[]],
        [[]],
        [[]],
        [[ ┏┓╻┏━╸┏━┓╻ ╻╻┏┳┓ ]],
        [[ ┃┗┫┣╸ ┃ ┃┃┏┛┃┃┃┃ ]],
        [[ ╹ ╹┗━╸┗━┛┗┛ ╹╹ ╹ ]],
        [[]],
      }
      dashboard.section.buttons.val = {
        dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
        dashboard.button('l', '󰘁  Open last session', [[:lua require('resession').load('last') <cr>]]),
        dashboard.button('f', '  Show sessions', [[:lua require('resession').load() <cr>]]),
        dashboard.button('c', '  Configuration', '<CMD>:edit ~/.config/nvim<CR>'),
        dashboard.button('L', '󰒲  Lazy', '<CMD>:Lazy<CR>'),
        dashboard.button('q', '󰈆  Quit NVIM', ':qa<CR>'),
      }
      dashboard.config.opts.noautocmd = true

      vim.cmd [[autocmd User AlphaReady echo 'ready']]

      vim.api.nvim_create_autocmd('User', {
        pattern = 'LazyVimStarted',
        callback = function()
          local lazy = require('lazy').stats()
          dashboard.section.footer.val = string.format('⚡ Loaded %d/%d plugins in %.2fms', lazy.loaded, lazy.count, lazy.startuptime)
          pcall(vim.cmd.AlphaRedraw)
        end,
      })

      require('alpha').setup(dashboard.config)
    end,
  },
}
