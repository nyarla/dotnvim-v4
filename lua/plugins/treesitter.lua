local spec = {
  -- source
  "nvim-treesitter/nvim-treesitter",
  commit = "6e42d823ce0a5a76180c473c119c7677738a09d1",
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
