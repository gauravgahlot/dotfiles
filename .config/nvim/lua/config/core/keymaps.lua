-- set leader
vim.g.mapleader = " "

local keymap = vim.keymap -- to be concise

-- general keymaps
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- exit current directory
keymap.set("n", "<leader>pv", "<cmd>Ex<CR>")

-- delete a char, but don't put in clipboard
keymap.set("n", "x", '"_x')

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = " Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- plugin keymaps

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
local builtin = require("telescope.builtin")
-- keymap.set("n", "<leader>ff", builtin.find_files, {})  -- find files within current working directory, respects .gitignore
-- keymap.set("n", "<leader>fs", builtin.live_grep, {})   -- find string in current working directory as you type
-- keymap.set("n", "<leader>fc", builtin.grep_string, {}) -- find string under cursor in current working directory
-- keymap.set("n", "<leader>fb", builtin.buffers, {}) -- list open buffers in current neovim instance
-- keymap.set("n", "<leader>fh", builtin.help_tags, {}) -- list available help tags

-- FloaTerm configuration
keymap.set("n", "<leader>ft", ":FloatermNew --name=myfloat --height=0.9 --width=0.7 --autoclose=2 zsh<CR>")
keymap.set("n", "t", ":FloatermToggle myfloat<CR>")
keymap.set("t", "<Esc>", "<C-\\><C-n>:q<CR>")
