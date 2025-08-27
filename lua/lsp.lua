vim.g.lsp_servers = {
  ['clangd'] = {
    -- configuration based on kernel development
    -- https://github.com/x56Jason/nvim/tree/master
    cmd = {
      'clangd',
      '--header-insertion=never',
      '-j',
      string.gsub(vim.fn.system 'nproc', '\n', ''),
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
  ['python-lsp-server'] = {
    cmd = { 'pylsp' },
    root_markers = {
      'pyproject.toml',
      'setup.py',
      'setup.cfg',
      'requirements.txt',
      '.git',
    },
    single_file_support = true,
    filetypes = { 'python' },
    settings = {
      pylsp = {
        plugins = {
          ruff = { enabled = true },
        },
      },
    },
  },
  ['rust-analyzer'] = {
    cmd = { 'rust-analyzer' },
    root_markers = {
      'rust-project.json',
      'Cargo.toml',
      '.git',
    },
    filetypes = {
      'rust',
    },
    capabilities = {
      experimental = {
        serverStatusNotification = true,
      },
    },
    checkOnSave = {
      command = 'clippy',
    },
  },
  ['lua-language-server'] = {
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
        diagnostics = { globals = { 'vim' } },
        completion = {
          callSnippet = 'Replace',
        },
      },
    },
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
    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
      local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
        end,
      })
    end

    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
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
