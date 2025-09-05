local spec = {
  -- source
  "mfussenegger/nvim-lint",
  commit = "f126af5345c7472e9a0cdbe1d1a29209be72c4c4",
  -- sbom
  license = {
    file = "LICENSE.txt",
    spdx = "GPL-3.0-or-later",
  },
  -- config
  opts = {
    linters_by_ft = {
      dockerfile = { "hadolint" },
      markdown = { "textlint" },
      nix = { "statix", "deadnix" },
      ["yaml.ghaction"] = { "actionlint" },
    },
    linters = {
      textlint = require("components.nvim-lint.textlint"),
    },
  },
  config = function(_, opts)
    local lint = require("lint")

    lint.linters_by_ft = opts.linters_by_ft

    for name, linter in pairs(opts.linters) do
      lint.linters[name] = linter
    end

    vim.api.nvim_create_autocmd({ "InsertEnter", "BufWritePost", "TextChanged" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })

    return true
  end,
}

return spec
