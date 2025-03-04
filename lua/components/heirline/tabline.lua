local theme = require("lib.theme")
local palette = vim.o.background == "light" and theme.light or theme.dark

local lib = require("heirline.utils")
local icons = require("nvim-web-devicons")

local M = {}

M.bufIcon = {
  init = function(self)
    local fn = self.filename
    local ex = vim.fn.fnamemodify(fn, ":e")

    self.icon, self.color = icons.get_icon_color(fn, ex, { default = true })
  end,
  provider = function(self)
    return self.icon and (self.icon .. " ")
  end,
  hl = function(self)
    return { fg = self.color }
  end,
}

M.bufFile = {
  provider = function(self)
    local fn = self.filename
    fn = fn == "" and "(scratch)" or vim.fn.fnamemodify(fn, ":t")
    return fn .. " "
  end,
  hl = function(self)
    return { bold = self.is_active or self.is_visible }
  end,
}

M.bufModded = {
  condition = function(self)
    return vim.api.nvim_get_option_value("modified", { buf = self.bufnr })
  end,
  provider = " ",
}

M.bufRO = {
  condition = function(self)
    return vim.api.nvim_get_option_value("readonly", { buf = self.bufnr })
  end,
  provider = " ",
  hl = function()
    return { fg = palette.yellow }
  end,
}

M.bufClose = {
  condition = function(self)
    return not vim.api.nvim_get_option_value("modified", { buf = self.bufnr })
  end,
  {
    provider = "󰅗",
    hl = { fg = palette.red },
    on_click = {
      name = "heirline_tabline_close_buffer_callback",
      minwid = function(self)
        return self.bufnr
      end,
      callback = function(_, minwid)
        vim.schedule(function()
          vim.api.nvim_buf_delete(minwid, { force = false })
          vim.cmd.redrawtabline()
        end)
      end,
    },
  },
  { provider = " " },
}

M.bufTab = {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(self.bufnr)
  end,
  hl = function(self)
    return { fg = palette.foreground, bg = palette.background }
  end,
  on_click = {
    name = "heirline_tabline_buffer_callback",
    minwid = function(self)
      return self.bufnr
    end,
    callback = function(_, minwid, _, button)
      if button == "r" then
        vim.schedule(function()
          vim.api.nvim_buf_delete(minwid, { force = false })
        end)
      else
        vim.api.nvim_win_set_buf(0, minwid)
      end
    end,
  },
  M.bufIcon,
  M.bufFile,
  M.bufModded,
  M.bufRO,
  M.bufClose,
}

M.bufTabs = lib.surround({ "╭ ", "╮" }, function(self)
  return self.is_active and palette.highlight_yellow or palette.dim_foreground
end, { M.bufTab })

M.tabs = lib.make_buflist(
  M.bufTabs,
  { provider = "", hl = { fg = palette.foreground } },
  { provider = "", hl = { fg = palette.foreground } }
)

M.padding = {
  provider = "%=",
  hl = function()
    return { fg = palette.background, bg = palette.background }
  end,
}

return M
