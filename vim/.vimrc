" A small vim guide:
"   use: f(     To go to nearest '('
"   use: vi'    TO mark everything inside single quotes
"   use: vi"    To mark everything inside double quotes
"   use: vib    To mark everything inside paranthesis
"   use: viB    To mark everything inside curly braces
"   use: ci"    To delete everything inside " and enter insert mode
"

" Don't try to be vi compatible
set nocompatible              " required
filetype off                  " required

" Stop buffers from doing weird shit to me!
set hidden

set nu


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/vim-slash'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'rstacruz/vim-closer'
Plugin 'jremmen/vim-ripgrep'
Plugin 'scrooloose/nerdtree'
"Plugin 'scrooloose/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'wfxr/minimap.vim'
Plugin 'junegunn/rainbow_parentheses.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'iamcco/markdown-preview.nvim'
Plugin 'tpope/vim-unimpaired'
Plugin 'preservim/nerdcommenter'
Plugin 'lervag/vimtex'

" Indentation
let g:indent_guides_enable_on_vim_startup = 1

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
nnoremap <space> za
vnoremap <space> zf

" Set guifont
"set guifont=Fira\ Code:h14

" ------------------------------------------
" Python styling
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set colorcolumn=+1 |        " highlight column after 'textwidth'
    \ highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

let python_highlight_all=1
syntax on
" ------------------------------------------

" ------------------------------------------
" C styling
au BufNewFile,BufRead *.c,*.h
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set colorcolumn=+1 |        " highlight column after 'textwidth'
    \ highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
" ------------------------------------------

" ------------------------------------------
" Verilog & Digital HDL styling
au BufNewFile,BufRead *.rdl
    \ set filetype=systemrdl |
    \ highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

" autocmd BufNewFile,BufRead *.v,*.sv set syntax=verilog
au BufNewFile,BufRead *.v,*.sv
    \ set syntax=verilog |
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set colorcolumn=+1 |        " highlight column after 'textwidth'
    \ highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
" ------------------------------------------

" ------------------------------------------
" Markdown 
au BufNewFile,BufRead *.md
    \ set syntax=markdown |
    \ setlocal spell |
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set colorcolumn=+1 |        " highlight column after 'textwidth'
    \ highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
" ------------------------------------------

" ------------------------------------------
" For some reason I have a cobol setting...
autocmd FileType cobol setlocal indentexpr=
" ------------------------------------------

" ------------------------------------------
" Kicad related files
au BufReadPost *.kicad_dbl set syntax=json
" ------------------------------------------

" Match bad whitespace in files.
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Remap leader key
nnoremap <SPACE> <Nop>
let mapleader=" "

set encoding=utf-8

" ------------------------------------------
" Dracula color scheme settings
set t_Co=256
let g:dracula_colorterm = 0
let g:dracula_italic = 0 " Set this, otherwise you get a weird BG color
" Dracula color scheme
if v:version < 802
    packadd! dracula
endif
syntax enable
colorscheme dracula
" ------------------------------------------


" ------------------------------------------
" Youcomplete me settings
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
" ------------------------------------------

" Security
"set modelines=0
set nomodeline

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

" I have no idea what this does
set ai
set si
set lbr
set tw=500

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
"map <neader><space> :let @/=''<cr> " clear search

" cursor highlight
set cursorline
set cursorcolumn
" If you rather want to set it manually, comment out the previous two lines
" and uncomment the one below.
":nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" ------------------------------------------
" Indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_start_level = 2
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=238
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven 	ctermbg=8
" ------------------------------------------

" ------------------------------------------
" Minimap control
let g:minimap_width = 10
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1
" ------------------------------------------

" ------------------------------------------
" Rainbow paranthesis
" Activation based on file type
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme,c,python RainbowParentheses
augroup END
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']']]
" List of colors that you do not want. ANSI code or #RRGGBB
let g:rainbow#blacklist = [233, 234]
" ------------------------------------------

" ------------------------------------------
" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1

"if !exists('g:airline_symbols')
"    let g:airline_symbols = {} 
"    let g:airline_left_sep = '▶'
"    let g:airline_right_sep = '◀'
"endif
" ------------------------------------------

" ------------------------------------------
" Setup nerdcommenter
filetype plugin on
"Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
" ------------------------------------------

" ------------------------------------------
" Setup vimtex 
" Use '<leader>ll' to compile
" Use '<leader>lk' to stop compilation (kill)
" Use '<leader>lc' to clear auxilliary files.
let g:vimtex_view_method='skim'
let g:vimtex_compiler_method = 'latexmk'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol .
let maplocalleader = " "
" ------------------------------------------


" Setup NERDTree keybinds
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Setup Buffers
nnoremap <silent> <C-b> :Buffers<CR>
