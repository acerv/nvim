return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    bufdelete = { enabled = true },
    dashboard = {
      enabled = true,
      preset = {
        header = table.concat({
          '┏┓╻┏━╸┏━┓╻ ╻╻┏┳┓',
          '┃┗┫┣╸ ┃ ┃┃┏┛┃┃┃┃',
          '╹ ╹┗━╸┗━┛┗┛ ╹╹ ╹',
        }, '\n'),
        keys = {
          {
            key = 'e',
            icon = '',
            desc = 'New file',
            action = '<CMD>:ene <BAR> startinsert <CR>',
          },
          {
            key = 'l',
            icon = '󰘁',
            desc = 'Open last session',
            action = [[<CMD>:lua require('resession').load('last') <CR>]],
          },
          {
            key = 'f',
            icon = '',
            desc = 'Show sessions',
            action = [[<CMD>:lua require('resession').load() <CR>]],
          },
          {
            key = 'c',
            icon = '',
            desc = 'Configuration',
            action = '<CMD>:cd ~/.config/nvim | edit ~/.config/nvim<CR>',
          },
          {
            key = 'L',
            icon = '󰒲',
            desc = 'Lazy',
            action = '<CMD>:Lazy<CR>',
          },
          {
            key = 'M',
            icon = '󱉙',
            desc = 'Mason',
            action = '<CMD>:Mason<CR>',
          },
          {
            key = 'q',
            icon = '󰈆',
            desc = 'Quit',
            action = '<CMD>:qa<CR>',
          },
        },
      },
    },
    explorer = {
      enabled = true,
      replace_netrw = true,
    },
    indent = {
      enabled = true,
      animate = { enabled = false },
      scope = { enabled = true, cursor = false },
    },
    input = { enabled = true },
    lazygit = { enabled = true },
    picker = {
      enabled = true,
      sources = {
        explorer = {
          layout = {
            layout = {
              width = 40,
            },
          },
        },
      },
    },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    terminal = { enabled = true },
    words = { enabled = true },
    zen = { enabled = true },
  },
  keys = {
    -- Top Pickers & Explorer
    {
      '<leader><space>',
      function()
        Snacks.picker.smart()
      end,
      desc = 'Smart Find Files',
    },
    {
      '<leader>,',
      function()
        Snacks.picker.buffers()
      end,
      desc = 'Buffers',
    },
    {
      '<leader>w',
      function()
        Snacks.picker.grep_word()
      end,
      desc = 'Visual selection or word',
      mode = { 'n', 'x' },
    },
    {
      '<leader>/',
      function()
        Snacks.picker.grep()
      end,
      desc = 'Grep',
    },
    {
      '<leader>:',
      function()
        Snacks.picker.command_history()
      end,
      desc = 'Command History',
    },
    {
      '<leader>n',
      function()
        Snacks.picker.notifications()
      end,
      desc = 'Notification History',
    },
    {
      '<leader>e',
      function()
        Snacks.explorer()
      end,
      desc = 'Open File Tree',
    },
    -- buffers
    { '<leader>bc', function() Snacks.bufdelete() end, desc = 'Close Buffer' },
    { '<leader>ba', function() Snacks.bufdelete.other() end, desc = 'Close Other Buffers' },
    { '<leader>bA', function() Snacks.bufdelete.all() end, desc = 'Close All Buffers' },
    { '<leader>bn', '<cmd>bnext<cr>', desc = 'Next Buffer' },
    { '<leader>bb', '<cmd>bprev<cr>', desc = 'Prev Buffer' },
    -- find
    {
      '<leader>fc',
      function()
        Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = 'Find Config File',
    },
    {
      '<leader>ff',
      function()
        Snacks.picker.files()
      end,
      desc = 'Find Files',
    },
    {
      '<leader>fg',
      function()
        Snacks.picker.git_files()
      end,
      desc = 'Find Git Files',
    },
    {
      '<leader>fp',
      function()
        Snacks.picker.projects()
      end,
      desc = 'Projects',
    },
    {
      '<leader>fr',
      function()
        Snacks.picker.recent()
      end,
      desc = 'Recent',
    },
    -- git
    {
      '<leader>gb',
      function()
        Snacks.picker.git_branches()
      end,
      desc = 'Git Branches',
    },
    {
      '<leader>gl',
      function()
        Snacks.picker.git_log()
      end,
      desc = 'Git Log',
    },
    {
      '<leader>gL',
      function()
        Snacks.picker.git_log_line()
      end,
      desc = 'Git Log Line',
    },
    {
      '<leader>gs',
      function()
        Snacks.picker.git_status()
      end,
      desc = 'Git Status',
    },
    {
      '<leader>gS',
      function()
        Snacks.picker.git_stash()
      end,
      desc = 'Git Stash',
    },
    {
      '<leader>gd',
      function()
        Snacks.picker.git_diff()
      end,
      desc = 'Git Diff (Hunks)',
    },
    {
      '<leader>gf',
      function()
        Snacks.picker.git_log_file()
      end,
      desc = 'Git Log File',
    },
    -- Grep
    {
      '<leader>sb',
      function()
        Snacks.picker.lines()
      end,
      desc = 'Buffer Lines',
    },
    {
      '<leader>sB',
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = 'Grep Open Buffers',
    },
    -- search
    {
      '<leader>s"',
      function()
        Snacks.picker.registers()
      end,
      desc = 'Registers',
    },
    {
      '<leader>s/',
      function()
        Snacks.picker.search_history()
      end,
      desc = 'Search History',
    },
    {
      '<leader>sa',
      function()
        Snacks.picker.autocmds()
      end,
      desc = 'Autocmds',
    },
    {
      '<leader>sc',
      function()
        Snacks.picker.command_history()
      end,
      desc = 'Command History',
    },
    {
      '<leader>sC',
      function()
        Snacks.picker.commands()
      end,
      desc = 'Commands',
    },
    {
      '<leader>sd',
      function()
        Snacks.picker.diagnostics()
      end,
      desc = 'Diagnostics',
    },
    {
      '<leader>sD',
      function()
        Snacks.picker.diagnostics_buffer()
      end,
      desc = 'Buffer Diagnostics',
    },
    {
      '<leader>sh',
      function()
        Snacks.picker.help()
      end,
      desc = 'Help Pages',
    },
    {
      '<leader>sH',
      function()
        Snacks.picker.highlights()
      end,
      desc = 'Highlights',
    },
    {
      '<leader>si',
      function()
        Snacks.picker.icons()
      end,
      desc = 'Icons',
    },
    {
      '<leader>sj',
      function()
        Snacks.picker.jumps()
      end,
      desc = 'Jumps',
    },
    {
      '<leader>sk',
      function()
        Snacks.picker.keymaps()
      end,
      desc = 'Keymaps',
    },
    {
      '<leader>sl',
      function()
        Snacks.picker.loclist()
      end,
      desc = 'Location List',
    },
    {
      '<leader>sm',
      function()
        Snacks.picker.marks()
      end,
      desc = 'Marks',
    },
    {
      '<leader>sM',
      function()
        Snacks.picker.man()
      end,
      desc = 'Man Pages',
    },
    {
      '<leader>sp',
      function()
        Snacks.picker.lazy()
      end,
      desc = 'Search for Plugin Spec',
    },
    {
      '<leader>sq',
      function()
        Snacks.picker.qflist()
      end,
      desc = 'Quickfix List',
    },
    {
      '<leader>sr',
      function()
        Snacks.picker.resume()
      end,
      desc = 'Resume',
    },
    {
      '<leader>su',
      function()
        Snacks.picker.undo()
      end,
      desc = 'Undo History',
    },
    {
      '<leader>uC',
      function()
        Snacks.picker.colorschemes()
      end,
      desc = 'Colorschemes',
    },
    -- Zen mode
    {
      '<leader>z',
      function()
        Snacks.zen()
      end,
      desc = 'Zen mode',
    },
    -- Terminal
    {
      '<A-3>',
      function()
        Snacks.terminal.toggle('/usr/bin/fish', {
          cwd = vim.fn.getcwd(),
        })
      end,
      desc = 'Toggle terminal',
    },
    -- Lazygit
    {
      '<leader>G',
      function()
        Snacks.lazygit()
      end,
      desc = 'Lazygit',
    },
  },
  init = function()
    vim.keymap.set('t', '<A-3>', '<cmd>close<cr>', { desc = 'Hide Terminal' })
  end,
}
