local M = {}

---@return boolean return the buffer is special buffer
function M.is_special()
  if vim.bo.filetype == "neo-tree" then
    return true
  end

  if vim.bo.buftype == "terminal" then
    return true
  end

  return false
end

---@return boolean return the buffer is opened file
function M.is_file()
  return not M.is_special()
end

---@return boolean return the buffer is active
function M.is_active()
  return tonumber(vim.g.actual_curwin) == vim.api.nvim_get_current_win()
end

---@return boolean return the buffer is inactive
function M.is_inactive()
  return not M.is_active()
end

return M
