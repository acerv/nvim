return {
  'akinsho/bufferline.nvim',
  event = 'VeryLazy',
  keys = {
    { '<leader>bP', '<Cmd>BufferLineTogglePin<CR>', desc = 'Toggle Pin' },
    { '<leader>bD', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Delete Non-Pinned Buffers' },
    { '<leader>br', '<Cmd>BufferLineCloseRight<CR>', desc = 'Delete Buffers to the Right' },
    { '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', desc = 'Delete Buffers to the Left' },
    { '<leader>ba', '<Cmd>BufferLineCloseOthers<CR>', desc = 'Close Other Buffers' },
    { '<leader>bb', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
    { '<leader>bn', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
    { '<leader>bB', '<cmd>BufferLineMovePrev<cr>', desc = 'Move to Prev Buffer' },
    { '<leader>bN', '<cmd>BufferLineMoveNext<cr>', desc = 'Move to Next Buffer' },
    { '<leader>bc', '<cmd>BufferLineClose<cr>', desc = 'Delete Buffer' },
    { '<leader>bA', '<cmd>BufferLineCloseAll<cr>', desc = 'Delete All Buffers' },
  },
  opts = {
    options = {
      -- stylua: ignore
      close_command = function(n) Snacks.bufdelete(n) end,
      -- stylua: ignore
      right_mouse_command = function(n) Snacks.bufdelete(n) end,
      diagnostics = 'nvim_lsp',
      always_show_bufferline = false,
      offsets = {
        {
          filetype = 'NvimTree',
          text = 'NvimTree',
          highlight = 'Directory',
          text_align = 'left',
        },
        {
          filetype = 'snacks_layout_box',
        },
      },
    },
  },
  config = function(_, opts)
    vim.api.nvim_create_user_command('BufferLineClose', function()
      Snacks.bufdelete()
    end, {
      desc = 'Delete Buffer',
    })
    vim.api.nvim_create_user_command('BufferLineCloseAll', function()
      Snacks.bufdelete.all()
    end, {
      desc = 'Delete All Buffers',
    })

    require('bufferline').setup(opts)
  end,
}
