return {
  {
    'supermaven-inc/supermaven-nvim',
    config = function()
      require('supermaven-nvim').setup {
        keymaps = {
          accept_suggestion = '<M-l>',
          clear_suggestion = '<M-]>',
          accept_word = '<M-j>',
        },
      }
    end,

    vim.keymap.set('n', '<leader>mt', ':SupermavenToggle<CR>', { desc = '[M]aven [T]oggle' }),
    vim.keymap.set('n', '<leader>ms', ':SupermavenStatus<CR>', { desc = '[M]aven [S]tatus' }),
  },
}
