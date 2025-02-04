local lib = require("lib.options")
local opt = lib.opt

local M = {}

function M.setup()
  -- make global options
  local options = {
    -- encoding
    encoding = "utf-8",
    fileencoding = "utf-8",
    -- ui
    ambiwidth = "single",
    cursorline = true,
    number = true,
    scl = "yes",
    termguicolors = true,
    showtabline = 2,
    -- cache and backup
    backupdir = vim.fn.stdpath("cache") .. "/backup",
    directory = vim.fn.stdpath("cache") .. "/swap",
    -- edit
    clipboard = "unnamed,unnamedplus",
    mouse = "a",
    -- editor
    autoindent = true,
    backspace = "indent,eol,start",
    expandtab = true,
    shiftwidth = 2,
    softtabstop = 2,
    tabstop = 4,
    updatetime = 500,
  }

  -- set global options
  for key, value in pairs(options) do
    opt(key, value)
  end

  -- set wcwidth
  vim.fn.setcellwidths(require("lib.wcwidth"))

  -- set diagnostic config
  vim.api.nvim_create_autocmd({ "CursorHold" }, {
    pattern = "*",
    callback = function()
      vim.diagnostic.open_float()
    end,
  })

  vim.diagnostic.config({
    float = {
      scope = "line",
      border = "rounded",
    },
  })
end

return M
