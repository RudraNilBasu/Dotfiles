" Vim color file
" nothings
" Created by rudra
" Following https://www.twitch.tv/nothings2

hi clear

if exists("syntax on")
syntax reset
endif

set t_Co=256
let g:colors_name = "nothings"


" Define reusable colorvariables.
let s:bg="#FFFFFF"
let s:fg="#000000"
let s:fg2="#000000"
let s:fg3="#000000"
let s:fg4="#000000"
let s:bg2="#FFFFFF"
let s:bg3="#FFFFFF"
let s:bg4="#FFFFFF"
" let s:keyword="#90ee90"
let s:keyword="#000000"
let s:builtin="#000000"
let s:const= "#000000"
" let s:comment="#3fdf1f"
let s:comment="#168a00"
" let s:func="#ffffff"
let s:func="#000000"
let s:str="#000000"
" let s:type="#90ee90"
let s:type="#000000"
let s:var="#000000"
let s:bluebg="#0000ff"
let s:redbg="#ff0000"
let s:blackbg="#000000"
let s:whitebg="#ffffff"
let s:warning="#e81050"
let s:warning2="#e86310"
let s:boolean1="#000000"

exe 'hi Normal guifg='s:fg' guibg='s:bg 
exe 'hi Cursor guifg='s:bg' guibg='s:fg 
exe 'hi Cursorline  guibg='s:bg2
exe 'hi CursorColumn  guibg='s:bg2 
exe 'hi ColorColumn  guibg='s:bg2 
exe 'hi LineNr guifg='s:fg2' guibg='s:bg2 
exe 'hi VertSplit guifg='s:fg3' guibg='s:bg3 
exe 'hi MatchParen guifg='s:warning2'  gui=underline'
exe 'hi StatusLine guifg='s:fg2' guibg='s:bg3' gui=bold'
exe 'hi Pmenu guifg='s:fg' guibg='s:bg2
exe 'hi PmenuSel  guibg='s:bg3 
exe 'hi IncSearch guifg='s:redbg' guibg='s:keyword 
exe 'hi Search guibg='s:blackbg' guifg='s:whitebg' gui=underline'
exe 'hi Directory guifg='s:const  
exe 'hi Folded guifg='s:fg4' guibg='s:bg 

exe 'hi Boolean guifg='s:boolean1  
exe 'hi Character guifg='s:const  
exe 'hi Comment guifg='s:comment  
exe 'hi Conditional guifg='s:keyword  
exe 'hi Constant guifg='s:const  
exe 'hi Define guifg='s:keyword  
exe 'hi DiffAdd guifg=#f8f8f8 guibg=#46830c gui=bold'
exe 'hi DiffDelete guifg=#ff0000'  
exe 'hi DiffChange guifg='s:fg' guibg='s:var 
exe 'hi DiffText guifg='s:fg' guibg='s:builtin' gui=bold'
exe 'hi ErrorMsg guifg='s:warning' guibg='s:bg2' gui=bold'
exe 'hi WarningMsg guifg='s:fg' guibg='s:warning2 
exe 'hi Float guifg='s:const  
exe 'hi Function guifg='s:func  
exe 'hi Identifier guifg='s:type'  gui=italic'
exe 'hi Keyword guifg='s:keyword'  gui=bold'
exe 'hi Label guifg='s:var
exe 'hi NonText guifg='s:bg4' guibg='s:bg2 
" NonText is the part after the end of file is reached '~' part in the vim
exe 'hi Number guifg='s:const
" TODO: Make Number same as that of text!!
exe 'hi Operater guifg='s:keyword  
exe 'hi PreProc guifg='s:keyword  
exe 'hi Special guifg='s:fg  
exe 'hi SpecialKey guifg='s:fg2' guibg='s:bg2 
exe 'hi Statement guifg='s:keyword  
exe 'hi StorageClass guifg='s:type'  gui=italic'
exe 'hi String guifg='s:str  
exe 'hi Tag guifg='s:keyword  
exe 'hi Title guifg='s:fg'  gui=bold'
exe 'hi Todo guifg='s:fg2'  gui=inverse,bold'
exe 'hi Type guifg='s:type 
exe 'hi Underlined   gui=underline'

" Ruby Highlighting
exe 'hi rubyAttribute guifg='s:builtin
exe 'hi rubyLocalVariableOrMethod guifg='s:var
exe 'hi rubyGlobalVariable guifg='s:var' gui=italic'
exe 'hi rubyInstanceVariable guifg='s:var
exe 'hi rubyKeyword guifg='s:keyword
exe 'hi rubyKeywordAsMethod guifg='s:keyword' gui=bold'
exe 'hi rubyClassDeclaration guifg='s:keyword' gui=bold'
exe 'hi rubyClass guifg='s:fg' gui=bold'
exe 'hi rubyNumber guifg='s:const

" Python Highlighting
exe 'hi pythonBuiltinFunc guifg='s:builtin

" Go Highlighting
exe 'hi goBuiltins guifg='s:builtin

" Javascript Highlighting
exe 'hi jsBuiltins guifg='s:builtin
exe 'hi jsFunction guifg='s:keyword' gui=bold'
exe 'hi jsGlobalObjects guifg='s:type
exe 'hi jsAssignmentExps guifg='s:var

" Html Highlighting
exe 'hi htmlLink guifg='s:var' gui=underline'
exe 'hi htmlStatement guifg='s:keyword
exe 'hi htmlSpecialTagName guifg='s:keyword

" Markdown Highlighting
exe 'hi mkdCode guifg='s:builtin


" custom
exe 'hi Visual  guifg=#d3b58d guibg=#0000ff gui=none'
exe 'hi Visual  guifg=#FFFFFF guibg=#000000 gui=none'
" exe 'hi Cursorline guifg=#d3b58d guibg=#072626 gui=none'
exe 'hi Cursorline guifg=#d3b58d guibg=#000000 gui=none'

