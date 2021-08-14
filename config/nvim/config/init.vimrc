call plug#begin('~/.config/nvim/plugged')

"----- Config
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'       " Git integration
Plug 'rhysd/devdocs.vim'        " DevDocs integration
Plug 'kassio/neoterm'
Plug 'tpope/vim-repeat'         " Extra repeat support
Plug 'janko-m/vim-test'         " Test runner
Plug '/usr/local/opt/fzf'       " FZF utility
Plug 'junegunn/fzf.vim'         " FZF plugin
Plug 'vim-scripts/bufonly.vim'      " Kill all other buffers

"----- UI
Plug 'vim-airline/vim-airline'        " Airline statusbar
Plug 'vim-airline/vim-airline-themes' " UI themes for Airline
Plug 'powerline/fonts'                " UI Symbols for Airline
Plug 'airblade/vim-gitgutter'         " Git status in the gutter
Plug 'lifepillar/vim-solarized8'      " Text color scheme
Plug 'Yggdroot/indentLine'            " Indent guide
Plug 'spinks/vim-leader-guide'
Plug 'majutsushi/tagbar'
Plug 'junegunn/vim-peekaboo'
Plug 'ap/vim-css-color'

"----- Navigation
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
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
Plug 'terryma/vim-multiple-cursors'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

"----- Languages/Frameworks
Plug 'neovim/nvim-lspconfig'
Plug 'sheerun/vim-polyglot'   " Load language support when needed
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'c-brenn/phoenix.vim'
Plug 'slashmili/alchemist.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'tpope/vim-projectionist'
Plug 'mmorearty/elixir-ctags'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': './install.sh' }

call plug#end()
