local spec = {
  -- source
  "gpanders/editorconfig.nvim",
  commit = "5b9e303e1d6f7abfe616ce4cc8d3fffc554790bf",
  -- sbom
  license = {
    file = "LICENSE",
    spdx = "GPL-3.0-or-later",
  },
  -- loading
  event = { "BufEnter" },
}

return spec
