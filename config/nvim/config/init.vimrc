call plug#begin('~/.config/nvim/plugged')

"----- Config
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-projectionist'
Plug 'rking/ag.vim'             " Silver Searcher
Plug 'tpope/vim-fugitive'       " Git integration
Plug 'rizzatti/dash.vim'        " Dash integration
Plug 'neomake/neomake'
Plug 'kassio/neoterm'
Plug 'janko-m/vim-test'         " Test runner

"----- UI
Plug 'vim-airline/vim-airline'        " Airline statusbar
Plug 'vim-airline/vim-airline-themes' " UI themes for Airline
Plug 'powerline/fonts'                " UI Symbols for Airline
Plug 'lifepillar/vim-solarized8'      " Text color scheme
Plug 'Yggdroot/indentLine'            " Indent guide
Plug 'hecal3/vim-leader-guide'
Plug 'majutsushi/tagbar'
Plug 'junegunn/vim-peekaboo'

"----- Navigation
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kien/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'

"----- Text Operation
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'kana/vim-textobj-user'

"----- Languages/Frameworks
Plug 'sheerun/vim-polyglot'   " Load language support when needed
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'c-brenn/phoenix.vim'
Plug 'slashmili/alchemist.vim'
Plug 'elixir-lang/vim-elixir'

call plug#end()
