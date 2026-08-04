local spec = {
  -- source
  "hrsh7th/cmp-nvim-lsp",
  commit = "cbc7b02bb99fae35cb42f514762b89b5126651ef",
  -- sbom
  license = {
    file = "LICENSE",
    spdx = "MIT",
  },
  -- config
  dependencies = {
    "nvim-lspconfig",
  },

  opts = {
    bashls = {},
    gopls = {},
    jsonls = {},
    lua_ls = {},
    nixd = {},
    perlnavigator = {
      settings = {
        perlnavigator = {
          perlPath = "perl",
          enableWarnings = true,
          perlcriticEnabled = false,
        },
      },
    },
    sqls = {},
    tailwindcss = {},
    taplo = {},
    ts_ls = {},
  },

  config = function(_, opts)
    vim.lsp.config("*", {
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
    })
  end,
  -- loading
  lazy = true,
}

return spec
