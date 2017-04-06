"""""""""""""""""""""""""""""""""""""""
" Common Config
"""""""""""""""""""""""""""""""""""""""

" options
set nocompatible
set lazyredraw
set shortmess+=c
set hlsearch
set incsearch
set ignorecase
set nu
set tabstop=4
set shiftwidth=4
set cursorline
set t_Co=256
set background=dark
set clipboard+=unnamed
set updatetime=250
set backspace=indent,eol,start
set history=1000
set laststatus=2
set statusline=%r%f\ %m%=%{fugitive#statusline()}\ %l/%L\ %c/%v\ 
set backupdir=~/.vim_files/backup//
set directory=~/.vim_files/swap//
set undodir=~/.vim_files/undo//
let mapleader = ";"
highlight Pmenu ctermfg=15 ctermbg=7
highlight PmenuSel ctermfg=0 ctermbg=7
highlight DiffAdd ctermbg=0
highlight DiffDelete ctermbg=0
highlight DiffChange ctermbg=25
highlight DiffText ctermbg=25
syntax on
filetype plugin indent on

" keys
nmap <TAB> <C-W><C-W>
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l
nnoremap gb <C-O>
nnoremap gn <C-I>

" swap
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf 
endfunction

nmap <silent> <leader>h :call MarkWindowSwap()<CR><C-W>h:call DoWindowSwap()<CR>
nmap <silent> <leader>j :call MarkWindowSwap()<CR><C-W>j:call DoWindowSwap()<CR>
nmap <silent> <leader>k :call MarkWindowSwap()<CR><C-W>k:call DoWindowSwap()<CR>
nmap <silent> <leader>l :call MarkWindowSwap()<CR><C-W>l:call DoWindowSwap()<CR>
nmap <silent> <leader>m :call MarkWindowSwap()<CR>
nmap <silent> <leader>s :call DoWindowSwap()<CR>

"""""""""""""""""""""""""""""""""""""""
" Plugin Config
"""""""""""""""""""""""""""""""""""""""

" gruvbox
let g:gruvbox_contrast_dark = "hard"

" nerdtree
let NERDTreeShowHidden=1
nmap <C-B> :NERDTreeToggle<CR>

" git
let g:gitgutter_map_keys = 0
let g:gitgutter_sign_column_always = 1

" comment
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1 
nmap <leader>/ <Plug>NERDCommenterToggle
vmap <leader>/ <Plug>NERDCommenterToggle

" go
let g:go_highlight_functions = 0
let g:go_highlight_methods = 0
let g:go_highlight_fields = 0
let g:go_highlight_types = 0
let g:go_highlight_operators = 0
let g:go_highlight_build_constraints = 0
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1
au FileType go nmap ` <Plug>(go-info)
au FileType go nmap <leader>n <Plug>(go-rename)
au FileType go nmap <leader>i :GoImplements<CR>
au FileType go nmap <leader>c :GoCallees<CR>
au FileType go nmap <leader>r :GoReferrers<CR>
au FileType go nmap <leader><leader> :w<CR>:GoMetaLinter<CR>:GoVet<CR>

