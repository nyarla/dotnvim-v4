local spec = {
  -- source
  "nvim-treesitter/nvim-treesitter",
  commit = "cfc6f2c117aaaa82f19bcce44deec2c194d900ab", -- v0.9.3
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
