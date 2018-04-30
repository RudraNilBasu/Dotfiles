set number " turn on line numbering
filetype indent on
set ruler " Show line and column no
set cursorline " Draw a line in current working line

" Searching
set incsearch " search as chars are entered
set hlsearch  " highlight matches


" git commit 72 char break
au FileType gitcommit set tw=72

" Subsurface coding style
filetype plugin indent on
filetype detect
set cindent tabstop=8 shiftwidth=8 cinoptions=l1,:0,(0,g0
" TODO: extern "C" gets indented

" And some sane defaults, optional, but quite nice
set nocompatible
syntax on
colorscheme default
set hls
set is

" The default blue is just impossible to see on a black terminal
highlight Comment ctermfg=Brown

" clearly point out when someone have trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red

" Show trailing whitespace and spaces before a tab:
match ExtraWhitespace /\s\+$\| \+\ze\t/


let tabsize=4
" tab = 8 spaces
execute "set tabstop=".tabsize
execute "set shiftwidth=".tabsize
set expandtab

execute pathogen#infect()

" autocmd vimenter * NERDTree
" Currently turned off autostart of nerdtree

:map <F2> :NERDTreeFocus<CR>
:map <F3> :NERDTreeClose<CR>
" https://stackoverflow.com/a/53668/6794119
:map <F7> :tabp<CR>
:map <F8> :tabn<CR>

" nerdcommenter: https://github.com/scrooloose/nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

