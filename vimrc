runtime macros/matchit.vim
let mapleader=" "
set nocompatible

"----- Initialize Plug
call plug#begin('~/.config/nvim/plugged')

"----- Plugins -------------------------

"----- Config --------------------------
" Tab completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
Plug 'tpope/vim-projectionist'
Plug 'rking/ag.vim'             " Silver Searcher
Plug 'tpope/vim-fugitive'       " Git integration
" Plug 'mtth/scratch.vim'         " Scratch buffer
Plug 'rizzatti/dash.vim'        " Dash integration
Plug 'neomake/neomake'
  " Run Neomake on save
  augroup localneomake
    autocmd! BufWritePost * Neomake
  augroup END
  " No smartquotes in markdown
  let g:neomake_markdown_enabled_makers = []
  let g:neomake_elixir_enabled_makers = ['mix', 'credo']
Plug 'kassio/neoterm'
" Plug 'tpope/vim-sensible'       " Set sensible defaults
" Plug 'scrooloose/syntastic.git' " Syntax checking
" Plug 'janko-m/vim-test'         " Test runner
"----- End Config ----------------------

"----- UI Plugins ----------------------
Plug 'vim-airline/vim-airline'          " Airline statusbar
Plug 'vim-airline/vim-airline-themes'   " UI themes for Airline
  let g:airline_theme = 'solarized'
Plug 'powerline/fonts'                  " UI Symbols for Airline
  let g:airline_powerline_fonts = 1
Plug 'lifepillar/vim-solarized8' " Text color scheme
" Plug 'altercation/vim-colors-solarized' " Text color scheme
" Plug 'Yggdroot/indentLine'              " Indent guide
"----- End UI Plugins ------------------

"----- Navigation ----------------------
Plug 'scrooloose/nerdtree'
  let NERDTreeShowHidden=1
  nnoremap <leader>pt :NERDTreeToggle<CR>
  nnoremap <leader>ft :NERDTreeFind<CR>
  nnoremap <leader>0 :NERDTreeFocus<CR> :vertical resize 31<CR>
Plug 'kien/ctrlp.vim'
  let g:ctrlp_show_hidden = 1
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
"----- End Navigation ------------------

"----- Text Operation ------------------
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
  imap <c-space> <plug>snipMateNextOrTrigger
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
" Plug 'ervandew/supertab'
" Plug 'kana/vim-textobj-user'
"----- End Text Operation --------------

"----- Languages/Frameworks ------------

Plug 'sheerun/vim-polyglot'   " Load language support when needed

"------- Ruby/Rails
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
" Plug 'nelstrom/vim-textobj-rubyblock'

"------- Elixir/Phoenix
Plug 'c-brenn/phoenix.vim'
Plug 'slashmili/alchemist.vim'
Plug 'elixir-lang/vim-elixir'

"------- JavaScript
" Plug 'othree/javascript-libraries-syntax.vim'
" Plug 'isRuslan/vim-es6'

"----- End Languages/Frameworks --------

call plug#end()
"----- End Plugins ---------------------


"----- UI ------------------------------
syntax enable
set background=dark
colorscheme solarized8_dark
" colorscheme solarized
set title                           " show file name in tab title
" set hidden                          " hide buffer when opening new buffer
set autoindent
set showmatch
set relativenumber                  " show relative line numbers
set number                          " show current line number with relative line numbers
set backspace=indent,eol,start      " Backspace through anything
set listchars=tab:▸\ ,eol:¬,trail:· " Define invisible sysbols
set list                            " Start with symbols on
nnoremap <leader>l :set list!<cr>

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
nnoremap <leader>wd :q<cr>
nnoremap <leader>wv :vsp<cr>
nnoremap <leader>ws :sp<cr>


"----- Environment ---------------------

filetype indent on
filetype plugin on
set ts=2 sts=2 sw=2 expandtab
set encoding=utf-8
set noswapfile
set visualbell
set shell=/usr/local/bin/zsh
set mouse=a
set complete+=i,kspell
nnoremap <leader>aa :setlocal spell!<cr>
nnoremap <leader>rr :reg<cr>
nnoremap <leader>qq :qa<cr>
nnoremap <leader>qQ :qa!<cr>

"----- Cursor
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

"----- Files
nnoremap <leader>ff :CtrlP<cr>
nnoremap <leader>fs :w<cr>
nnoremap <leader>fS :wa<cr>
nnoremap <leader>fx :x<CR>

"----- Search
set nohls
set ignorecase
set hlsearch
set smartcase
set incsearch
nnoremap <leader>hh :nohl<cr>
nnoremap <leader>ht :set hlsearch!<cr>
nnoremap <leader>/ :Ag!<space>

"----- Buffers
nnoremap <leader>br :e!<cr>
nnoremap <leader>bR :bufdo e!<cr>:syntax enable<cr>
nnoremap <leader>bd :bd<cr>
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bp<cr>
nnoremap <leader>bb :CtrlPBuffer<CR>

"----- Git
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gb :Gblame<cr>

"----- Terminal
if has('nvim') " Terminal
  tnoremap <esc> <c-\><c-n>
  nnoremap <leader>tt :T<space>
  nnoremap <leader>th :call neoterm#toggle()<cr>
  nnoremap <leader>tl :call neoterm#clear()<cr>
  nnoremap <leader>tc :call neoterm#kill()<cr>
  " nnoremap <leader>ts :sp term://.//zsh<cr>i
  " nnoremap <leader>tv :vs term://.//zsh<cr>i
endif

" - Enable Ctrl-h for Neovim
nnoremap <silent> <bs> :TmuxNavigateLeft<cr>


"----- Editing -------------------------

"----- Insert lines
inoremap <C-j> <ESC>o
inoremap <C-k> <ESC>O
nnoremap <leader>ij o<ESC>
nnoremap <leader>ik O<ESC>

"----- Split/Join
nnoremap <leader>xn i<cr><esc>
nnoremap <leader>xj J

"----- Align
vnoremap <leader>xaa :Tab /
vnoremap <leader>xa: :Tab /:\zs<cr>

"----- Move lines
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv


" Commands
command! Resource source $MYVIMRC
nnoremap <leader>feR :Resource<cr>
