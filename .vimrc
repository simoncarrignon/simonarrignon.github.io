syntax enable

filetype plugin on
filetype indent on

" show line number
set number



"" pour revenir a la ligne sans couper les mots :
set wrap linebreak nolist 

"" burfers goes to background
set hidden

if exists("$TMUX")
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" upon hitting escape to change modes,
" send successive move-left and move-right
" commands to immediately redraw the cursor

inoremap <special> <Esc> <Esc>hl

" don't blink the cursor
set guicursor+=i:blinkwait0
"
""utiliser pour afficher des é avec latex suite
imap <buffer> <leader>it <Plug>Tex_InsertItemOnThisLine
imap <C-b> <Plug>Tex_MathBF
imap <C-c> <Plug>Tex_MathCal
""imap <C-l> <Plug>Tex_LeftRight

"au VimEnter * au FileType tex silent! unmap! <buffer> é

""latex-suite compile en pdf using lualatex:
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='pdf'
let g:Tex_CompileRule_pdf='lualatex -interaction=nonstopmode $*'
let g:tex_comment_nospell=1


""ça aussi pour latex suite, pour grep, pour citer, enfin on sait pas trop
set grepprg=grep\ -nH\ $*

" send selection to R with space bar
vmap <Space> <Plug>RDSendSelection 
" send line to R with space bar
nmap <Space> <Plug>RDSendLine

let g:r_indent_op_pattern     = get(g:, 'r_indent_op_pattern',
      \ '\(&\||\|+\|-\|\*\|/\|=\|\~\|%\|->\)\s*$')

" Display scons files with python syntax
autocmd BufReadPre,BufNewFile SConstruct set filetype=python
autocmd BufReadPre,BufNewFile SConscript set filetype=python


if $TMUX != ''
    let R_source = $HOME.'/.vim/pack/all/start/Nvim-R/R/tmux_split.vim'
    """this belewo doesn't work anymoreb
    let R_in_buffer = 0
    let R_applescript = 0
    let R_tmux_split = 1
endif
"          
" petites estethique de recherche
"
"set incsearch "search while typping
set hlsearch  "highligh searchat


let r_syntax_folding=1
set expandtab
set tabstop=4
set shiftwidth=4

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

set diffopt+=iwhite

set diffexpr=""

"set conceallevel=2
"hi Conceal cterm=NONE ctermbg=NONE ctermfg=darkblue
