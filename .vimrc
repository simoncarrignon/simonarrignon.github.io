execute pathogen#infect()
syntax enable

filetype plugin on
filetype indent on


"" pour revenir a la ligne sans couper les mots :
set wrap linebreak nolist 

"" Pour changer la forme du curseur en mode insertion 
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"
""utiliser pour afficher des é avec latex suite
imap <buffer> <leader>it <Plug>Tex_InsertItemOnThisLine
imap <C-b> <Plug>Tex_MathBF
imap <C-c> <Plug>Tex_MathCal
imap <C-l> <Plug>Tex_LeftRight

"au VimEnter * au FileType tex silent! unmap! <buffer> é

""latex-suite compile en pdf :
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='pdf'
let g:Tex_CompileRule_pdf='lualatex -interaction=nonstopmode $*'



""ça aussi pour latex suite, pour grep, pour citer, enfin on sait pas trop
set grepprg=grep\ -nH\ $*


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" sample settings for vim-r-plugin and screen.vim
 " Installation 
 "       - Place plugin file under ~/.vim/
 "       - To activate help, type in vim :helptags ~/.vim/doc
 "       - Place the following vim conf lines in .vimrc
 " Usage
 "       - Read intro/help in vim with :h vim-r-plugin or :h screen.txt
 "       - To initialize vim/R session, start screen/tmux, open some *.R file in vim and then hit F2 key
 "       - Object/omni completion command CTRL-X CTRL-O
 "       - To update object list for omni completion, run :RUpdateObjList
 " My favorite Vim/R window arrangement 
 "	tmux attach
 "	Open *.R file in Vim and hit F2 to open R
 "	Go to R pane and create another pane with C-a %
 "	Open second R session in new pane
 "	Go to vim pane and open a new viewport with :split *.R
 " Useful tmux commands
 "       tmux new -s <myname>       start new session with a specific name
 "	tmux ls (C-a-s)            list tmux session
 "       tmux attach -t <id>        attach to specific session  
 "       tmux kill-session -t <id>  kill specific session
 " 	C-a-: kill-session         kill a session
 " 	C-a %                      split pane vertically
 "       C-a "                      split pane horizontally
 " 	C-a-o                      jump cursor to next pane
 "	C-a C-o                    swap panes
 " 	C-a-: resize-pane -L 10    resizes pane by 10 to left (L R U D)
 " Corresponding Vim commands
 " 	:split or :vsplit      split viewport
 " 	C-w-w                  jump cursor to next pane-
 " 	C-w-r                  swap viewports
 " 	C-w C-++               resize viewports to equal split
 " 	C-w 10+                increase size of current pane by value

 " To open R in terminal rather than RGui (only necessary on OS X)
 " let vimrplugin_applescript = 0
 " let vimrplugin_screenplugin = 0
 " For tmux support
 let g:ScreenImpl = 'Tmux'
 let vimrplugin_screenvsplit = 1 " For vertical tmux split
 let g:ScreenShellInitialFocus = 'shell' 
 " instruct to use your own .screenrc file
 let g:vimrplugin_noscreenrc = 1
 " For integration of r-plugin with screen.vim
 let g:vimrplugin_screenplugin = 1
 " Don't use conque shell if installed
 let vimrplugin_conqueplugin = 0
 " map the letter 'r' to send visually selected lines to R 
 let g:vimrplugin_map_r = 1
 " see R documentation in a Vim buffer
 let vimrplugin_vimpager = "no"
 "set expandtab
 set shiftwidth=4
 set tabstop=8
 " start R with F2 key
 map <F2> <Plug>RStart 
 imap <F2> <Plug>RStart
 vmap <F2> <Plug>RStart
 " send selection to R with space bar
 vmap <Space> <Plug>RDSendSelection 
 " send line to R with space bar
 nmap <Space> <Plug>RDSendLine

" Display scons files with python syntax
autocmd BufReadPre,BufNewFile SConstruct set filetype=python
autocmd BufReadPre,BufNewFile SConscript set filetype=python
