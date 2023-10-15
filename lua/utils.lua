local M = {}

function M.filterLspBufItems(arr, fn)
  if type(arr) ~= 'table' then
    return arr
  end

  local filtered = {}
  for k, v in pairs(arr) do
    if fn(v, k, arr) then
      table.insert(filtered, v)
    end
  end

  return filtered
end

function M.isZodTypeInfer(value)
  if not value.text then
    return false
  end

  local pattern = 'z.infer<typeof'
  local pos = value.text:find(pattern)
  return pos ~= nil
end

return M
