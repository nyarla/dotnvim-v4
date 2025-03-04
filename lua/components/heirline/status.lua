local M = {}

local theme = require("lib.theme")
local palette = vim.o.background == "light" and theme.light or theme.dark

local detect_os = require("lib.os").detect_os
local is_file = require("lib.buffer").is_file
local is_special = require("lib.buffer").is_special
local is_inactive = require("lib.buffer").is_inactive

local has_diagnostics = require("heirline.conditions").has_diagnostics
local iconinfo = require("nvim-web-devicons").get_icon_color

M.symbols = {
  os = {
    nixos = "  ",
    macos = "  ",
    windows = "  ",
    linux = "  ",
    unsupported = "  ",
  },
  buffer = {
    ["neo-tree"] = "  ",
    ["terminal"] = "  ",
  },
  diagnostic = {
    error = "  ",
    warn = "  ",
    info = "  ",
    hints = "  ",
  },
}

M.editMode = {
  provider = function(self)
    return self.symbol
  end,
  init = function(self)
    self.mode = vim.fn.mode(1)
    self.symbol = M.symbols.os[detect_os()]
  end,
  condition = is_file,
  static = {
    modes = {
      n = "blue",
      no = "highlight_black",
      nov = "highlight_black",
      ["no"] = "highlight_black",
      --
      v = "green",
      V = "green",
      Vs = "green",
      [""] = "green",
      ["s"] = "green",
      --
      s = "green",
      S = "green",
      [""] = "green",
      --
      i = "yellow",
      ic = "yellow",
      ix = "yellow",
      --
      R = "red",
      Rc = "red",
      Rvc = "red",
      Rvx = "red",
      Rx = "red",
      --
      c = "magenta",
      cv = "magenta",
      --
      r = "green",
      rm = "green",
      ["r?"] = "green",
      ["!"] = "green",
      --
      t = "cyan",
    },
  },
  hl = function(self)
    local bg = palette[self.modes[self.mode]]
    local fg = palette["black"]

    return { bg = bg, fg = fg }
  end,
}

M.fileBuf = {
  init = function(self)
    local icon, color = iconinfo(vim.fn.bufname(), vim.bo.filetype)
    if icon ~= nil and color ~= nil then
      self.symbol = " " .. icon .. " "
      self.color = color
    else
      self.symbol = " 󰈤 "
      self.color = "white"
    end
  end,
  condition = is_file,
  provider = function(self)
    return self.symbol
  end,
  hl = function(self)
    return { fg = self.color, bg = palette.background }
  end,
}

M.specialBuf = {
  static = {
    palette = {
      ["neo-tree"] = "yellow",
      ["terminal"] = "blue",
    },
  },
  init = function(self)
    local ft = vim.bo.filetype
    local bt = vim.bo.buftype

    if ft ~= "" then
      local symbol = M.symbols.buffer[ft]
      self.symbol = symbol and symbol or ""
      self.color = self.palette[ft]
      return
    end

    if bt ~= "" then
      local symbol = M.symbols.buffer[bt]
      self.symbol = symbol and symbol or ""
      self.color = self.palette[bt]
      return
    end

    self.symbol = ""
    self.color = "background"
  end,
  condition = is_special,
  provider = function(self)
    return self.symbol
  end,
  hl = function(self)
    return { fg = palette[self.color], bg = palette.background }
  end,
}

M.filename = {
  provider = function()
    if is_file() then
      local fp = vim.fn.expand("%:~:.")
      local cwd = vim.fn.getcwd()
      local fn = (fp:sub(0, #cwd) == cwd) and fp:sub(#cwd + 1) or fp .. " "

      return fn
    end

    if vim.bo.filetype == "neo-tree" then
      return "neo-tree"
    end

    if vim.bo.buftype == "terminal" then
      return "terminal"
    end

    return ""
  end,
  hl = { fg = palette.foreground, bg = palette.background },
}

M.fileState = {
  condition = function()
    return is_file() and vim.bo.readonly
  end,
  provider = " 󱀰 ",
  hl = { fg = palette.yellow, bg = palette.background },
}

M.fileModified = {
  condition = function()
    return is_file() and vim.bo.modified
  end,
  provider = "",
  hl = { fg = palette.foreground, bg = palette.background },
}

M.padding = {
  provider = "%=",
  hl = { fg = palette.background, bg = palette.background },
}

M.sep = {
  provider = " / ",
  condition = is_file,
  hl = { fg = palette.highlight_black, bg = palette.background },
}

M.diagnostics = {
  condition = has_diagnostics,
  static = {
    diagnostic = function(self, level)
      return self.diag[level] > 0 and (M.symbols.diagnostic[level] .. self.diag[level] .. " ")
    end,
  },
  init = function(self)
    self.diag = {
      error = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR }),
      warn = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN }),
      hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT }),
      info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO }),
    }
  end,
  update = { "DiagnosticChanged", "BufEnter" },
  {
    provider = function(self)
      return self.diagnostic(self, "error")
    end,
    hl = { fg = palette.red, bg = palette.background },
  },
  {
    provider = function(self)
      return self.diagnostic(self, "warn")
    end,
    hl = { fg = palette.yellow, bg = palette.background },
  },
  {
    provider = function(self)
      return self.diagnostic(self, "hints")
    end,
    hl = { fg = palette.cyan, bg = palette.background },
  },
  {
    provider = function(self)
      return self.diagnostic(self, "info")
    end,
    hl = { fg = palette.blue, bg = palette.background },
  },
}

M.ruler = {
  provider = "%l/%L",
  condition = is_file,
  hl = { fg = palette.foreground, bg = palette.background },
}

M.crlf = {
  condition = is_file,
  provider = function()
    if vim.bo.fileformat == "unix" then
      return ""
    elseif vim.bo.fileformat == "mac" then
      return ""
    elseif vim.bo.fileformat == "dos" then
      return ""
    end
  end,
  hl = { fg = palette.highlight_yellow, bg = palette.background },
}

M.active = {
  M.editMode,
  M.fileBuf,
  M.specialBuf,
  M.fileState,
  M.filename,
  M.fileModified,
  M.padding,
  M.diagnostics,
  M.sep,
  M.ruler,
  M.sep,
  M.crlf,
}

M.inactive = {
  condition = is_inactive,
  provider = function(_)
    return string.rep("-", tonumber(vim.api.nvim_win_get_width(0)))
  end,
  hl = function()
    return { fg = palette.foreground, bg = palette.background }
  end,
}

return M
