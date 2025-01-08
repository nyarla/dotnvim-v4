local spec = {
  -- source
  "s1n7ax/nvim-window-picker",
  commit = "41cfaa428577c53552200a404ae9b3a0b5719706",
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
