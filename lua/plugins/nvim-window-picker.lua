local spec = {
  -- source
  "s1n7ax/nvim-window-picker",
  commit = "6382540b2ae5de6c793d4aa2e3fe6dbb518505ec", -- v2.4.0
  -- sbom
  license = {
    file = "LICENSE",
    spdx = "MIT",
  },
  -- config
  opts = {
    hint = "floating-big-letter",
    picker_config = {
      handle_mouse_click = true,
    },
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
