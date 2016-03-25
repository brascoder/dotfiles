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
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'isRuslan/vim-es6'
Plugin 'scrooloose/nerdtree'
Plugin 'powerline/fonts'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'mxw/vim-jsx'
Plugin 'kchmck/vim-coffee-script'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'elixir-lang/vim-elixir'

call vundle#end()

filetype indent on
filetype plugin on

" Cursor
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7\<Esc>\\"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7\<Esc>\\"
endif


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
set list!
let g:ctrlp_dont_split = 'netrw'
set guioptions-=L
set guioptions-=r
set shell=/usr/local/bin/zsh


" Key Mappings
let mapleader=" "
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
