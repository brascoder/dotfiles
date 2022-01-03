require("nvim-treesitter.configs").setup {
  ensure_installed = {"ruby", "javascript", "lua"},
  highlight = {enable = true},
  indent = {enable = false},
  context_commentstring = {enable = true},
  matchup = {enable = true}
}
