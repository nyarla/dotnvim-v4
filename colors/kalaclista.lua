local theme = require("lib.theme")
local T = vim.o.background == "light" and theme.light or theme.dark

---@param idx number the index number of terminal colorscheme
---@param code string the hex color code
local function term(idx, code)
  vim.g["terminal_color_" .. idx] = code
end

---@param name string the name of highlight group
---@param fg? string the hex color code of object foreground
---@param bg? string the hex color code of object background
---@param opts? table the options for nvim highlight
local function hi(name, fg, bg, opts)
  opts = opts or {}
  opts.force = true
  opts.cterm = opts.cterm or {}

  if fg ~= nil then
    opts.fg = fg
  end

  if bg ~= nil then
    opts.bg = bg
  end

  vim.api.nvim_set_hl(0, name, opts)
end

---@param name string the name of highlight group
---@param link string the highlight name of link to name
local function ln(name, link)
  vim.api.nvim_set_hl(0, name, { ["link"] = link })
end

-- Terminal
-- ========
--

term(0, T.black)
term(8, T.highlight_black)

term(1, T.red)
term(9, T.highlight_red)

term(2, T.green)
term(10, T.highlight_green)

term(3, T.yellow)
term(11, T.highlight_yellow)

term(4, T.blue)
term(12, T.highlight_blue)

term(5, T.magenta)
term(13, T.highlight_magenta)

term(6, T.cyan)
term(14, T.highlight_cyan)

term(7, T.white)
term(15, T.highlight_white)

-- Common
-- ======
--

-- Text
-- ----
hi("Normal", T.foreground, T.background)
hi("Bold", nil, nil, { bold = true })
hi("Underline", nil, nil, { bold = true })
hi("SpecialKey", T.highlight_cyan, nil, { bold = true })

hi("NonText", T.highlight_background)
hi("EndOfBuffer", T.highlight_background)

-- Markup
-- ------
hi("Title", T.foreground, nil, { bold = true })
hi("Comment", T.dim_foreground)

-- Code
-- ----
hi("Character", T.highlight_cyan, nil, { bold = true })
hi("String", T.highlight_yellow, nil, { bold = true })
hi("Boolean", T.emphasis_green, nil, { bold = true })
hi("Number", T.highlight_yellow, nil, { bold = true })
ln("Float", "Number")

hi("Identifier", T.highlight_foreground, nil, { bold = true })
hi("Constant", T.highlight_magenta, nil, { bold = true })
hi("Type", T.emphasis_green, nil, { bold = true })

hi("Function", T.emphasis_blue, nil, { bold = true })

hi("Statement", T.emphasis_green)
hi("Operator", T.highlight_foreground, nil, { bold = true })

hi("PreProc", T.highlight_magenta)
hi("Tag", T.green)
hi("Special", T.emphasis_foreground)
hi("Ignore", T.dim_white)
hi("Todo", T.black, T.highlight_yellow, { bold = true })

-- Languages
-- =========

-- lua
-- ---
hi("@keyword.function.lua", T.emphasis_blue, nil, { bold = true })

-- Interface
-- =========
--

-- Editor
-- ------
hi("Cursor", nil, nil, { reverse = true })
hi("CursorLine", nil, T.emphasis_background)

hi("Visual", nil, nil, { reverse = true })

hi("LineNr", T.dim_foreground)
hi("CursorLineNr", T.highlight_white, nil, { bold = true })

hi("SignColumn", nil, T.background)

hi("Search", nil, nil, { bold = true, underline = true })
hi("IncSearch", nil, nil, { bold = true, underline = true })

hi("MoreMsg", T.emphasis_green)
hi("ModeMsg", T.emphasis_green)
hi("Question", T.highlight_yellow)
hi("MatchPattern", T.emphasis_red)
hi("ErrorMsg", T.black, T.highlight_red)
hi("WarningsMsg", T.black, T.highlight_yellow)

-- Popup
-- -----
hi("Pmenu", T.foreground, T.background)
hi("PmemuSel", T.background, T.emphasis_blue)
hi("PmenuSbar", T.emphasis_white)
hi("PmemuThumb", nil, nil, { bold = true })

hi("DiagnosticWarn", T.emphasis_orange)
hi("DiagnosticError", T.emphasis_red)
hi("DiagnosticHint", T.emphasis_cyan)
hi("DiagnosticInfo", T.emphasis_blue)

-- File manager
--
hi("Directory", T.highlight_yellow)

hi("NeoTreeFloatBorder", T.foreground)
hi("NeoTreeDirectoryIcon", T.emphasis_orange, nil, { bold = true })
hi("NeoTreeDirectoryName", T.foreground)
hi("NeoTreeGitModified", T.emphasis_green, nil, { bold = true })
hi("NeoTreeGitConflicted", T.emphasis_red)
hi("NeoTreeGitUntracked", T.emphasis_orange, nil, { italic = true })

hi("NeoTreeTabActive", T.highlight_foreground)
hi("NeoTreeTabInactive", T.dim_foreground)

-- Auto-complete
--
hi("CmpItemAbbrMatchFuzzy", T.background, T.dim_blue)
hi("CmpItemAbbrMatch", T.background, T.dim_blue)

ln("CmpItemKindClass", "Identifier")
ln("CmpItemKindColor", "CmpItemKind")
ln("CmpItemKindConstant", "Constant")
ln("CmpItemKindConstructor", "Function")
hi("CmpItemKindCopilot", T.highlight_foreground)
ln("CmpItemKindEnum", "Identifier")
ln("CmpItemKindEnumMember", "Type")
ln("CmpItemKindEvent", "Statement")
ln("CmpItemKindField", "Type")
ln("CmpItemKindFile", "Directory")
ln("CmpItemKindFolder", "Directory")
ln("CmpItemKindFunction", "Function")
ln("CmpItemKindInterface", "Identifier")
ln("CmpItemKindKeyword", "Identifier")
ln("CmpItemKindMethod", "Function")
ln("CmpItemKindModule", "Identifier")
ln("CmpItemKindOperator", "Operator")
ln("CmpItemKindProperty", "Type")
ln("CmpItemKindReference", "Identifier")
ln("CmpItemKindSnippet", "Special")
ln("CmpItemKindStruct", "Constant")
hi("CmpItemKindText", T.emphasis_blue)
ln("CmpItemKindTypeParameter", "Identifier")
ln("CmpItemKindUnit", "Type")
ln("CmpItemKindValue", "Identifier")
ln("CmpItemKindVariable", "Identifier")
