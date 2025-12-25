local spec = {
  -- source
  "neovim/nvim-lspconfig",
  commit = "5bfcc89fd155b4ffc02d18ab3b7d19c2d4e246a7", -- v2.5.0
  -- sbom
  license = {
    file = "LICENSE.md",
    spdx = "Apache-2.0",
  },
  -- loading
  lazy = true,
}

return spec
