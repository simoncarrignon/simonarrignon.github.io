execute pathogen#infect()
syntax enable

filetype plugin on
filetype indent on


"" pour revenir a la ligne sans couper les mots :
set wrap linebreak nolist 

"" burfers goes to background
set hidden 

"" Pour changer la forme du curseur en mode insertion 
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"
""utiliser pour afficher des é avec latex suite
imap <buffer> <leader>it <Plug>Tex_InsertItemOnThisLine
imap <C-b> <Plug>Tex_MathBF
imap <C-c> <Plug>Tex_MathCal
""imap <C-l> <Plug>Tex_LeftRight

"au VimEnter * au FileType tex silent! unmap! <buffer> é

""latex-suite compile en pdf :
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='pdf'
let g:Tex_CompileRule_pdf='lualatex -interaction=nonstopmode $*'



""ça aussi pour latex suite, pour grep, pour citer, enfin on sait pas trop
set grepprg=grep\ -nH\ $*

" send selection to R with space bar
vmap <Space> <Plug>RDSendSelection 
" send line to R with space bar
nmap <Space> <Plug>RDSendLine


" Display scons files with python syntax
autocmd BufReadPre,BufNewFile SConstruct set filetype=python
autocmd BufReadPre,BufNewFile SConscript set filetype=python


let R_in_buffer = 0
let R_applescript = 0
let R_tmux_split = 1
"          
" petites estethique de recherche
"
"set incsearch "search while typping
set hlsearch  "highligh searchat


let r_syntax_folding=1
