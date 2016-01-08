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
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-sensible'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'kchmck/vim-coffee-script'
Plugin 'szw/vim-tags'

call vundle#end()

filetype indent on
filetype plugin on

" Cursor
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"


" Color Theme
syntax enable
set background=dark
let g:solarized_termcolors = 256
colorscheme solarized


" Options
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


" Key Mappings
let mapleader=" "
nmap <leader>w :w<CR>
nnoremap <leader>hl :noh
nnoremap <leader>l :set list!<CR>
nnoremap <leader>\ :NERDTreeToggle<CR>
let g:ctrlp_dont_split = 'netrw'
set listchars=tab:▸\ ,eol:¬

" - Resize 
autocmd VimResized * :wincmd =
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" - Ctags
nnoremap <leader>f <C-]>
nnoremap <leader>t <C-t>
nnoremap <leader>p :CtrlPTag<CR>

" - Move lines
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv


" Commands
command! Resource source $MYVIMRC
