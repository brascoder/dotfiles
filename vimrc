set nocompatible
runtime macros/matchit.vim

" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" - Plugins
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'othree/html5.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'powerline/fonts'
Plugin 'vim-airline/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'othree/yajs.vim'
Plugin 'mxw/vim-jsx'
Plugin 'kchmck/vim-coffee-script'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'szw/vim-tags'
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'

call vundle#end()

filetype indent on
filetype plugin on

" Cursor
" let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
" let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
let &t_SI = "\<Esc>P\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>P\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"


" Color Theme
syntax enable
set background=dark
colorscheme tomorrow-night-eighties

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'tomorrow'
set guifont=droid_sans_mono_for_powerline:h12


" Options
set relativenumber
set ts=2 sts=2 sw=2 expandtab
set encoding=utf-8
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
set listchars=tab:▸\ ,eol:¬,trail:·
let g:ctrlp_dont_split = 'netrw'


" Key Mappings
let mapleader=" "
nmap <leader>w :w<CR>
nnoremap <leader>h :nohls<CR>
nnoremap <leader>l :set list!<CR>
nnoremap <leader>\ :NERDTreeToggle<CR>
vnoremap ≠ :Tabularize / /l0<CR>

" - Resize
autocmd VimResized * :wincmd =
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" - Ctags
nnoremap <C-'> <C-t>

" - Move lines
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv


" Commands
command! Resource source $MYVIMRC
