"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .vimrc
" Chris Cera
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The '"' is the comment character for some reason
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
let rgb_file = "/usr/lib/X11/rgb.txt"
"hi Comment ctermfg=grey
set background=light
set noerrorbells
"set sh=/bin/bash "dono says this is bad
set terse 
set report=1
set redraw
set magic
set mesg
set warn
"set paste
set shiftwidth=4
set nosmarttab

set ruler " dono: prints line numbers and such
set showcmd " dono: claims it shows the current vi command

set expandtab
set tabstop=4
set softtabstop=0
set ttyfast  "dono:
set wildmenu "dono:

set cindent

"wrapmargin is just relative to the current right margin but the textwidth is 
"an absolute maximum

set hls

set nosmartindent
set autoindent 
set wildmenu

set fileformat=dos "traffic.com,hovitate

":if !exists("autocommands_loaded")
":  let autocommands_loaded = 1
":  au FileType mail set tw=65
":endif

set incsearch

:hi search ctermbg=lightgray
" next line is to say we use a white background, so hilights are better
":hi Normal ctermfg=black ctermbg=8                                              

" needed when there are problems backspacing
" set backspace=2

"dono's line breaking
"set linebreak
set display=lastline

" dono maps
" map <up> gk
" imap <up> <C-o>gk
" map <down> gj
" imap <down> <C-o>gj
" map <home> g<home>
" imap <home> <C-o>g<home>
" map <end> g<end>
" imap <end> <C-o>g<end>

map ,rl :!latex % && bibtex % && latex % 2> /dev/null > /dev/null && latex % 2> /dev/null > /dev/null
map ,rd :!xdvi %<.dvi &
map ,rp :!dvipdfm %<.dvi
map ,rg :!gv %<.pdf &
map ,ra :!latex % && dvipdfm %<.dvi && gv %<.pdf &

map // :nohlsearch<cr>
" map <leader>c :nohlsearch<cr> " <leader> is a keyword for backslash

let &path = &path . ',' . getcwd() . '/libladon/src'
let &path = &path . ',' . getcwd() . '/libhydra/src'
let &path = &path . ',' . getcwd() . '/libdforce/src'
let &path = &path . ',' . getcwd() . '/dforce-handheld/src'
let &path = &path . ',' . getcwd() . '/dforce-command/src'
let &path = &path . ',' . getcwd() . '/dgpsd/src'
let &path = &path . ',' . getcwd() . '/../libladon/src'
let &path = &path . ',' . getcwd() . '/../libhydra/src'
let &path = &path . ',' . getcwd() . '/../libdforce/src'
let &path = &path . ',' . getcwd() . '/../dforce-handheld/src'
let &path = &path . ',' . getcwd() . '/../dforce-command/src'
let &path = &path . ',' . getcwd() . '/../../dgpsd/src'
let &path = &path . ',' . getcwd() . '/../../libladon/src'
let &path = &path . ',' . getcwd() . '/../../libhydra/src'
let &path = &path . ',' . getcwd() . '/../../libdforce/src'
let &path = &path . ',' . getcwd() . '/../../dforce-handheld/src'
let &path = &path . ',' . getcwd() . '/../../dforce-command/src'
let &path = &path . ',' . getcwd() . '/../../dgpsd/src'
let &path = &path . ',' . getcwd() . '/src'

function! MyLastWindow()
    " if the window is quickfix go on
    if &buftype=="quickfix"
        " if this window is last on screen quit without warning
        if winbufnr(2) == -1
            quit!
        endif
    endif
endfunction 

if has("autocmd")
        augroup cprog
                autocmd BufEnter * call MyLastWindow()
        augroup END
endif " has("autocmd")

" omnicomplete installation
" TODO: how do I make the preview/info at top dissappear?
" TODO: how to get std:: to work?
set nocp
filetype plugin on
let OmniCpp_NamespaceSearch = 1
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_NamespaceSearch = 2
" let OmniCpp_DefaultNamespaces = ["std"]
" let OmniCpp_MayCompleteScope = 1
"end omnicomplete

set cursorline
hi CursorLine cterm=bold

" cera/malfettone  8/22/2007
set hidden
map <C-N> :bn<CR>
map <C-P> :bp<CR>

" cera/malfettone  9/11/2007
"Make window switching easier cause I hate the Ctrl-w stuff
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"Show command window (Kris says Andy found this)
map :cw :botright cw

" added for clearly outlining functions, see :help syntax
:highlight Function term=underline ctermbg=black ctermfg=white
