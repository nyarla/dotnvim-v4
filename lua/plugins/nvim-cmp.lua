local spec = {
  -- source
  "hrsh7th/nvim-cmp",
  commit = "b555203ce4bd7ff6192e759af3362f9d217e8c89",
  -- config
  dependencies = {
    -- library
    "lspkind.nvim",

    -- completor
    "cmp-buffer",
    "cmp-cmdline",
    "cmp-nvim-lsp",
    "cmp-path",
    "cmp-treesitter",
    "cmp-vsnip",
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
      mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
      }),
    })
    cmp.setup.cmdline({ ":" }, {
      sources = {
        { name = "cmdline" },
        { name = "path" },
      },
      mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
      }),
    })

    -- common
    cmp.setup({
      -- completion
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "treesitter" },
        { name = "buffer" },
        { name = "codeium" },
        { name = "vsnip" },
        { name = "path" },
      }),

      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymouse"](args.body)
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
