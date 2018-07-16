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
set clipboard=unnamedplus
set updatetime=250
set backspace=indent,eol,start
set history=1000
set laststatus=2
set statusline=%r%f\ %m%=%{fugitive#statusline()}\ %l/%L\ %c/%v\ 
set backupdir=~/.vim_files/backup//
set directory=~/.vim_files/swap//
set undodir=~/.vim_files/undo//
set undofile
set undolevels=1000
set undoreload=10000
set signcolumn=yes
set mmp=10000
set virtualedit=all
let mapleader = ";"
highlight Pmenu ctermfg=0 ctermbg=7
highlight PmenuSel ctermfg=1 ctermbg=7
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
"let g:gitgutter_sign_column_always = 1

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
let g:go_info_mode = 'guru'
au FileType go nmap ` <Plug>(go-info)
au FileType go nmap <leader>n <Plug>(go-rename)
au FileType go nmap <leader>i :GoImplements<CR>
au FileType go nmap <leader>c :GoCallees<CR>
au FileType go nmap <leader>r :GoReferrers<CR>
au FileType go nmap <leader><leader> :w<CR>:GoMetaLinter<CR>:GoVet<CR>

" ycm
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'  
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_show_diagnostics_ui = 0
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_cache_omnifunc = 0
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_python_binary_path = 'python3'

" clang format
let g:clang_format#auto_format = 1
au FileType c ClangFormatAutoEnable
let g:clang_format#style_options = {
\	'BasedOnStyle': 'LLVM',
\	'IndentWidth': 8,
\	'UseTab': 'Always',
\	'BreakBeforeBraces': 'Linux',
\	'AlwaysBreakBeforeMultilineStrings': 'true',
\	'AllowShortIfStatementsOnASingleLine': 'false',
\	'AllowShortLoopsOnASingleLine': 'false',
\	'AllowShortFunctionsOnASingleLine': 'false',
\	'IndentCaseLabels': 'false',
\	'AlignEscapedNewlinesLeft': 'false',
\	'AlignTrailingComments': 'true',
\	'AllowAllParametersOfDeclarationOnNextLine': 'false',
\	'AlignAfterOpenBracket': 'true',
\	'SpaceAfterCStyleCast': 'false',
\	'MaxEmptyLinesToKeep': 2,
\	'BreakBeforeBinaryOperators': 'NonAssignment',
\	'BreakStringLiterals': 'false',
\	'SortIncludes':    'false',
\	'ContinuationIndentWidth': 8
\}

" c
au FileType c nmap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" python
au FileType python nmap gd :YcmCompleter GoTo<CR>

" js
let g:jsx_ext_required = 0
let g:javascript_plugin_jsdoc = 1
au Filetype html setlocal ts=2 sw=2 expandtab
au Filetype javascript setlocal ts=2 sw=2 expandtab
au Filetype javascript nmap <silent> gd :YcmCompleter GoToDefinition<CR>

" rust
au FileType rust nmap gd :YcmCompleter GoTo<CR>
let g:rustfmt_autosave = 1

" ale
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_linters = {
\   'rust': ['rls'],
\   'go': ['golint'],
\}
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'python': ['yapf'],
\}
