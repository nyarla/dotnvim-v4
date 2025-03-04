local theme = require("lib.theme")

local spec = {
  "rebelot/heirline.nvim",
  commit = "af3f441ea10f96105e1af14cd37bf213533812d2",
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
