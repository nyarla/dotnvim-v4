vim.cmd.lang("en_US.UTF-8")
vim.o.background = "dark"

require("config.filetypes").setup()
require("config.options").setup()
require("config.plugins").setup()
require("config.keymap").setup()
require("config.theme").setup()
