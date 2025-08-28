return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    event = { 'VeryLazy' },
    opts = {
      ensure_installed = {
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
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
    requires = 'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPre' },
    config = function()
      require('nvim-treesitter.configs').setup {
        textobjects = {
          swap = {
            enable = true,
            swap_next = {
              ['<leader>nn'] = '@parameter.inner',
            },
            swap_previous = {
              ['<leader>np'] = '@parameter.inner',
            },
          },
        },
      }
    end,
  },
}
