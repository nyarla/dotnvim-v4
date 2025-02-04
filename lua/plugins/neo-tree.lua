local spec = {
  -- source
  "nvim-neo-tree/neo-tree.nvim",
  commit = "5d172e8315444dbc32867d1c7b04d8e7e68ec4e1",
  -- config
  dependencies = {
    "plenary.nvim",
    "nui.nvim",
    "nvim-web-devicons",
    "nvim-window-picker",
  },
  -- loading
  opts = {
    close_if_last_window = false,
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,
    open_files_do_not_replace_types = {
      "terminal",
    },
    default_component_configs = {
      indent = {
        with_expanders = true,
      },
    },
    source_selector = {
      winbar = true,
      sources = {
        { source = "filesystem", display_name = "" },
        { source = "buffers", display_name = "󰂮" },
        { source = "git_status", display_name = "" },
      },
      content_layout = "center",
    },

    window = {
      width = 30,

      mappings = {
        ["<2-LeftMouse>"] = function(state, callback)
          local cc = require("neo-tree.sources.common.commands")
          if vim.fn.winnr("$") == 1 then
            cc.open(state, callback)
          else
            cc.open_with_window_picker(state, callback)
          end
        end,
      },
    },
    filesystem = {
      follow_current_file = { enabled = true },
      hijack_netrw_behavior = "open_current",
      use_libuv_file_watcher = true,
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
      },

      window = {
        mappings = {
          ["<2-LeftMouse>"] = function(state, callback)
            local fs = require("neo-tree.sources.filesystem.commands")
            if vim.fn.winnr("$") == 1 then
              fs.open(state, callback)
            else
              fs.open_with_window_picker(state, callback)
            end
          end,
        },
      },
    },
  },
}

return spec
