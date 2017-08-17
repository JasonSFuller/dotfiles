""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" get out of horrible vi-compatible mode
set nocompatible

" none of these should be word dividers, so make them not be
set iskeyword+=_,$,@,%,#,-,:



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Cues
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" show matching brackets for a moment
set showmatch

" how many tenths of a second to blink matching brackets for
set matchtime=5

" highlight searched phrases
set hlsearch

" highlight as you type you search phrase
set incsearch

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=99

" Show line numbers
set number

" don't blink and be quiet
set novisualbell
set noerrorbells
set t_vb=

" When nonempty, this option determines the content of the status line
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

" always show the status line
set laststatus=2



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" how automatic formatting is to be done
set formatoptions=tcrqn

" take indent for new line from previous line
"set autoindent

" smart autoindenting for C programs
"set smartindent

" do c-style indenting
"set cindent

" tab spacing (settings below are just to unify it)
set tabstop=4

" unify
set softtabstop=4

" unify
set shiftwidth=4

" wrap lines
set wrap

" expand tabs to spaces
set noexpandtab

" smarttab = use tabs at the start of a line, spaces elsewhere
set nosmarttab



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" my terminal supports 256 colors
set t_Co=256

" syntax highlighting on
syntax on

" we are using a dark background
set background=dark

" use a nice color scheme
"colorscheme elflord
colorscheme monokai


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <silent><F3> :NEXTCOLOR<cr>
map <silent><F2> :PREVCOLOR<cr> 



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscellaneous
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" update the terminal title when editing a file
let &titlestring = hostname() . "[vim " . expand("%:t") . "]"
if &term == "screen"
  set t_ts=^[k
  set t_fs=^[\
endif
if &term == "screen" || &term == "xterm"
  set title
endif
