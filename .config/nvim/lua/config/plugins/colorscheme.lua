return {
  { "folke/tokyonight.nvim" },
  { "Shatur/neovim-ayu" },
  { "catppuccin/nvim" },

  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000, -- load early
    lazy = false, -- ensures it loads on startup
    config = function()
      vim.cmd.colorscheme("gruvbox")
    end,
  },
}
