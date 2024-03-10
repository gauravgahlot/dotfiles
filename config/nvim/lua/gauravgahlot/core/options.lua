local opt = vim.opt -- to be concise

-- line numbers
opt.number = true
opt.relativenumber = true

-- tabs and indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = true

-- search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark" -- dark | light
opt.signcolumn = "no"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- Treesitter folding (collapse code blocks)
vim.wo.foldmethod = "indent" -- "syntax" | "indent" | "expr"
vim.wo.foldexpr = "nvim_treesitter#foldindent()"
vim.wo.foldenable = false

-- others
opt.iskeyword:append("-")
opt.scrolloff = 8 -- not working
