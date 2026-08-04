local spec = {
  -- source
  "onsails/lspkind.nvim",
  commit = "c7274c48137396526b59d86232eabcdc7fed8a32",
  -- sbom
  license = {
    file = "LICENSE",
    spdx = "MIT",
  },
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
