local spec = {
  -- source
  "onsails/lspkind.nvim",
  commit = "d79a1c3299ad0ef94e255d045bed9fa26025dab6",
  -- config
  opts = {
    symbol_map = {
      Codeium = "",
      Copilot = "",
      Error = "",
      String = "",
      TabNine = "",
    },
  },
  config = function(_, opts)
    require("lspkind").init(opts)
  end,
  -- loading
  lazy = true,
}

return spec
