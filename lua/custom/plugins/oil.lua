return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function()
    require('oil').setup {
      keymaps = {
        ['g?'] = 'actions.show_help',
        ['<CR>'] = 'actions.select',

        ['<C-v>'] = 'actions.select_vsplit',
        ['<C-x>'] = 'actions.select_split',

        ['<C-t>'] = 'actions.select_tab',
        ['<C-c>'] = 'actions.close',
        ['<C-r>'] = 'actions.refresh',

        ['<C-p>'] = 'actions.preview',
        ['<C-d>'] = 'actions.preview_scroll_down',
        ['<C-u>'] = 'actions.preview_scroll_up',

        ['-'] = 'actions.parent',
        ['_'] = 'actions.open_cwd',
        ['`'] = 'actions.cd',
        ['~'] = 'actions.tcd',
        ['gs'] = 'actions.change_sort',
        ['gx'] = 'actions.open_external',
        ['g.'] = 'actions.toggle_hidden',
        ['g\\'] = 'actions.toggle_trash',
      },
      use_default_keymaps = true,
      view_options = {
        show_hidden = true,
        is_hidden_file = function(name, _)
          return vim.startswith(name, '.')
        end,
        is_always_hidden = function(name, _)
          return name == '..' or name == '.git'
        end,
        natural_order = false,
      },
    }

    -- Custom
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
  end,
}
