call plug#begin('~/.config/nvim/plugged')

"----- Config
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-fugitive'       " Git integration
Plug 'rhysd/devdocs.vim'        " DevDocs integration
Plug 'neomake/neomake'
Plug 'kassio/neoterm'
Plug 'tpope/vim-repeat'         " Extra repeat support
Plug 'janko-m/vim-test'         " Test runner
Plug '/usr/local/opt/fzf'       " FZF utility
Plug 'junegunn/fzf.vim'         " FZF plugin

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
Plug 'ctrlpvim/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'

"----- Text Operation
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'sirver/ultisnips'
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
Plug 'tpope/vim-projectionist'

call plug#end()
