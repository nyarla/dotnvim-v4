local lib = require("lib.keymap")
local nnoremap = lib.nnoremap
local vnoremap = lib.vnoremap

local M = {}

function M.setup()
  -- sort to selected region
  vnoremap("zs", ":sort<CR>")
  vnoremap("zS", ":sort!<CR>")

  -- open file manager by neotree
  nnoremap("<C-n>", ":Neotree toggle<CR>")
end

return M
