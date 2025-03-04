local spec = {
  -- source
  "ray-x/cmp-treesitter",
  commit = "958fcfa0d8ce46d215e19cc3992c542f576c4123",
  -- sbom
  license = {
    file = "LICENSE",
    spdx = "GPL-3.0-or-later",
  },
  -- config
  dependencies = {
    "nvim-treesitter",
  },
  -- loading
  lazy = true,
}

return spec
