return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        json = { "prettier" },
        -- yaml = { "prettier" },
        markdown = { "prettier" },
        lua = { "stylua" },
        go = { "golangci-lint" },
        rust = { "rustfmt" },
      },
      formatters = {
        -- conform's stock recipe is `golangci-lint fmt --stdin`, which carries no
        -- filename, so a project's .golangci.yml formatters.exclusions.paths can
        -- never match and it rewrites files the project deliberately excludes --
        -- e.g. silently dropping a `// +kubebuilder:scaffold:imports` marker.
        -- Feed it a real path instead. The temp file keeps the original basename so
        -- the exclusion regexes still match, and must NOT start with "." or the Go
        -- toolchain would ignore it and golangci-lint would silently do nothing.
        ["golangci-lint"] = {
          stdin = false,
          args = { "fmt", "$FILENAME" },
          tmpfile_format = "conform.$RANDOM.$FILENAME",
        },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 3000,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
