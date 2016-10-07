runtime macros/matchit.vim
let mapleader=" "

"----- Setup Vundle --------------------
set nocompatible " Required
filetype off     " Required

"----- Initialize Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"----- Plugins -------------------------

Plugin 'gmarik/Vundle.vim' " Use Vundle to manage Vundle

"----- Config --------------------------
Plugin 'tpope/vim-sensible'       " Set sensible defaults
Plugin 'scrooloose/syntastic.git' " Syntax checking
Plugin 'rizzatti/dash.vim'        " Dash integration
Plugin 'rking/ag.vim'             " Silver Searcher
Plugin 'janko-m/vim-test'         " Test runner
Plugin 'tpope/vim-fugitive'       " Git integration
"----- End Config ----------------------

"----- UI Plugins ----------------------
Plugin 'vim-airline/vim-airline'          " Airline statusbar
Plugin 'vim-airline/vim-airline-themes'   " UI themes for Airline
  let g:airline_theme = 'raven'
Plugin 'powerline/fonts'                  " UI Symbols for Airline
  let g:airline_powerline_fonts = 1
Plugin 'altercation/vim-colors-solarized' " Text color scheme
Plugin 'NLKNguyen/papercolor-theme'       " Text color scheme
Plugin 'Yggdroot/indentLine'              " Indent guide
"----- End UI Plugins --------------------------

"----- Navigation ----------------------
Plugin 'scrooloose/nerdtree'
  let NERDTreeShowHidden=1
  nnoremap <leader>\ :NERDTreeToggle<CR>
  nnoremap « :NERDTreeFocus<CR> :vertical resize 31<CR>
Plugin 'kien/ctrlp.vim'
  nnoremap π :CtrlPBuffer<CR>
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'easymotion/vim-easymotion'
"----- End Navigation ------------------

"----- Text Operation ------------------
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'ervandew/supertab'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'kana/vim-textobj-user'
Plugin 'godlygeek/tabular'
"----- End Text Operation --------------

"----- File Types ----------------------

"------- Markup
Plugin 'othree/html5.vim'

"------- Ruby
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'nelstrom/vim-textobj-rubyblock'

"------- Elixir
Plugin 'elixir-lang/vim-elixir'
Plugin 'slashmili/alchemist.vim'

"------- Elm
Plugin 'lambdatoast/elm.vim'

"------- JavaScript
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'isRuslan/vim-es6'

"------- React
Plugin 'mxw/vim-jsx'

"------- Coffee Script
Plugin 'kchmck/vim-coffee-script'

"------- Sass
Plugin 'cakebaker/scss-syntax.vim'

"------- Docker
Plugin 'ekalinin/Dockerfile.vim'

"----- End File Types ------------------

call vundle#end()
"----- End Plugins ---------------------


"----- Environment ---------------------
filetype indent on
filetype plugin on
set ts=2 sts=2 sw=2 expandtab
set encoding=utf-8
set noswapfile
set visualbell
set shell=/usr/local/bin/zsh
set mouse=a
nnoremap ® :bufdo e!<CR>:syntax enable<CR>

"----- Search --------------------------
set nohls
set ignorecase
set hlsearch
set smartcase
set incsearch
nnoremap <leader>h :set hlsearch!<CR>
nnoremap <leader>s :Ag<Space>


"----- UI ------------------------------
syntax enable
set background=dark
" colorscheme tomorrow-night-eighties
colorscheme PaperColor
set guifont=dejavu_sans_mono_for_powerline:h12
set autoindent
set showmatch
set relativenumber                  " show relative line numbers
set number                          " show current line number with relative line numbers
set backspace=indent,eol,start      " Backspace through anything
set listchars=tab:▸\ ,eol:¬,trail:· " Define invisible sysbols
set list                            " Start with symbols on
nnoremap <leader>l :set list!<CR>

"---- Remove scrollbars
set guioptions-=L
set guioptions-=r

"----- Window
autocmd VimResized * :wincmd =
nnoremap – :wincmd _<cr>:wincmd \|<cr>
nnoremap ≠ :wincmd =<cr>
let g:ctrlp_dont_split = 'netrw'
set splitbelow
set splitright

set cursorline
if has('nvim') " Cursor shape
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
elseif exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


"----- Neovim
if has('nvim') " Terminal
  tnoremap <ESC> <C-\><C-n>
  nnoremap <leader>T :te<CR>
  nnoremap <leader>ts :sp term://.//zsh<CR>i
  nnoremap <leader>tv :vs term://.//zsh<CR>i
endif

" - Enable Ctrl-h for Neovim
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>


" Editing
inoremap <C-@> <ESC>
inoremap <C-_> <ESC>O
nnoremap <leader>o o<ESC>
nnoremap <leader>O O<ESC>
nnoremap <leader>w :w
nnoremap <leader>q :q
nnoremap <leader>Q :q!<CR>

" - Move lines
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv


" Commands
command! Resource source $MYVIMRC
