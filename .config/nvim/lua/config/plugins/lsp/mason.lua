return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      -- list of servers for mason to install
      ensure_installed = {
        "gopls",
        "lua_ls",
        "rust_analyzer",
      },
    },
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        },
      },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "ast-grep",
        "eslint_d", -- ts/js linter
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
      },
    },
    dependencies = {
      "williamboman/mason.nvim",
    },
  },
}
