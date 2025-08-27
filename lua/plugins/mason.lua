return {
  { 'williamboman/mason.nvim', tag = 'stable', lazy = false },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    config = function()
      require('mason').setup()

      local ensure_installed = vim.tbl_keys(vim.g.lsp_servers or {})
      vim.list_extend(ensure_installed, {
        'codespell',
        'jq',
        'ruff',
        'markdownlint',
        'shfmt',
        'stylua',
      })

      require('mason-tool-installer').setup {
        ensure_installed = ensure_installed,
      }
    end,
  },
}
