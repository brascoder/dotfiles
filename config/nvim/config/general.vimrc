let mapleader=" "
set nocompatible
syntax enable
set termguicolors
set background=dark
colorscheme solarized8
filetype indent on
filetype plugin on
autocmd VimResized * :wincmd =
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

set autoindent
set backspace=indent,eol,start      " Backspace through anything
set cmdheight=2
set complete+=i,kspell
set cursorcolumn
set cursorline
set encoding=utf-8
set guioptions-=L                   " Remove scrollbars
set guioptions-=r                   " Remove scrollbars
set hidden
set hlsearch
set ignorecase
set inccommand=nosplit
set incsearch
set list                            " Start with symbols on
set listchars=tab:▸\ ,eol:¬,trail:· " Define invisible sysbols
set mouse=a
set nobackup
set nohls
set noswapfile
set nowritebackup
set number                          " show current line number with relative line numbers
set relativenumber                  " show relative line numbers
set shell=/usr/local/bin/zsh
set shortmess+=c
set showmatch
set signcolumn=yes
set smartcase
set splitbelow
set splitright
set title                           " show file name in tab title
set ts=2 sts=2 sw=2 expandtab
set updatetime=300
set visualbell
