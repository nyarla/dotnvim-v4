local theme = require("lib.theme")

---@param name string The name of color code
---@param light number The index of color code for light theme
---@param dark number The index of color code for dark theme
---@return string The color code by hex string
local hex = function(name, light, dark)
  return vim.o.background == "light" and theme[name .. light] or theme[name .. dark]
end

---@param rule string The highlight rule for NeoVim
---@param opts table The arguments of vim.api.nvim_set_hl
local hi = function(rule, opts)
  opts.force = true
  opts.cterm = opts.cterm or {}

  vim.api.nvim_set_hl(0, rule, opts)
end

-- Terminal

-- black
vim.g.terminal_color_0 = hex("gray", 0, 0)
vim.g.terminal_color_8 = hex("gray", 20, 40)

-- red
vim.g.terminal_color_1 = hex("red", 40, 65)
vim.g.terminal_color_9 = hex("red", 60, 90)

-- green
vim.g.terminal_color_2 = hex("green", 40, 80)
vim.g.terminal_color_10 = hex("green", 60, 90)

-- yellow
vim.g.terminal_color_3 = hex("yellow", 50, 80)
vim.g.terminal_color_11 = hex("yellow", 60, 90)

-- blue
vim.g.terminal_color_4 = hex("blue", 40, 80)
vim.g.terminal_color_12 = hex("blue", 60, 95)

-- magenta
vim.g.terminal_color_5 = hex("pink", 40, 70)
vim.g.terminal_color_13 = hex("pink", 60, 90)

-- cyan
vim.g.terminal_color_6 = hex("cyan", 40, 85)
vim.g.terminal_color_14 = hex("cyan", 60, 90)

-- white
vim.g.terminal_color_7 = hex("gray", 65, 100)
vim.g.terminal_color_15 = hex("gray", 85, 100)

-- Highligtt
local highlights = {
  -- Common
  ["Normal"] = { fg = hex("gray", 15, 85), bg = hex("gray", 90, 0) },
  ["Bold"] = { bold = true },
  ["Underline"] = { underline = true },
  ["Directory"] = { fg = hex("cyan", 35, 90), bold = true },
  ["NonText"] = { fg = hex("gray", 50, 50), bold = true },
  ["SpecialKey"] = { fg = hex("gray", 90, 15), bg = hex("cyan", 50, 80), bold = true },
  ["EndOfBuffer"] = { fg = hex("gray", 50, 50) },
  -- text
  ["Title"] = { fg = hex("gray", 0, 100) },
  ["Comment"] = { fg = hex("gray", 60, 80) },
  -- literal
  ["String"] = { fg = hex("yellow", 50, 95) },
  ["Character"] = { fg = hex("cyan", 50, 95) },
  ["Boolean"] = { fg = hex("green", 50, 85), bold = true },
  ["Number"] = { fg = hex("orange", 50, 95) },
  ["Float"] = { fg = hex("rime", 50, 80) },
  -- variable
  ["Identifier"] = { fg = hex("gray", 15, 90), bold = true },
  ["Constant"] = { fg = hex("blue", 15, 90), bold = true },
  ["Type"] = { fg = hex("green", 50, 80), bold = true },
  -- function
  ["Function"] = { fg = hex("blue", 40, 80), bold = true },
  -- operator
  ["Statement"] = { fg = hex("green", 40, 80), bold = true },
  ["Operator"] = { bold = true },
  -- others
  ["PreProc"] = { fg = hex("pink", 30, 90) },
  ["Tag"] = { fg = hex("green", 40, 80) },
  ["Special"] = { fg = hex("gray", 40, 80) },
  ["Ignore"] = { fg = hex("gray", 50, 50) },
  ["Todo"] = { fg = hex("gray", 15, 15), bg = hex("yellow", 85, 85) },
  -- Interface
  -- cursor
  ["Cursor"] = { reverse = true },
  ["Visual"] = { fg = hex("gray", 15, 15), bg = hex("blue", 90, 90) },
  ["CursorLine"] = { bg = hex("gray", 95, 20) },
  -- line number
  ["LineNr"] = { fg = hex("gray", 50, 50) },
  ["CursorLineNr"] = { fg = hex("gray", 0, 100) },
  -- search
  ["Search"] = { bold = true, underline = true },
  ["IncSearch"] = { bold = true, underline = true },
  -- popup
  ["Pmenu"] = { fg = hex("gray", 0, 100), bg = hex("gray", 100, 0) },
  ["PmenuSel"] = { fg = hex("gray", 100, 0), bg = hex("blue", 20, 80) },
  ["PmenuSbar"] = { fg = hex("gray", 30, 70), bg = hex("gray", 100, 0) },
  ["PmenuThumb"] = { bold = true },
  -- Plugin
  -- ------
  -- neo-tree
  ["NeoTreeDirectoryIcon"] = { fg = hex("yellow", 20, 80) },
  ["NeoTreeTabActive"] = { fg = hex("gray", 0, 100), bg = hex("green", 30, 80) },
  ["NeoTreeTabInactive"] = { fg = hex("gray", 0, 70), bg = hex("gray", 100, 0) },
}
for rule, opts in pairs(highlights) do
  hi(rule, opts)
end
