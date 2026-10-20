return {
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    cmd = {
      'Mason',
      'MasonInstall',
      'MasonUninstall',
      'MasonUninstallAll',
      'MasonLog',
      'MasonUpdate',
      'MasonToolsInstall',
      'MasonToolsInstallSync',
      'MasonToolsUpdate',
      'MasonToolsUpdateSync',
      'MasonToolsClean',
    },
    dependencies = {
      { 'mason-org/mason.nvim' },
    },
    init = function()
      local mason_bin = vim.fn.stdpath 'data' .. '/mason/bin'
      if not vim.env.PATH:find(mason_bin, 1, true) then
        vim.env.PATH = mason_bin .. ':' .. vim.env.PATH
      end
    end,
    config = function()
      require('mason').setup { PATH = 'skip' }
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
