local execute = vim.api.nvim_command
local fn = vim.fn
local g = vim.g

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
  use {"kristijanhusak/orgmode.nvim", config = [[require("orgmode").setup_ts_grammar()]]}
  use {
    "nvim-telescope/telescope.nvim",
    requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
  }
  use "preservim/vimux"
  use "tpope/vim-dispatch"
  use "tpope/vim-fugitive"
  use "tpope/vim-projectionist"
  use "tpope/vim-repeat"
  use "vim-scripts/bufonly.vim"
  use "vim-test/vim-test"

  -- UI
  use {'famiu/feline.nvim', config = [[require("feline").setup({theme = "nightfox"})]]}
  use "junegunn/vim-peekaboo"
  use {
    "kyazdani42/nvim-tree.lua",
    requires = {"kyazdani42/nvim-web-devicons"},
    config = [[require("nvim-tree").setup()]]
  }
  use {
    "lewis6991/gitsigns.nvim",
    requires = {"nvim-lua/plenary.nvim"},
    config = [[require("gitsigns").setup()]]
  }
  use "navarasu/onedark.nvim"
  use "EdenEast/nightfox.nvim"
  use "ishan9299/nvim-solarized-lua"
  use {"norcalli/nvim-colorizer.lua", config = [[require("colorizer").setup()]]}
  use {"nvim-treesitter/nvim-treesitter", run = [[:TSUpdate]], config = [[require("config.treesitter")]]}
  use "onsails/lspkind-nvim"
  use {"powerline/fonts", config = [[vim.g.airline_powerline_fonts = 1]]}
  use {"spinks/vim-leader-guide", config = [[require("config.leader")]]}
  use {"Yggdroot/indentLine", config = [[vim.g.indentLine_color_gui = "#4c4c4b"]]}

  -- Navigation
  use "christoomey/vim-tmux-navigator"
  use {"phaazon/hop.nvim", config = [[require("config.hop")]]}

  -- Completion
  use {"hrsh7th/nvim-cmp", config = [[require("config.cmp")]]}
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-vsnip"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-calc"
  use "ray-x/cmp-treesitter"
  use "quangnguyen30192/cmp-nvim-tags"

  -- Text Operation
  use "andymass/vim-matchup"
  use "godlygeek/tabular"
  use "hrsh7th/vim-vsnip"
  use "hrsh7th/vim-vsnip-integ"
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "mattn/emmet-vim"
  use "rafamadriz/friendly-snippets"
  use "tpope/vim-commentary"
  use "tpope/vim-surround"

  -- Languages/Frameworks
  use "elixir-editors/vim-elixir"
  use {"neovim/nvim-lspconfig", config = [[require("config.lsp")]]}
  use "sheerun/vim-polyglot"
  use "tpope/vim-bundler"
  use "tpope/vim-rails"
end)

-- vim-test
g["test#ruby#rspec#executable"] = "bin/rspec"
g["test#strategy"] = "vimux"

-- vimux
g.VimuxOrientation = "h"
g.VimuxHeight = "25"
