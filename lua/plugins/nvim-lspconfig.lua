local spec = {
  -- source
  "neovim/nvim-lspconfig",
  commit = "b89138d9af0a96e6048e202a15765fc6b6416bd4", -- v2.11.0
  -- sbom
  license = {
    file = "LICENSE.md",
    spdx = "Apache-2.0",
  },
  -- loading
  lazy = true,
}

return spec
