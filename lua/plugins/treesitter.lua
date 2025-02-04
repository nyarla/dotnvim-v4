local spec = {
  -- source
  "nvim-treesitter/nvim-treesitter",
  commit = "4e701776f8824fc188a6254f57d080971ce28c92",
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
