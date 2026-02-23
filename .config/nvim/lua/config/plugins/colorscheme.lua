return {
  { "folke/tokyonight.nvim" },
  { "ellisonleao/gruvbox.nvim" },
  { "catppuccin/nvim" },

  {
    "Shatur/neovim-ayu",
    priority = 1000, -- load early
    lazy = false, -- ensures it loads on startup
    config = function()
      vim.cmd.colorscheme("ayu-mirage")
    end,
  },
}
