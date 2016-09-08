set nocompatible
runtime macros/matchit.vim

" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" - Plugins
" Config
Plugin 'tpope/vim-sensible'
Plugin 'powerline/fonts'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'NLKNguyen/papercolor-theme'
" General
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic.git'
Plugin 'tpope/vim-fugitive'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'rizzatti/dash.vim'
Plugin 'rking/ag.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Yggdroot/indentLine'
Plugin 'easymotion/vim-easymotion'
Plugin 'janko-m/vim-test'
" Text operation
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-commentary'
Plugin 'ervandew/supertab'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'kana/vim-textobj-user'
Plugin 'godlygeek/tabular'
" Language specific
Plugin 'othree/html5.vim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'elixir-lang/vim-elixir'
Plugin 'slashmili/alchemist.vim'
Plugin 'lambdatoast/elm.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'isRuslan/vim-es6'
Plugin 'mxw/vim-jsx'
Plugin 'kchmck/vim-coffee-script'
Plugin 'cakebaker/scss-syntax.vim'

call vundle#end()

filetype indent on
filetype plugin on

let mapleader=" "

" Cursor
if has('nvim')
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  tnoremap <ESC> <C-\><C-n>
  nnoremap <leader>T :te<CR>
  nnoremap <leader>ts :sp term://.//zsh<CR>
  nnoremap <leader>tv :vs term://.//zsh<CR>
elseif exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


" Color Theme
syntax enable
set background=dark
" colorscheme tomorrow-night-eighties
colorscheme PaperColor

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'raven'
set guifont=dejavu_sans_mono_for_powerline:h12


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
set list
set nohls
let g:ctrlp_dont_split = 'netrw'
set guioptions-=L
set guioptions-=r
set shell=/usr/local/bin/zsh
set mouse=a
set splitbelow
set splitright
let NERDTreeShowHidden=1


" Key Mappings
nnoremap <leader>h :set hlsearch!<CR>
nnoremap <leader>l :set list!<CR>
nnoremap <leader>\ :NERDTreeToggle<CR>

" - Resize
autocmd VimResized * :wincmd =
nnoremap – :wincmd _<cr>:wincmd \|<cr>
nnoremap ≠ :wincmd =<cr>
nnoremap « :NERDTreeFocus<CR> :vertical resize 31<CR>

" - Move lines
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" - Enable Ctrl-h for Neovim
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>


" Commands
command! Resource source $MYVIMRC
