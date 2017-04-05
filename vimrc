set tabstop=4
set shiftwidth=4
"set expandtab
set wm=2
set autoindent
set ls=2

" make backspace work properly
set backspace=2

" syntax hightlighting
syntax on
autocmd FileType c,cpp,php,slang,java set cindent

" highlight all matches for the last search
set hlsearch
" or if you don't like it, use set nohlsearch

" toggle background
map <F11> :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" case-insensitive search
set ignorecase

" show non-printable chars as hex code instead of the cryptic ^C style
set display=uhex

" special settings for diff mode
if &diff
    syntax off
endif

" autocmd BufNew,BufNewFile,BufRead SConstruct,SConscript setlocal ft=python

