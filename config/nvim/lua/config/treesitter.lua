require("nvim-treesitter").setup({
  ensure_installed = {
    "dart",
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
    "tsx",
    "typescript",
  },
  auto_install = true,
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function(ev)
    pcall(vim.treesitter.start, ev.buf)
  end,
})
