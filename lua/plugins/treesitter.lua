local spec = {
  -- source
  "nvim-treesitter/nvim-treesitter",
  commit = "7b6cc8949f9999c5ed91436cbe24aa5f99c42025",
  -- sbom
  license = {
    file = "LICENSE",
    spdx = "Apache-2.0",
  },
  -- config
  main = "nvim-treesitter.config",
  opts = {
    ensure_install = "all",
    sync_install = false,
    highlight = {
      enable = true,
    },
  },
}

return spec
