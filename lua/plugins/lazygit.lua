return {
  'kdheepak/lazygit.nvim',
  event = 'VeryLazy',
  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentFile',
    'LazyGitFilter',
    'LazyGitFilterCurrentFile',
  },
  -- optional for floating window border decoration
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = {
    { '<leader>G', '<cmd>LazyGit<cr>', desc = 'Lazy Git' },
  },
}
