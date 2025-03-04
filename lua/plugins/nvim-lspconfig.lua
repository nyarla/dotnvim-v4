local spec = {
  -- source
  "neovim/nvim-lspconfig",
  commit = "6b63bdf2399b9bedf93297d98419550523a9ad68", -- v1.7.0
  -- sbom
  license = {
    file = "LICENSE.md",
    spdx = "Apacle-2.0",
  },
  -- loading
  lazy = true,
}

return spec
