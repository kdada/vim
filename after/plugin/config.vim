" options
set nocompatible
set shortmess+=c
set hlsearch
set incsearch
set ignorecase
set nu
set tabstop=4
set shiftwidth=4
set cursorline
set background=dark
set clipboard+=unnamed
set backupdir=~/.vim_files/backup//
set directory=~/.vim_files/swap//
set undodir=~/.vim_files/undo//
let mapleader = ";"
let g:gruvbox_contrast_dark = "hard"
let NERDTreeShowHidden=1
highlight Pmenu ctermfg=15 ctermbg=7
highlight PmenuSel ctermfg=0 ctermbg=7

" keys
nmap <TAB> <C-W><C-W>
nmap gb <C-O>
nmap <C-B> :NERDTreeToggle<CR>

" auto cmds
" autocmd VimEnter * NERDTreeToggle

" go keys
au FileType go nmap ` <Plug>(go-info)
au FileType go nmap <leader>n <Plug>(go-rename)
au FileType go nmap <leader>i :GoImplements<CR>
au FileType go nmap <leader>c :GoCallees<CR>
au FileType go nmap <leader>r :GoReferrers<CR>
au FileType go nmap <leader><leader> :w<CR>:GoMetaLinter<CR>:GoVet<CR>

let g:go_highlight_functions = 0
let g:go_highlight_methods = 0
let g:go_highlight_fields = 0
let g:go_highlight_types = 0
let g:go_highlight_operators = 0
let g:go_highlight_build_constraints = 0
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1

