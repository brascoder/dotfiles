require("conform").setup({
  formatters_by_ft = {
    elixir          = { "mix" },
    eelixir         = { "mix" },
    heex            = { "mix" },
    javascript      = { "prettier" },
    javascriptreact = { "prettier" },
    typescript      = { "prettier" },
    typescriptreact = { "prettier" },
    json            = { "prettier" },
    html            = { "prettier" },
    css             = { "prettier" },
    dart            = { "dart_format" },
  },
  format_on_save = function(bufnr)
    if not vim.g.conform_format_on_save then return nil end
    local name = vim.api.nvim_buf_get_name(bufnr)
    if name:match("/node_modules/") or name:match("/_build/") then return nil end
    return { timeout_ms = 2000, lsp_fallback = true }
  end,
})
