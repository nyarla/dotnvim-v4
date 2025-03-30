local spec = {
  -- source
  "hrsh7th/nvim-cmp",
  commit = "c27370703e798666486e3064b64d59eaf4bdc6d5", -- 2025-03-01
  -- sbom
  license = {
    file = "LICENSE",
    spdx = "MIT",
  },
  -- config
  dependencies = {
    -- library
    "lspkind.nvim",
    "vim-vsnip",

    -- completor
    "cmp-buffer",
    "cmp-cmdline",
    "cmp-nvim-lsp",
    "cmp-path",
    "cmp-treesitter",
    "cmp-vsnip",
    "minuet-ai.nvim",
  },
  config = function(plugin, opts)
    local cmp = require("cmp")
    local lspkind = require("lspkind")

    -- modeline
    cmp.setup.cmdline({ "/", "?" }, {
      sources = {
        { name = "treesitter" },
        { name = "buffer" },
      },
      mapping = cmp.mapping.preset.cmdline({
        ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
      }),
    })
    cmp.setup.cmdline({ ":" }, {
      sources = {
        { name = "cmdline" },
        { name = "path" },
      },
      mapping = cmp.mapping.preset.cmdline({
        ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
      }),
    })

    -- common
    cmp.setup({
      -- completion
      sources = cmp.config.sources({
        { name = "minuet" },
        { name = "nvim_lsp" },
        { name = "treesitter" },
        { name = "buffer" },
        { name = "vsnip" },
        { name = "path" },
      }),

      performance = {
        fethcing_timeout = 2000,
      },

      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end,
      },

      -- keymap
      mapping = cmp.mapping.preset.insert({
        ["<Up>"] = cmp.mapping.select_prev_item({
          behavior = cmp.SelectBehavior.Insert,
        }),
        ["<Down>"] = cmp.mapping.select_next_item({
          behavior = cmp.SelectBehavior.Insert,
        }),
        ["<Left>"] = cmp.mapping.close(),
        ["<Right>"] = cmp.mapping.close(),
        ["<Tab>"] = cmp.mapping.select_next_item({
          behavior = cmp.SelectBehavior.Insert,
        }),
        ["<S-Tab>"] = cmp.mapping.select_prev_item({
          behavior = cmp.SelectBehavior.Insert,
        }),
        ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
        ["<C-Enter>"] = require("minuet").make_cmp_map(),
      }),

      -- interface
      formatting = {
        fields = { "abbr", "menu", "kind" },
        format = lspkind.cmp_format({
          mode = "symbol_text",
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },

      window = {
        completion = cmp.config.window.bordered({ scrollbar = false }),
        documentation = cmp.config.window.bordered({ scrollbar = false }),
      },
    })

    return true
  end,
}

return spec
