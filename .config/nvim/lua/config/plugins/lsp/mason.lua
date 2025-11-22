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
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        -- formatters for Go
        "golangci-lint",
        "gci",
        -- formatters for Rust
        "rustfmt",
      },
    },
    dependencies = {
      "williamboman/mason.nvim",
    },
  },
}
