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
    "ruby",
    "surface",
    "tsx",
    "typescript",
  },
  ignore_install = {},
  highlight = { enable = false },
  indent = { enable = true },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["if"] = "@function.inner",
        ["af"] = "@function.outer",
      },
    },
  }
}
