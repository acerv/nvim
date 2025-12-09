return {
  {
    'stevearc/conform.nvim',
    event = 'VeryLazy',
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        local disable_filetypes = {
          c = true,
          h = true,
          cpp = true,
          hpp = true,
        }
        local lsp_format_opt

        if disable_filetypes[vim.bo[bufnr].filetype] then
          lsp_format_opt = 'never'
        else
          lsp_format_opt = 'fallback'
        end

        return {
          timeout_ms = 500,
          lsp_format = lsp_format_opt,
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'ruff_organize_imports', 'ruff_format' },
        bash = { 'shfmt' },
        json = { 'jd' },
        markdown = { 'prettier' },
      },
    },
    config = function(_, opts)
      vim.api.nvim_create_user_command('ToggleFormat', function(args)
        if args.bang then
          -- FormatDisable! will disable formatting just for this buffer
          vim.b.disable_autoformat = not vim.b.disable_autoformat
        else
          vim.g.disable_autoformat = not vim.g.disable_autoformat
        end
      end, {
        desc = 'Disable autoformat-on-save',
        bang = true,
      })

      vim.keymap.set('n', '<leader>uf', '<cmd>ToggleFormat<CR>', { desc = 'Toggle Code Formatting' })

      require('conform').setup(opts)
    end,
  },
}
