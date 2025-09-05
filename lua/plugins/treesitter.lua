local spec = {
  -- source
  "nvim-treesitter/nvim-treesitter",
  commit = "42fc28ba918343ebfd5565147a42a26580579482",
  build = ":TSUpdate",
  -- sbom
  license = {
    file = "LICENSE",
    spdx = "Apache-2.0",
  },
  -- config
  main = "nvim-treesitter.configs",
  opts = {
    ensure_install = "all",
    sync_install = false,
    ignore_install = {
      "perl",
    },
    highlight = {
      enable = true,
      disable = { "perl" },
    },
  },
}

return spec
