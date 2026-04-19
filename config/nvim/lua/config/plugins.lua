require("lazy").setup({

  -- Config
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    config = function() require("neogit").setup() end,
  },
  { "tpope/vim-projectionist" },
  { "tpope/vim-repeat" },
  { "vim-scripts/bufonly.vim" },

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
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {},
  },
  {
    "j-hui/fidget.nvim",
    opts = {},
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "catgoose/nvim-colorizer.lua",
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
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      size = function(term)
        if term.direction == "horizontal" then return 15
        elseif term.direction == "vertical" then return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<C-\>]],
      direction = "horizontal",
      shade_terminals = false,
    },
  },

  -- Completion
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = { accept = false },
        },
        panel = { enabled = false },
      })
    end,
  },
  {
    "saghen/blink.cmp",
    version = "*",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
    },
    opts = {
      snippets = { preset = "luasnip" },
      keymap = {
        preset = "default",
        ["<Tab>"] = {
          function()
            local copilot = require("copilot.suggestion")
            if copilot.is_visible() then
              copilot.accept()
              return true
            end
          end,
          "snippet_forward",
          "fallback",
        },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      completion = {
        accept = { auto_brackets = { enabled = false } },
        documentation = { auto_show = true },
      },
    },
  },

  -- AI
  { "brianhuster/unnest.nvim" },
  {
    "coder/claudecode.nvim",
    config = function()
      require("claudecode").setup({
        terminal_provider = "native",
        diff_opts = {
          open_in_new_tab = true,
        },
        env = {
          EDITOR = "nvr --nostart --remote-wait-silent",
        },
      })
    end,
  },

  -- Editing
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({ check_ts = true })
    end,
  },

  -- Text Operations
  { "andymass/vim-matchup" },
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {},
  },
  { "godlygeek/tabular" },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
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
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "efm",
          "emmet-ls",
          "eslint-lsp",
          "lua-language-server",
          "prettier",
          -- "solargraph",
          "tailwindcss-language-server",
          "typescript-language-server",
          "js-debug-adapter",
        },
      })
    end,
  },
  { "neovim/nvim-lspconfig", config = false },
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    config = function() require("config.conform") end,
  },
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim", "stevearc/dressing.nvim" },
    config = function()
      local shared = require("config.lsp_shared")
      require("flutter-tools").setup({
        lsp = {
          capabilities = shared.capabilities,
        },
      })
    end,
  },
  { "tpope/vim-bundler" },
  { "tpope/vim-rails" },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "jfpedroza/neotest-elixir",
      "nvim-neotest/neotest-jest",
    },
    config = function() require("config.neotest") end,
  },

  -- Debugging
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
      "mxsdev/nvim-dap-vscode-js",
    },
    config = function() require("config.dap") end,
  },

}, {
  ui = { border = "rounded" },
})


