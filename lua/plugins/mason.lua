return {
  {
    'williamboman/mason.nvim',
    event = 'VeryLazy',
    tag = 'stable',
    config = function()
      require('mason').setup()

      local registry = require 'mason-registry'

      -- These are package names sourced from the Mason registry,
      -- and may not necessarily match the server names used in lspconfig
      local ensure_installed = {
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
        'rust-analyzer',
        'lua-language-server',
        'bash-language-server',
        'yaml-language-server',
        'dockerfile-language-server',
      }

      -- Ensure packages are installed and up to date
      registry.refresh(function()
        for _, name in pairs(ensure_installed) do
          local package = registry.get_package(name)
          if not registry.is_installed(name) then
            package:install()
          end
        end
      end)
    end,
  },
}
