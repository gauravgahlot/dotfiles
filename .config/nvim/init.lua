-- must load the plugins first
require("gauravgahlot.plugins")

-- import the base configuration files
require("gauravgahlot.core.keymaps")
require("gauravgahlot.core.options")
require("gauravgahlot.plugins.comment")
require("gauravgahlot.plugins.nvim-tree")
require("gauravgahlot.plugins.lualine")
require("gauravgahlot.plugins.telescope")
require("gauravgahlot.plugins.nvim-cmp")
require("gauravgahlot.plugins.lsp.mason")
require("gauravgahlot.plugins.lsp.lspconfig")
require("gauravgahlot.plugins.lsp.null-ls")

-- set the colorscheme (must be set at last)
require("gauravgahlot.core.colorscheme")
