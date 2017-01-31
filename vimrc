runtime macros/matchit.vim
let mapleader=" "

"----- Initialize Plug
call plug#begin('~/.config/nvim/plugged')

"----- Plugins -------------------------

"----- Config --------------------------
" Tab completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" Plug 'tpope/vim-sensible'       " Set sensible defaults
" Plug 'scrooloose/syntastic.git' " Syntax checking
" Plug 'rizzatti/dash.vim'        " Dash integration
Plug 'rking/ag.vim'             " Silver Searcher
" Plug 'janko-m/vim-test'         " Test runner
Plug 'tpope/vim-fugitive'       " Git integration
Plug 'neomake/neomake'
  " Run Neomake on save
  augroup localneomake
    autocmd! BufWritePost * Neomake
  augroup END
  " No smartquotes in markdown
  let g:neomake_markdown_enabled_makers = []
"----- End Config ----------------------

"----- UI Plugins ----------------------
Plug 'vim-airline/vim-airline'          " Airline statusbar
Plug 'vim-airline/vim-airline-themes'   " UI themes for Airline
  let g:airline_theme = 'solarized'
Plug 'powerline/fonts'                  " UI Symbols for Airline
  let g:airline_powerline_fonts = 1
Plug 'altercation/vim-colors-solarized' " Text color scheme
" Plug 'Yggdroot/indentLine'              " Indent guide
"----- End UI Plugins --------------------------

"----- Navigation ----------------------
Plug 'scrooloose/nerdtree'
  let NERDTreeShowHidden=1
  nnoremap <leader>\ :NERDTreeToggle<CR>
  nnoremap « :NERDTreeFocus<CR> :vertical resize 31<CR>
Plug 'kien/ctrlp.vim'
  nnoremap π :CtrlPBuffer<CR>
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
"----- End Navigation ------------------

"----- Text Operation ------------------
Plug 'sheerun/vim-polyglot'   "Load language support when needed
" Plug 'mattn/emmet-vim'
" Plug 'tpope/vim-surround'
" Plug 'tpope/vim-commentary'
" Plug 'ervandew/supertab'
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'tomtom/tlib_vim'
" Plug 'garbas/vim-snipmate'
" Plug 'honza/vim-snippets'
" Plug 'kana/vim-textobj-user'
" Plug 'godlygeek/tabular'
"----- End Text Operation --------------

"----- File Types ----------------------

"------- Markup
" Plug 'othree/html5.vim'

"------- Ruby
" Plug 'tpope/vim-rails'
" Plug 'tpope/vim-bundler'
" Plug 'nelstrom/vim-textobj-rubyblock'

"------- Elixir
" Plug 'elixir-lang/vim-elixir'
" Plug 'slashmili/alchemist.vim'

"------- Elm
" Plug 'lambdatoast/elm.vim'

"------- JavaScript
" Plug 'pangloss/vim-javascript'
" Plug 'othree/javascript-libraries-syntax.vim'
" Plug 'isRuslan/vim-es6'

"------- React
" Plug 'mxw/vim-jsx'

"------- Coffee Script
" Plug 'kchmck/vim-coffee-script'

"------- Sass
" Plug 'cakebaker/scss-syntax.vim'

"------- Docker
" Plug 'ekalinin/Dockerfile.vim'

"----- End File Types ------------------

call plug#end()
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
map <CR> :nohl<CR>
nnoremap <leader>h :set hlsearch<CR>
nnoremap <leader>s :Ag<Space>


"----- UI ------------------------------
syntax enable
set background=dark
colorscheme solarized
set title
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
set cursorcolumn
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
vnoremap <C-@> <ESC>
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
