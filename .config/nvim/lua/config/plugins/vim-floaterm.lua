return {
  "voldikss/vim-floaterm",
  config = function()

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set(
      "n",
      "<leader>ft",
      "<cmd>FloatermNew --name=myfloat --height=0.9 --width=0.7 --autoclose=2 zsh<CR>"
    )

    keymap.set("n", "t", "<cmd>FloatermToggle myfloat<CR>", {desc = "Show terminal window" })
    keymap.set("t", "<Esc>", "<C-\\><C-n>:q<CR>", {desc = "Hide terminal" })

  end,
}

