local M = {}

---@param key string the key of optiont to `vim.opt`
---@param value any the value of options to `vim.opt`
function M.opt(key, value)
  vim.opt[key] = value
end

return M
