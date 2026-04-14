local g = vim.g

require("lazy").setup({

  -- Config
  { "junegunn/fzf", build = function() vim.fn["fzf#install"]() end },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  { "preservim/vimux" },
  { "tpope/vim-dispatch" },
  { "tpope/vim-fugitive" },
  { "kdheepak/lazygit.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  { "tpope/vim-projectionist" },
  { "tpope/vim-repeat" },
  { "vim-scripts/bufonly.vim" },
  { "vim-test/vim-test" },
  { "github/copilot.vim" },

  -- UI
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { { "nvim-tree/nvim-web-devicons", optional = true } },
    config = function()
      require("lualine").setup { options = { theme = "tokyonight" } }
    end,
  },
  { "junegunn/vim-peekaboo" },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function() require("nvim-tree").setup() end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function() require("gitsigns").setup() end,
  },
  { "folke/tokyonight.nvim" },
  { "navarasu/onedark.nvim" },
  { "EdenEast/nightfox.nvim" },
  { "ishan9299/nvim-solarized-lua" },
  {
    "norcalli/nvim-colorizer.lua",
    config = function() require("colorizer").setup() end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function() require("config.treesitter") end,
  },
  { "onsails/lspkind-nvim" },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = { preset = "modern" },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },

  -- Navigation
  { "christoomey/vim-tmux-navigator" },
  {
    "smoka7/hop.nvim",
    config = function() require("config.hop") end,
  },

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    config = function() require("config.cmp") end,
  },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-nvim-lua" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-calc" },
  { "ray-x/cmp-treesitter" },
  { "quangnguyen30192/cmp-nvim-tags" },
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  { "saadparwaiz1/cmp_luasnip" },

  -- Text Operations
  { "andymass/vim-matchup" },
  { "godlygeek/tabular" },
  { "JoosepAlviste/nvim-ts-context-commentstring" },
  { "mattn/emmet-vim" },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },
  {
    "numToStr/Comment.nvim",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    config = function()
      require("Comment").setup({
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      { "nvim-tree/nvim-web-devicons", optional = true },
    },
    config = function() require("render-markdown").setup({}) end,
  },

  -- Languages/Frameworks
  {
    "williamboman/mason.nvim",
    config = function() require("mason").setup() end,
  },
  { "neovim/nvim-lspconfig", config = false },
  { "tpope/vim-bundler" },
  { "tpope/vim-rails" },

}, {
  ui = { border = "rounded" },
})

-- vim-test
g["test#ruby#rspec#executable"] = "bin/rspec"
g["test#strategy"] = "vimux"

-- vimux
g.VimuxOrientation = "v"
g.VimuxHeight = "25%"
