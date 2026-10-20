return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    event = 'VeryLazy',
    main = 'nvim-treesitter',
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('treesitter-start', { clear = true }),
        callback = function(ev)
          pcall(vim.treesitter.start, ev.buf)
        end,
      })
    end,
    config = function()
      require('nvim-treesitter').setup()
      local ensure_installed = {
        'bash',
        'c',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
        'json',
        'yaml',
        'perl',
        'go',
        'rust',
        'rst',
        'toml',
      }
      local installed = require('nvim-treesitter').get_installed()
      local to_install = vim
        .iter(ensure_installed)
        :filter(function(p)
          return not vim.tbl_contains(installed, p)
        end)
        :totable()
      if #to_install > 0 then
        require('nvim-treesitter').install(to_install)
      end
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    event = 'BufReadPre',
    config = function()
      vim.keymap.set('n', '<leader>nn', function()
        require('nvim-treesitter-textobjects.swap').swap_next '@parameter.inner'
      end)
      vim.keymap.set('n', '<leader>np', function()
        require('nvim-treesitter-textobjects.swap').swap_previous '@parameter.inner'
      end)
    end,
  },
}
