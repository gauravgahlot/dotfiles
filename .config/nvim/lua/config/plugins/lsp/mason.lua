return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "lua_ls",
      },
      -- rustaceanvim manages rust-analyzer; exclude it here to avoid
      -- duplicate LSP clients and duplicate completions.
      automatic_enable = {
        exclude = { "rust_analyzer" },
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
        -- "gci",
      },
    },
    dependencies = {
      "williamboman/mason.nvim",
    },
  },
}
