local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

return {
  'nvimtools/none-ls.nvim',
  requires = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  config = function()
    local null_ls = require 'null-ls'

    null_ls.setup {
      sources = {
        -- Turned off for now. Suggests simple words without any context.
        -- null_ls.builtins.completion.spell,

        -- null_ls.builtins.diagnostics.eslint_d,
        --
        -- null_ls.builtins.code_actions.eslint_d,

        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.stylua,

        -- Python
        -- TODO(belyakov_am): do not remove unused vars on save
        -- null_ls.builtins.diagnostics.ruff,
        -- null_ls.builtins.formatting.ruff,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,

        -- Go
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports_reviser,
        null_ls.builtins.formatting.golines.with {
          extra_args = { '--max-len', '120' },
        },

        -- Rust
        -- null_ls.builtins.formatting.rustfmt,
      },

      on_attach = function(client, bufnr)
        if client.supports_method 'textDocument/formatting' then
          vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
              require('custom.lsp').format { async = false }
            end,
          })
        end
      end,
    }
  end,
}
