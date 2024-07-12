" A small vim guide:
"   use: f(     To go to nearest '('
"   use: vi'    TO mark everything inside single quotes
"   use: vi"    To mark everything inside double quotes
"   use: vib    To mark everything inside paranthesis
"   use: viB    To mark everything inside curly braces
"   use: ci"    To delete everything inside " and enter insert mode
"

" Don't try to be vi compatible
set nocompatible

" Helps force plugins to lentsentststjjkad correctly when it is turned back on below
filetype off

" TODO: Load plugins here (pathogen or vundle)

" Turn on syntax highlighting
let python_highlight_all=1
syntax on

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
" let mapleader = ","

" Security
set modelines=0

" Show line numbers
set number relativenumber
" set relativenumber

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Whitespace
set nowrap
set textwidth=0
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" cursor highlight
:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

autocmd FileType cobol setlocal indentexpr=
autocmd BufNewFile,BufRead *.v,*.sv set syntax=verilog
au BufRead,BufNewFile *.rdl set filetype=systemrdl

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


" Folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
nnoremap <space> za
vnoremap <space> zf

" Just good commands to have
:nmap ; :

" Python stuff
au BufNewFile,BufRead *.py
    \set tabstop=4
    \set softtabstop=4
    \set shiftwidth=4
    \set textwidth=100
    \set expandtab
    \set autoindent
    \set fileformat=unix



" Vundle stuff
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" Heavily inspired by:
" https://realpython.com/vim-and-python-a-match-made-in-heaven/
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'tpope/vim-fugitive'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}


" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Dracula colorscheme
" colorscheme dracula
