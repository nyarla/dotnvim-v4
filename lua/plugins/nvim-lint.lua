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

    for key, value in pairs(opts) do
      lint[key] = value
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
