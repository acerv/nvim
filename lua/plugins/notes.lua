return {
  {
    'jakewvincent/mkdnflow.nvim',
    event = 'VeryLazy',
    config = function()
      require('mkdnflow').setup {
        links = {
          transform_explicit = function(text)
            if text:match '%d%d%d%d%-%d%d%-%d%d' then
              return ('journals/' .. text)
            else
              return text:gsub(' ', '_')
            end
          end,
        },
      }
    end,
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'markdown' },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'echasnovski/mini.icons',
    },
    opts = {
      completions = { lsp = { enabled = true } },
    },
  },
}
