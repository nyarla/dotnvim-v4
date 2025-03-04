local spec = {
  -- source
  "nvim-treesitter/nvim-treesitter",
  commit = "1adcd5711929e44d1bc9e59fbf7d94656cf6d389",
  build = ":TSUpdate",
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
