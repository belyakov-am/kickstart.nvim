return {
  'nvim-telescope/telescope-file-browser.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },

  config = function()
    local actions = require 'telescope.actions'

    local fb_utils = require 'telescope._extensions.file_browser.utils'
    local fb_actions = require('telescope').extensions.file_browser.actions
    local action_state = require 'telescope.actions.state'
    local Path = require 'plenary.path'

    local function current_bufr_dir(prompt_bufnr)
      local current_picker = action_state.get_current_picker(prompt_bufnr)
      local finder = current_picker.finder
      local bufr_path = Path:new(vim.fn.expand '#:p')

      finder.path = bufr_path:parent():absolute()
      fb_utils.redraw_border_title(current_picker)
      fb_utils.selection_callback(current_picker, bufr_path:absolute())
      current_picker:refresh(finder, {
        new_prefix = fb_utils.relative_path_prefix(finder),
        reset_prompt = true,
        multi = current_picker._multi,
      })
    end

    -- TODO(belyakov_am): open FB in current buffer dir
    require('telescope').setup {
      extensions = {
        file_browser = {
          grouped = true,
          sorting_strategy = 'ascending',

          hidden = true,
          respect_gitignore = false,
          theme = 'ivy',
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = false,
          mappings = {
            ['i'] = {
              -- your custom insert mode mappings

              -- Remap change cwd and disable default
              ['<C-p>'] = fb_actions.change_cwd,
              ['<C-t>'] = actions.select_tab,
            },
            ['n'] = {
              -- your custom normal mode mappings
              ['bw'] = current_bufr_dir,

              -- Remap change cwd and disable default
              ['p'] = fb_actions.change_cwd,
              ['t'] = false,
            },
          },
        },
      },
    }

    require('telescope').load_extension 'file_browser'
  end,
}
