local spec = {
  -- source
  "milanglacier/minuet-ai.nvim",
  commit = "b5a366a5c3d46b60eb780c9cd86cf62eb0a13891",
  -- sbom
  license = {
    file = "LICENSE",
    spdx = "GPL-3.0-or-later",
  },
  -- config
  dependencies = {
    "plenary.nvim",
  },
  --
  main = "minuet",
  opts = {
    auto_trigger_ft = {
      "lua",
      "nix",
      "perl",
      "typescript",
    },
    show_on_completion_menu = true,

    provider = "gemini",
    provider_options = {
      gemini = {
        model = "gemini-2.0-flash",
        stream = true,
        api_key = "GEMINI_API_KEY",
      },
    },
  },
}

return spec
