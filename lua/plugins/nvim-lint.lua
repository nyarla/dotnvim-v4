local spec = {
  -- source
  "mfussenegger/nvim-lint",
  commit = "789b7ada1b4f00e08d026dffde410dcfa6a0ba87",
  -- config
  opts = {
    linters_by_ft = {
      dockerfile = { "hadolint" },
      markdown = { "textlint" },
      nix = { "statix", "deadnix" },
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
