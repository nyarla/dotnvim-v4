local lib = require("lib.keymap")
local nnoremap = lib.nnoremap
local vnoremap = lib.vnoremap

local M = {}

function M.setup()
  -- sort to selected region
  vnoremap("zs", ":sort<CR>")
  vnoremap("zS", ":sort!<CR>")
end

return M
