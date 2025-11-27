return {
  config = function()
    require("rust_analyzer").setup({
      capabilities = capabilities,
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      },
      settings = {
        ["rust-analyzer"] = {
          cargo = {
            allFeatures = true,
          },
          completion = {
            postfix = {
              enable = true,
            },
          },
        },
      },
    })
  end,
}
