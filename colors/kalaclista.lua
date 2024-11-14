local theme = require("lib.theme")

---@param name string The name of color code
---@param light number The index of color code for light theme
---@param dark number The index of color code for dark theme
---@return string The color code by hex string
local hex = function(name, light, dark)
  return vim.o.background == "light" and theme[name .. light] or theme[name .. dark]
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
