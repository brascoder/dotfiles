require("nvim-treesitter.configs").setup {
  ensure_installed = {"ruby", "javascript", "elixir", "lua"},
  highlight = {enable = true},
  indent = {enable = true},
  context_commentstring = {
    enable = true,
  },
  matchup = {
    enable = true,
  }
}
