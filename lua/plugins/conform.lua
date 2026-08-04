local spec = {
  "stevearc/conform.nvim",
  commit = "619363c30309d29ffa631e67c8183f2a72caa373",
  -- sbom
  license = {
    file = "LICENSE",
    spdx = "MIT",
  },

  opts = {
    formatters_by_ft = {
      -- CSS or SCSS
      css = { "oxfmt" },
      scss = { "oxfmt" },

      -- Go
      go = { "goimports", "gofumpt" },

      -- HTML
      html = { "oxfmt" },

      -- JavaScript or TypeScript
      javascript = { "oxfmt" },
      javascriptreact = { "oxfmt" },
      typescript = { "oxfmt" },
      typescriptreact = { "oxfmt" },

      -- JSON
      json = { "oxfmt" },
      json5 = { "oxfmt" },
      jsonc = { "oxfmt" },

      -- Lua
      lua = { "stylua" },

      -- Markdown
      markdown = { "oxfmt" },

      -- Nix
      nix = { "nixfmt" },

      -- Perl
      perl = { "perltidy" },

      -- SQL
      sql = { "sqlfluff" },

      -- TOML
      toml = { "taplo" },

      -- YAML
      yaml = { "oxfmt" },
    },
  },

  init = function()
    local function format(args)
      require("conform").format({ bufnr = args.buf, timeout_ms = 10000 })
    end

    local function beatify(args)
      local range = nil
      if args.count ~= -1 then
        local eol = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = { start = { args.line1, 0 }, ["end"] = { args.line2, eol:len() } }
      end

      require("conform").format({ async = true, lsp_format = "fallback", range = range })
    end

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = {
        "*.css",
        "*.scss",
        ".go",

        "*.html",

        "*.js",
        "*.jsx",
        "*.ts",
        "*.tsx",

        "*.json",
        "*.jsonc",
        "*.json5",

        "*.md",

        "*.lua",

        "*.nix",

        "*.pl",
        "*.pm",
        "*.t",

        "*.sql",

        "*.toml",

        "*.yaml",
        "*.yml",
      },
      callback = format,
    })

    vim.api.nvim_create_user_command("Fmt", beatify, { range = true })
  end,

  lazy = false,
}

return spec
