-- vim.cmd("let g:netrw_liststyle = 3")
local opt = vim.opt -- to be concise

-- line numbers
opt.number = true
opt.relativenumber = true

-- tabs and indentation
opt.tabstop = 2       -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2    -- 2 spaces for indent width
opt.expandtab = true  -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = true

-- search
opt.ignorecase = true -- ignore case when seaching
opt.smartcase = true  -- if you include mixed case in your search, assumes you want case-sensitive
opt.hlsearch = false
opt.incsearch = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true -- turn on termguicolors for tokyonight colorscheme to work
opt.background = "dark"  -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes"   -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace or indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- Treesitter folding (collapse code blocks)
vim.wo.foldmethod = "indent" -- "syntax" | "indent" | "expr"
vim.wo.foldexpr = "nvim_treesitter#foldindent()"
vim.wo.foldenable = false

-- others
opt.iskeyword:append("-")
opt.scrolloff = 8 -- not working
opt.colorcolumn = "110"
