require("nvim-treesitter.configs").setup {
  sync_install = false,
  auto_install = true,
  ensure_installed = {
    "eex",
    "elixir",
    "erlang",
    "heex",
    "html",
    "javascript",
    "lua",
    "markdown",
    "markdown_inline",
    "ruby",
    "surface",
    "tsx",
    "typescript",
  },
  ignore_install = {},
  highlight = { enable = false },
  indent = { enable = true },
  matchup = {
    enable = true
  },
  textobjects = {
    enable = true,
  }
}
