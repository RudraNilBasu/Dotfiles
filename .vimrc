filetype plugin indent on
syntax on

set ruler " Show line and column no
set number " turn on line numbering
set relativenumber
set cursorline

" Colorscheme, really depends on mood
set background=light
color Greymatters

" Searching
set incsearch " search as chars are entered
set hlsearch  " highlight matches
" turn off search highlight \<space> to turn off highlight
nnoremap <leader><space> :nohlsearch<CR>

execute pathogen#infect()

:map <F2> :NERDTreeFocus<CR>
:map <F3> :NERDTreeClose<CR>
" https://stackoverflow.com/a/53668/6794119
:map <F7> :tabp<CR>
:map <F8> :tabn<CR>

:map <space> viw

set cursorcolumn

" nerdcommenter: https://github.com/scrooloose/nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" The default blue is just impossible to see on a black terminal
" highlight Comment ctermfg=Brown

" clearly point out when someone have trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red

" Show trailing whitespace and spaces before a tab:
match ExtraWhitespace /\s\+$\| \+\ze\t/

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
map f :call ShowFuncName() <CR>

" Ctrl-P
" set runtimepath^=~/.vim/bundle/ctrlp.vim
" Search by filename: https://superuser.com/a/498215
" let g:ctrlp_by_filename = 1
" let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Use `git ls-files for searching for files`
" let g:ctrlp_max_files=20000
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']

" https://stackoverflow.com/a/17327372/6794119
" if executable('ag')
  " " Use Ag over Grep
  " set grepprg=ag\ --nogroup\ --nocolor

  " " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" endif


set colorcolumn=110
highlight ColorColumn ctermbg=green


" Better copy paste
set pastetoggle=<F2>
set clipboard=unnamed

call pathogen#helptags()

" git commit messages border color, was needed when switching to
" light background
au FileType gitcommit
 \ hi gitcommitSummary ctermfg=black ctermbg=lightblue

set tags=./tags;


map <F5> :%s///gn <CR>
map <C-a> <esc>ggVG<CR>
nnoremap - dd
inoremap <c-u> <esc>viwUi
inoremap <c-d> <esc>ddi
nnoremap <c-u> viwU
inoremap <c-v> <esc>viw
inoremap <c-space> <esc>viw
map <F10> :FZF<CR>
map <F9> :Ag<CR>

function ShowFiles(filename)
    execute 'new | 0read ! git ls-files | grep ' . a:filename
    set ro
    " execute '!git ls-files | grep ' . a:filename
    " execute '!git ls-files | grep ' . a:filename
endfunction

" function OpenFile()
    " let lineText = getline('.')
    " execute 'tabe ' . lineText
" endfunction

" " TODO: replace this with the current selected word
" map <F9> :call OpenFile()<CR>
command! -nargs=1 FindFiles call ShowFiles(<f-args>)
command! Readonly set ro
map <F6> :%s/word/replace/g

function FindAndReplace(str1, str2)
    let command = '%s/' . a:str1 . '/' . a:str2 . '/g'
    execute command
endfunction

function SetTabValue(value)
    let cm1 = 'set shiftwidth=' . a:value
    let cm2 = 'set tabstop=' . a:value
    execute cm1
    execute cm2
endfunction

function TotalLines()
    echom line('$')
endfunction

function GithubUrl() range
    let l:line_start = getpos("'<")[1]
    let l:line_end = getpos("'>")[1]
    let l:root_url = system('git rev-parse --show-toplevel')
    let l:rel_path = '/' . expand('%:p')[len(root_url) : -1]
    let l:branch = system('git name-rev --name-only HEAD')
    " let l:branch = system('git rev-parse --abbrev-ref HEAD')
    let l:branch = substitute(l:branch, '^tags//\|\n', '', '')

    let l:remote_url = system('git remote get-url origin')
    let l:remote_url = substitute(l:remote_url, 'git@\|git:', 'https://', 'g')
    let l:remote_url = substitute(l:remote_url, '\.git.$', '', '')
    let l:remote_url = substitute(l:remote_url, '^tags//\|\n', '', '')
    let l:remote_url = substitute(l:remote_url, ':\([^/]\)', '/\1', 'g')

    let l:final_url = remote_url . '/blob/' . branch . rel_path . '#L' . line_start . '-L' . line_end

    " TODO: For Mac only, use `xdg-open` for linux
    call system('open ' . l:final_url)
endfunction

function ToggleLineNumbers()
  set invnumber
  set invrelativenumber
endfunction

function ToggleDND()
  set invcursorline
  set invcursorcolumn
  GitGutterToggle
  call ToggleLineNumbers()
endfunction

function StartDND()
  set nocursorline
  set nocursorcolumn
  let g:gitgutter_enabled = 0
  set nonumber
  set norelativenumber
  set colorcolumn=0
endfunction

function EndDND()
  set cursorline
  set cursorcolumn
  let g:gitgutter_enabled = 1
  set number
  set relativenumber
  set colorcolumn=110
endfunction

" For GitGutter
set updatetime=100

" Make :Ag only search on contents and not file
" https://github.com/junegunn/fzf.vim/issues/346
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

call StartDND()
" For ACK
" let g:ackprg = 'ag --nogroup --nocolor --column'

set completeopt-=menu
if has("gui_running")
  set gfn=Monaco:h18
  colorscheme witness
endif


nnoremap <c-b> :buffer *
nnoremap gb :ls<CR>:b

runtime! ftplugin/man.vim
