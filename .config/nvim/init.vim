set nocompatible 	" be iMproved, required
filetype off		" required

" -------------------------------------------------------------------------------------------------
" Installed Plugins
" -------------------------------------------------------------------------------------------------

call plug#begin('~/.config/nvim/plugged')

Plug 'morhetz/gruvbox'
" Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree' 
Plug 'ctrlpvim/ctrlp.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go'

call plug#end()


" -------------------------------------------------------------------------------------------------
" Display Settings
" -------------------------------------------------------------------------------------------------

" colorscheme gruvbox

:syntax on
:set scrolloff=2         " 2 lines above/below cursor when scrolling
:set number              " show line numbers
:set showmatch           " show matching bracket (briefly jump)
:set showmode            " show mode in status bar (insert/replace/...)
:set showcmd             " show typed command in status bar
:set ruler               " show cursor position in status bar
:set title               " show file in titlebar
:set wildmenu            " completion with menu
:set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn,*.DS_Store,*.localized
:set laststatus=2        " use 2 lines for the status bar
:set matchtime=2         " show matching bracket for 0.2 seconds
:set matchpairs+=<:>     " specially for html
" :set colorcolumn=80
:set nowrap
:set smartcase
:set hlsearch
":set tabstop=4 softtabstop=4
":set expandtab
":set smartindent

" Highlight changes
:hi DiffChange     term=bold ctermbg=255 ctermfg=0 guibg=LightMagenta
:hi DiffText       term=reverse cterm=bold ctermfg=0 ctermbg=9 gui=bold guibg=Red
:hi DiffAdd        term=bold ctermfg=0 ctermbg=81 guibg=LightBlue
:hi colorcolumn    term=standout ctermfg=0 ctermbg=11 guifg=Blue guibg=Yellow

map <silent> <C-n> :NERDTreeFocus<CR>

" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=1
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC] (coc in this case)
let g:go_def_mapping_enabled = 0

"" -------------------------------------------------------------------------------------------------
" NERDTree settings
" -------------------------------------------------------------------------------------------------

" Show hidden files
let NERDTreeShowHidden=0

" Open the existing NERDTree on each new tab.
" autocmd BufWinEnter * silent NERDTreeMirror

" Start NERDTree and leave the cursor in it.
" autocmd VimEnter * NERDTree

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p


