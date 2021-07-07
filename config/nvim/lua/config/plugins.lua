local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
  execute "packadd packer.nvim"
end

require("packer").startup(function(use)
  -- Config
  use "wbthomason/packer.nvim"
  use {"junegunn/fzf", run = function() fn["fzf#install"]() end}
  use "junegunn/fzf.vim"
  use {
    "nvim-telescope/telescope.nvim",
    requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
  }
  use "tpope/vim-fugitive"
  use "tpope/vim-repeat"
  use "vim-scripts/bufonly.vim"

  -- UI
  use "airblade/vim-gitgutter"
  use "ap/vim-css-color"
  use "junegunn/vim-peekaboo"
  use "lifepillar/vim-solarized8"
  use {"nvim-treesitter/nvim-treesitter", run = [[:TSUpdate]], config = [[require("config.treesitter")]]}
  use {"powerline/fonts", config = [[vim.g.airline_powerline_fonts = 1]]}
  use {"spinks/vim-leader-guide", config = [[require("config.leader")]]}
  use "vim-airline/vim-airline"
  use {"vim-airline/vim-airline-themes", config = [[vim.g.airline_theme = "badwolf"]]}
  use {"Yggdroot/indentLine", config = [[vim.g.indentLine_color_gui = "#4c4c4b"]]}

  -- Navigation
  use "christoomey/vim-tmux-navigator"
  use {"phaazon/hop.nvim", config = [[require("config.hop")]]}
  use "scrooloose/nerdtree"
  use "Xuyuanp/nerdtree-git-plugin"

  -- Text Operation
  use "andymass/vim-matchup"
  use "godlygeek/tabular"
  use {"hrsh7th/nvim-compe", config = [[require("config.compe")]]}
  use "hrsh7th/vim-vsnip"
  use "hrsh7th/vim-vsnip-integ"
  use "mattn/emmet-vim"
  use "tpope/vim-commentary"
  use "tpope/vim-surround"

  -- Languages/Frameworks
  use "elixir-editors/vim-elixir"
  use {"neovim/nvim-lspconfig", config = [[require("config.lsp")]]}
  use "sheerun/vim-polyglot"
  use "tpope/vim-bundler"
  use "tpope/vim-projectionist"
  use "tpope/vim-rails"
end)
