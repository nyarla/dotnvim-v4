local M = {}

function M.setup()
  vim.filetype.add({
    pattern = {
      [".*/.github/workflows/.*%.yml"] = "yaml.ghaction",
    },
  })
end

return M
