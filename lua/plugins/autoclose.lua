return {
  'saghen/blink.pairs',
  version = '*',
  dependencies = 'saghen/blink.lib',
  event = 'VeryLazy',
  build = function()
    require('blink.pairs').download():pwait(60000)
  end,
  opts = {},
}
