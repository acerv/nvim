return {
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = {
      { 'mason-org/mason.nvim' },
    },
    config = function()
      require('mason').setup {}
      require('mason-tool-installer').setup {
        ensure_installed = {
          'jq',
          'ruff',
          'gopls',
          'shfmt',
          'stylua',
          'clangd',
          'pyrefly',
          'marksman',
          'json-lsp',
          'codespell',
          'markdownlint',
          'perlnavigator',
          -- 'rust-analyzer',
          'lua-language-server',
          'bash-language-server',
          'yaml-language-server',
          'dockerfile-language-server',
        },
      }
    end,
  },
}
