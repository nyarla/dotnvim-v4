local theme = require("lib.theme")

local spec = {
  "rebelot/heirline.nvim",
  commit = "fae936abb5e0345b85c3a03ecf38525b0828b992",
  -- sbom
  license = {
    file = "LICENSE",
    spdx = "MIT",
  },
  -- loading
  lazy = false,
  dependencies = {
    "nvim-web-devicons",
  },

  config = function(_, _)
    local status = require("components.heirline.status")
    local tabline = require("components.heirline.tabline")

    require("heirline").setup({
      statusline = {
        status.active,
        status.inactive,
      },
      tabline = {
        tabline.tabs,
        tabline.padding,
      },
    })

    return true
  end,
}

return spec
