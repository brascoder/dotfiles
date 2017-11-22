let mapleader=" "
set nocompatible

"----- Environment
filetype indent on
filetype plugin on
set ts=2 sts=2 sw=2 expandtab
set encoding=utf-8
set noswapfile
set visualbell
set shell=/usr/local/bin/zsh
set mouse=a
set complete+=i,kspell
set nohls
set ignorecase
set hlsearch
set smartcase
set incsearch

"----- UI
syntax enable
set termguicolors
" let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
" let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
set background=dark
colorscheme solarized8_dark
set title                           " show file name in tab title
set autoindent
set showmatch
set relativenumber                  " show relative line numbers
set number                          " show current line number with relative line numbers
set inccommand=nosplit
set backspace=indent,eol,start      " Backspace through anything
set listchars=tab:▸\ ,eol:¬,trail:· " Define invisible sysbols
set list                            " Start with symbols on
set guioptions-=L                   " Remove scrollbars
set guioptions-=r                   " Remove scrollbars
autocmd VimResized * :wincmd =
let g:ctrlp_dont_split = 'netrw'
set splitbelow
set splitright
set cursorline
set cursorcolumn
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
