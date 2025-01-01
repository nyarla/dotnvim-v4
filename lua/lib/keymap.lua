local M = {}

---@param key string the key sequence of keymap as nnoremap
---@param action string the assign nvim commands to keymap nnoremap
function M.nnoremap(key, action)
  vim.api.nvim_set_keymap("n", key, action, { noremap = true, silent = true })
end
---@param key string the key sequence of keymap as  vnoremap
---@param action string the assign nvim commands to keymap as vnoremap
function M.vnoremap(key, action)
  vim.api.nvim_set_keymap("v", key, action, { noremap = true, silent = true })
end

return M
