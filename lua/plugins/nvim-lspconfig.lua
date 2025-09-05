local spec = {
  -- source
  "neovim/nvim-lspconfig",
  commit = "3db16ceeea947517f0dc1404c24dcb5ab0c91d26", -- v2.4.0
  -- sbom
  license = {
    file = "LICENSE.md",
    spdx = "Apache-2.0",
  },
  -- loading
  lazy = true,
}

return spec
