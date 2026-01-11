vim.g.mapleader = " "

vim.opt.termguicolors = true

require("core.options")
require("core.lazy")
require("core.keymaps")
require("core.notes").setup()
