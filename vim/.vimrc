" Turn on syntax highlighting
syntax on

" Turn on line numbers
set number

" Set tabs soft and 4x by default
set softtabstop=4
set tabstop=4
set expandtab
set shiftwidth=4

" Anything more than 80 characters is unwise
set textwidth=80

" Make backspace behave more like other programs
set backspace=indent,eol,start

" Set status line to something more useful
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
