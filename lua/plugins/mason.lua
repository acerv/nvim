return {
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    lazy = false,
    dependencies = {
      { 'mason-org/mason.nvim' },
    },
    config = function()
      require('mason').setup {}
      require('mason-tool-installer').setup {
        auto_update = false,
        run_on_start = false,
        ensure_installed = {
          'jq',
          'ruff',
          -- 'gopls',
          'shfmt',
          'stylua',
          'clangd',
          'pyrefly',
          'prettier',
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
