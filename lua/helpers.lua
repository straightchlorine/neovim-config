local fn = vim.fn

local helpers = {}

function helpers.executable(name)
  if fn.executable(name) > 0 then
    return true
  end
  return false
end

return helpers
