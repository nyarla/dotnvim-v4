local spec = {
  -- source
  "s1n7ax/nvim-window-picker",
  commit = "0dfef64eaf063e1cd27983ab11a30e7bc5b74fac",
  -- config
  opts = {
    hint = "floating-big-letter",
    selection_chars = "ABCDEFGHIJKLMN",
    show_prompt = false,
    filter_rules = {
      autoselect_one = true,
      include_current_win = true,
      bo = {
        filetype = { "neo-tree", "notify" },
        buftype = { "terminal", "quickfix" },
      },
    },
  },
  -- loading
  lazy = true,
}

return spec
