return {
  {
    'jakewvincent/mkdnflow.nvim',
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
  -- {
  --   'MeanderingProgrammer/render-markdown.nvim',
  --   -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
  --   -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
  --   dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  --   ---@module 'render-markdown'
  --   ---@type render.md.UserConfig
  --   opts = {},
  -- },
}
