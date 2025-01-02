local spec = {
  -- source
  "Exafunction/codeium.nvim",
  commit = "27d2b1ce8c7ba14dbf6e4504bdea8e5548be5476",
  -- config
  dependencies = {
    "plenary.nvim",
    "nvim-cmp",
  },
  opts = {},
  -- loading
  enabled = function()
    local hostname = vim.system({ "hostname" }):wait().stdout
    if hostname == "nixos\n" then
      return true
    end

    return false
  end,
}

return spec
