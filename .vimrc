" colorscheme desert
" colorscheme witness
colorscheme handmade
set guifont=Consolas:h12 " 11 previously then settled on 10

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Searching
set incsearch " search as chars are entered
set hlsearch  " highlight matches
" turn off search highlight \<space> to turn off highlight
nnoremap <leader><space> :nohlsearch<CR>

:map <F7> :tabp<CR>
:map <F8> :tabn<CR>
:map <F7> :tabp<CR>
:map <F8> :tabn<CR>

:map <space> viw

map <F5> :%s///gn <CR>
map <F6> :%s/word/replace/g
map <F11> :%bd\|e#<CR>
map <C-a> <esc>ggVG<CR>
nnoremap - dd
inoremap <c-u> <esc>viwUi
inoremap <c-d> <esc>ddi
nnoremap <c-u> viwU
inoremap <c-v> <esc>viw
inoremap <c-space> <esc>viw
map <F10> :FZF<CR>
map <F9> :Ag<CR>

" Splitting
map <C-\> <esc>:vsplit<CR>
map <C-_> <esc>:split<CR>

" https://vi.stackexchange.com/a/9161
nnoremap <c-b> :buffer *
nnoremap <A-b> :e code\*
" nnoremap <c-e> :e 
nnoremap gb :ls<CR>:b
nnoremap gsb :ls<CR>:sb
nnoremap gvb :ls<CR>:vertical sb

function SetTabValue(value)
    let cm1 = 'set shiftwidth=' . a:value
    let cm2 = 'set tabstop=' . a:value
    execute cm1
    execute cm2
endfunction

function TotalLines()
    echom line('$')
endfunction

function ToggleLineNumbers()
  set invnumber
  set invrelativenumber
endfunction

function ToggleDND()
  set invcursorline
  set invcursorcolumn
  call ToggleLineNumbers()
endfunction

function StartDND()
  set nocursorline
  set nocursorcolumn
  set updatetime=100
  let g:gitgutter_enabled = 0
  set nonumber
  set norelativenumber
  set guioptions -=m
  set guioptions -=T
endfunction

function TurnOffMenuBars()
  set guioptions -=m
  set guioptions -=T
endfunction

function TurnOnMenuBars()
  set guioptions +=m
  set guioptions +=T
endfunction

call StartDND()

call pathogen#infect()

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

set path=.,w:\handmade,,**
set completeopt-=menu
set wildignore=*.swp,*.*~
map <F10> :find 

" args code\*.cpp code\*.h

set backupdir=C:\Windows\Temp\vim_backups
set directory=C:\Windows\Temp\vim_backups
set undodir=C:\Windows\Temp\vim_backups

" Map to yank delete to the unnamed register
" nnoremap d "_d
" nnoremap D "_D

" nnoremap "*d "*d
" nnoremap "*D "*D

function ListAFunction(name, description)
    echohl WarningMsg
    echo a:name . ": "
    echohl None
    echon a:description
endfunction

function FunctionLists()
    call ListAFunction("ToggleDND()", "toggles line numbers and cursorline")
    call ListAFunction("StartDND()", "Turns off line numbers, cursorline / column")
    call ListAFunction("EndDND()", "Turns on line numbers, cursorline / column")
    call ListAFunction("SetTabValue(int x)", "Sets tab = x spaces")
    call ListAFunction("ToggleLineNumbers()", "Toggles relative line numbers")
    call ListAFunction("TurnOnMenuBars()", "Shows Top Menu bars")
    call ListAFunction("TurnOffMenuBars()", "Hides Top Menu bars")
    call ListAFunction("ClearAllBuffers()", "Clears all Buffers and keep the current one")
    " echohl WarningMsg
    " echo "ToggleDND()"
    " echohl None
    " echon " Toggles DND()"
endfunction

function! EchoWarning(msg)
  echohl WarningMsg
  echo "Warning"
  echohl None
  echon ': ' a:msg
endfunction

set makeprg=W:\handmade\code\build

command! MakeTags !C:\Users\rudra\Downloads\ctags58\ctags58\ctags.exe --c-types=+l -R .
" nnoremap <A-m> :make \| vert copen 80<CR>
nnoremap <A-m> :only \| :make \| vert copen 80<CR>
nnoremap <F12> :make \| vert copen 80<CR>
" TODO: Shortcut for :cnext
" map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" TODO: Map Alt-M to this

command! BuildHanmdadeCmd !W:\handmade\code\build

function BuildHandmade()
    execute BuildHanmdadeCmd
endfunction


function ClearAllBuffers()
    :%bd|e#<CR>
    echom "Cleared"
    " :%bd|e#
endfunction


" augroup myvimrc
    " autocmd!
    " autocmd QuickFixCmdPost [^l]* cwindow
    " autocmd QuickFixCmdPost l*    lwindow
" augroup END





function! s:insert_gates()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#if !defined(" . gatename . ")"
  " execute "normal! i#ifndef " . gatename
  execute "normal! o#define " . gatename . " "
  execute "normal! Go#endif /* " . gatename . " */"
  normal! kk
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()


execute pathogen#infect()



set runtimepath^=~/vimfiles/bundle/ctrlp.vim
" set clipboard=unnamed



" Change a blank line upon creation so that its leading spaces won't be removed

" inoremap <Return> <Return><Space><BS>
" nnoremap o o<Space><BS>
" nnoremap O O<Space><BS>

let prj_file = expand("**/*.prj")
call EchoWarning("Using config: " . prj_file)
let cmd_prj = 'source ' . prj_file
execute cmd_prj
