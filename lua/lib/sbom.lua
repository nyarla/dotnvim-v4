-- Usage
-- -----
-- Open new buffer, and :lua require('lib.sbom') on ~/.config/nvim repository

-- TODO: autoload from `plugins` directory
local plugins = {
  "cmp-buffer",
  "cmp-cmdline",
  "cmp-nvim-lsp",
  "cmp-path",
  "cmp-treesitter",
  "cmp-vsnip",
  "conform",
  "heirline",
  "lspkind",
  "neo-tree",
  "nui",
  "nvim-cmp",
  "nvim-lint",
  "nvim-lspconfig",
  "nvim-web-devicons",
  "nvim-window-picker",
  "perl",
  "plenary",
  "treesitter",
  "vim-vsnip",
}

-- make markdown list.
local markdownList = {}

for _, plugin in ipairs(plugins) do
  local lazySpec = require("plugins." .. plugin)
  local repository = lazySpec[1]
  local revision = lazySpec.commit
  local sbom = lazySpec.license

  -- TODO: support to another git hosting platfroms.
  local github = "https://github.com/" .. repository .. "/"
  local licenseUrl = github .. "blob/" .. revision .. "/" .. sbom.file

  local listItem = "- [" .. plugin .. "](" .. github .. ") - [" .. sbom.spdx .. "](" .. licenseUrl .. ")"
  table.insert(markdownList, listItem)
end

-- print markdown to buffer
vim.api.nvim_buf_set_lines(0, 0, #markdownList, false, markdownList)
