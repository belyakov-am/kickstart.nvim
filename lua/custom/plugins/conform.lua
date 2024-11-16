return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local conform = require 'conform'

    conform.setup {
      formatters_by_ft = {
        lua = { 'stylua' },
        rust = { 'rustfmt' },
        go = { 'gofumpt' },
        python = { 'ruff_format', 'ruff_fix', 'ruff_organize_imports' },

        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        typescript = { 'prettierd', 'prettier', stop_after_first = true },
        javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
        typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
        svelte = { 'prettierd', 'prettier', stop_after_first = true },
        css = { 'prettierd', 'prettier', stop_after_first = true },
        html = { 'prettierd', 'prettier', stop_after_first = true },
        json = { 'prettierd', 'prettier', stop_after_first = true },
        yaml = { 'prettierd', 'prettier', stop_after_first = true },
        markdown = { 'prettierd', 'prettier', stop_after_first = true },
        graphql = { 'prettierd', 'prettier', stop_after_first = true },
      },

      format_on_save = {
        lsp_format = 'fallback',
        timeout_ms = 500,
      },
      notify_on_error = true,
      notify_no_formatters = true,
    }

    vim.keymap.set('n', '<leader>cf', function()
      conform.format {
        lsp_format = 'fallback',
        async = false,
        timeout_ms = 500,
      }
    end, { desc = 'Format current buffer with conform' })
  end,
}
