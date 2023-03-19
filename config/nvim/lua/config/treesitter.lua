require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "eex",
    "elixir",
    "erlang",
    "heex",
    "html",
    "javascript",
    "lua",
    "ruby",
    "surface",
    "tsx",
    "typescript",
  },
  highlight = {enable = true},
  indent = {enable = true},
  context_commentstring = {enable = true},
  matchup = {enable = true}
}
