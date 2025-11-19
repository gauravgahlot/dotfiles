require("config.core")
require("config.lazy")
require("config.lsp")

-- auto initialize the floating terminal
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("FloatermNew --name=myfloat --height=0.95 --width=0.90 --autoclose=2 zsh")
		vim.cmd("FloatermHide")
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
	end,
})

