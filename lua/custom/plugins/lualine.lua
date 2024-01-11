-- TODO(belyakov_am): refactor somehow, bc if active it seems like this function is called on every keypress
local function git_rev_list()
  local result = vim.fn.system 'git rev-list --count --left-right HEAD...@{upstream}'

  -- Split the result into ahead and behind counts
  local ahead, behind = result:match '(%d+)%s+(%d+)'

  -- Add symbols to the numbers
  if ahead and tonumber(ahead) > 0 then
    ahead = ahead .. '⇡'
  else
    ahead = ''
  end

  if behind and tonumber(behind) > 0 then
    behind = behind .. '⇣'
  else
    behind = ''
  end

  return ahead .. ' ' .. behind
end

return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  opts = {
    options = {
      icons_enabled = false,
      theme = 'nightfly',
      component_separators = '|',
      section_separators = '',
    },
    sections = {
      lualine_a = { 'mode', 'location' },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = {
        {
          'filename',
          path = 1,
        },
      },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
  },
}
