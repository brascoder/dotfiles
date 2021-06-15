local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

require('packer').startup(function(use)
  -- Config
  use 'wbthomason/packer.nvim'
  use {'junegunn/fzf', run = function() fn['fzf#install']() end}
  use 'junegunn/fzf.vim'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-repeat'
  use 'vim-scripts/bufonly.vim'

  -- UI
  use 'airblade/vim-gitgutter'
  use 'ap/vim-css-color'
  use 'hecal3/vim-leader-guide'
  use 'junegunn/vim-peekaboo'
  use 'lifepillar/vim-solarized8'
  use 'majutsushi/tagbar'
  use {'nvim-treesitter/nvim-treesitter', run = function() vim.cmd [[TSUpdate]] end}
  use 'powerline/fonts'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'Yggdroot/indentLine'

  -- Navigation
  use 'christoomey/vim-tmux-navigator'
  use 'easymotion/vim-easymotion'
  use 'scrooloose/nerdtree'
  use 'Xuyuanp/nerdtree-git-plugin'

  -- Text Operation
  use 'hrsh7th/nvim-compe'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use 'mattn/emmet-vim'
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'

  -- Languages/Frameworks
  use 'elixir-editors/vim-elixir'
  use 'neovim/nvim-lspconfig'
  use 'sheerun/vim-polyglot'
  use 'tpope/vim-bundler'
  use 'tpope/vim-projectionist'
  use 'tpope/vim-rails'
end)
