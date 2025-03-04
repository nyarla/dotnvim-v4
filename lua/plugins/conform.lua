local findexe = require("lib.path").findexe

local extensions = {}
local formatters = {}

---@param name string the name of format settings
---@param fmt table<string> the command list to use formatting
---@param ext table<string> the extensions list to apply formatting
local function enable(name, fmt, ext)
  for _, exe in ipairs(fmt) do
    if not findexe({ exe }) then
      return
    end
  end

  for _, ex in ipairs(ext) do
    table.insert(extensions, ex)
  end

  formatters[name] = fmt
end

local config = {
  -- web
  { "css", { "prettier" }, { "*.css" } },
  { "html", { "prettier" }, { "*.html" } },
  { "scss", { "prettier" }, { "*.scss" } },

  -- markdown
  { "markdown", { "prettier" }, { "*.md" } },

  -- js/ts
  { "javascript", { "biome" }, { "*.cjs", "*.js", "*.mjs" } },
  { "javascriptreact", { "biome" }, { "*.jsx" } },
  { "typescript", { "biome" }, { "*.ts" } },
  { "typescriptreact", { "biome" }, { "*.tsx" } },

  -- json, yaml, toml or nix
  { "json", { "prettier" }, { "*.json" } },
  { "yaml", { "prettier" }, { "*.yaml" } },
  { "toml", { "talpo" }, { "*.toml" } },
  { "nix", { "nixfmt" }, { "*.nix" } },

  -- lang
  { "perl", { "perltidy" }, { "*.pl", "*.pm", "*.t" } },
  { "lua", { "stylua" }, { "*.lua" } },
  { "go", { "goimports", "gofmt" }, { "*.go" } },

  -- sql
  { "sql", { "sqlfluff" }, { "*.sql" } },
}

for _, cfg in ipairs(config) do
  enable(cfg[1], cfg[2], cfg[3])
end

local function format(args)
  require("conform").format({ bufnr = args.buf, timeout_ms = 10000 })
end

local function clean(args)
  local range = nil
  if args.count ~= -1 then
    local eol = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, eol:len() },
    }
  end
  require("conform").format({ async = true, lsp_fallback = true, range = range })
end

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = extensions,
  callback = format,
})

vim.api.nvim_create_user_command("Conform", clean, { range = true })

local spec = {
  "stevearc/conform.nvim",
  commit = "a6f5bdb78caa305496357d17e962bbc4c0b392e2", -- v9.0.0
  -- sbom
  license = {
    file = "LICENSE",
    spdx = "MIT",
  },
  opts = {
    formatters_by_ft = formatters,
    formatters = {
      biome = {
        args = {
          "format",
          "--indent-style",
          "space",
          "--line-ending",
          "lf",
          "--stdin-file-path",
          "$FILENAME",
        },
      },
    },
  },
  lazy = false,
}

return spec
