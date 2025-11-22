return {
  -- "folke/tokyonight.nvim",
  -- "patstockwell/vim-monokai-tasty",
  "Shatur/neovim-ayu",
  -- "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    vim.cmd("colorscheme ayu-mirage")
  end,
}
