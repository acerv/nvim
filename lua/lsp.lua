vim.g.lsp_servers = {
  ['clangd'] = {
    -- configuration based on kernel development
    -- https://github.com/x56Jason/nvim/tree/master
    cmd = {
      'clangd',
      '--header-insertion=never',
      '-j',
      tostring((vim.uv or vim.loop).available_parallelism()),
      '--completion-style=detailed',
      '--function-arg-placeholders',
      '--rename-file-limit=0',
      '--background-index',
      '--background-index-priority=normal',
    },
    root_markers = {
      'compile_flags.txt',
      '.git',
    },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
  },
  ['yaml-language-server'] = {},
  ['bash-language-server'] = {
    cmd = { 'bash-language-server', 'start' },
    filetypes = { 'bash', 'sh' },
  },
  ['json-lsp'] = {},
  ['perlnavigator'] = {},
  ['pyrefly'] = {
    cmd = { 'pyrefly', 'lsp' },
    filetypes = { 'python' },
    root_markers = {
      'pyrefly.toml',
      'pyproject.toml',
      'setup.py',
      'setup.cfg',
      'requirements.txt',
      '.git',
    },
  },
  ['ruff'] = {
    cmd = { 'ruff', 'server' },
    filetypes = { 'python' },
    root_markers = {
      'pyproject.toml',
      'setup.py',
      'setup.cfg',
      'requirements.txt',
      '.git',
    },
  },
  ['rust-analyzer'] = {
    cmd = { 'rust-analyzer' },
    root_markers = {
      'rust-project.json',
      'Cargo.toml',
      '.git',
    },
    filetypes = { 'rust' },
    settings = {
      ['rust-analyzer'] = {
        cargo = {
          allFeatures = true,
        },
        checkOnSave = {
          command = 'clippy',
        },
        cachePriming = {
          enable = false,
        },
      },
    },
  },
  ['lua_ls'] = {
    cmd = { 'lua-language-server' },
    root_markers = {
      '.luarc.json',
      '.luarc.jsonc',
      '.luacheckrc',
      '.stylua.toml',
      'stylua.toml',
      'selene.toml',
      'selene.yml',
      '.git',
    },
    filetypes = { 'lua' },
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
      },
    },
  },
  ['marksman'] = {
    cmd = { 'marksman', 'server' },
    filetypes = { 'markdown' },
  },
}

for name, setup in pairs(vim.g.lsp_servers) do
  vim.lsp.config[name] = setup
  vim.lsp.enable(name)
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    map('gd', vim.lsp.buf.definition, 'Goto Definition')
    map('gr', vim.lsp.buf.references, 'Goto References')
    map('gI', vim.lsp.buf.implementation, 'Goto Implementation')
    map('gt', vim.lsp.buf.type_definition, 'Goto to Definition Type')
    map('gD', vim.lsp.buf.declaration, 'Goto Declaration')
    map('<leader>ls', vim.lsp.buf.document_symbol, 'Document Symbols')
    map('<leader>ln', vim.lsp.buf.rename, 'Rename variable')
    map('<leader>la', vim.lsp.buf.code_action, 'Code Action', { 'n', 'x' })

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
      map('<leader>lh', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
      end, 'Toggle Inlay Hints')
    end

    map('<leader>lx', function()
      vim.diagnostic.config {
        virtual_lines = not vim.diagnostic.config().virtual_lines,
      }
    end, 'Toggle Diagnostic Text')
  end,
})
