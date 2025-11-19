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
require("gauravgahlot.plugins.lsp.null-ls")
require("gauravgahlot.plugins.lsp.mason")
require("gauravgahlot.plugins.lsp.lspconfig")

-- set the colorscheme (must be set at last)
require("gauravgahlot.core.colorscheme")

-- auto initialize the floating terminal
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("FloatermNew --name=myfloat --height=0.95 --width=0.90 --autoclose=2 zsh")
    vim.cmd("FloatermHide")
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
  end,
})
