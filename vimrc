set nocompatible
runtime macros/matchit.vim

filetype on
filetype indent on
filetype plugin on

execute pathogen#infect()

syntax enable
set background=dark
let g:solarized_termcolors = 256
colorscheme solarized

let mapleader=" "
map <C-h> <C-c>
map! <C-h> <C-c>
nmap <leader>w :w<CR>

set relativenumber
set ts=2 sts=2 sw=2 expandtab
set autoindent
set ignorecase
set hlsearch
set backspace=indent,eol,start
set smartcase
set incsearch
set showmatch
set noswapfile
set visualbell
set cursorline

autocmd VimResized * :wincmd =
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"


nmap <leader>l :set list!<CR>
nmap <leader>\ :NERDTreeToggle<CR>
let g:ctrlp_dont_split = 'netrw'
set listchars=tab:▸\ ,eol:¬

