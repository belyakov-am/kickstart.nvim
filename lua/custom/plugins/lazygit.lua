return {
  'kdheepak/lazygit.nvim',
  -- optional for floating window border decoration
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('lazy').setup {
      'kdheepak/lazygit.nvim',
      -- optional for floating window border decoration
      dependencies = {
        'nvim-lua/plenary.nvim',
      },
    }

    vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>', {})
  end,
}
