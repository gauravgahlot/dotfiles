return {
  -- "folke/tokyonight.nvim",
	-- "patstockwell/vim-monokai-tasty",
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    vim.cmd("colorscheme gruvbox")
  end,
}
