local spec = {
  -- source
  "hrsh7th/cmp-nvim-lsp",
  commit = "99290b3ec1322070bcfb9e846450a46f6efa50f0",
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
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    for server, options in pairs(opts) do
      options.capabilities = capabilities
      lspconfig[server].setup(options)
    end
  end,
  -- loading
  lazy = true,
}

return spec
