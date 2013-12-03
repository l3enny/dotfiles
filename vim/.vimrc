set nocompatible   " Vim is improved!
filetype on        " I'm told this is required
syntax enable

" Set up Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Turn on line numbers
set number

" Set tabs soft and 4x by default
set softtabstop=4
set tabstop=4
set expandtab
set shiftwidth=4

" Make searching more friendly
set ignorecase
set smartcase
set incsearch
set hlsearch

" Anything more than 80 characters is unwise
set textwidth=80

" Make backspace behave more like other programs
set backspace=indent,eol,start

" Set status line to something more useful
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

" Simplify pane-switching
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Set preference for where splits occur
set splitbelow
set splitright

" Make for seamless transitions between vim and tmux panes
Bundle 'christoomey/vim-tmux-navigator'

" Neato status bar
Bundle 'Lokaltog/powerline'

" Syntax
Bundle 'tpope/vim-git'

" Color
Bundle 'molokai'
