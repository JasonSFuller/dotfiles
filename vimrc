"-------------------------------------------------------------------------------
"  General
"-------------------------------------------------------------------------------

" get out of horrible vi-compatible mode; should be at top; see :help compatible
set nocompatible

"-------------------------------------------------------------------------------
"  Plugins
"-------------------------------------------------------------------------------

" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" My plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'tomasiser/vim-code-dark'
call plug#end()

"-------------------------------------------------------------------------------
"  Colors
"-------------------------------------------------------------------------------

" my terminal supports 256 colors
set t_Co=256

" use syntax highlighting
syntax on

" we are using a dark background
set background=dark

" use a nice color scheme
let g:airline_theme = 'codedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0
colorscheme codedark

" show a line for when I go over 80 characters (requires vim 7.3+)
let &colorcolumn=join(range(81,300),",")

"-------------------------------------------------------------------------------
" Visual
"-------------------------------------------------------------------------------

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
set vb t_vb=

" always show the status line
set laststatus=2

"-------------------------------------------------------------------------------
"  Text
"-------------------------------------------------------------------------------

" none of these should be word dividers, so make them not be
set iskeyword+=_,$,@,%,#,-,:

" tab spacing (others are just to unify it)
set tabstop=4
set softtabstop=4
set shiftwidth=4

" don't wrap lines
set nowrap

" don't expand tabs to spaces
set noexpandtab

" don't use smarttab (use tabs at the start of a line, spaces elsewhere)
set nosmarttab

"-------------------------------------------------------------------------------
"  Miscellaneous
"-------------------------------------------------------------------------------

" update the terminal title when editing a file
let &titlestring = hostname() . " [vim " . expand("%:p") . "]"
if &term == "screen"
  set t_ts=^[k
  set t_fs=^[\
endif
if &term == "screen" || &term == "xterm"
  set title
endif

" Write the file as root; if i've changed it but forgot to sudo, then :w!!
cmap w!! w !sudo tee > /dev/null %

" Remember last line position (from defaults.vim)
if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif
endif

