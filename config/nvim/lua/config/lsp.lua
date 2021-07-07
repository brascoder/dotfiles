local lspconfig = require("lspconfig")
local path_to_elixir = vim.fn.expand("~/.elixir-ls/language_server.sh")
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(_, bufnr)
  local function map(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local map_opts = {noremap = true, silent = true}

  map("n", "df", [[<cmd>lua vim.lsp.buf.formatting()<CR>]], map_opts)
  map("n", "gd", [[<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>]], map_opts)
  map("n", "dt", [[<cmd>lua vim.lsp.buf.definition()<CR>]], map_opts)
  map("n", "K", [[<cmd>lua vim.lsp.buf.hover()<CR>]], map_opts)
  map("n", "gD", [[<cmd>lua vim.lsp.buf.implementation()<CR>]], map_opts)
  map("n", "<c-k>", [[<cmd>lua vim.lsp.buf.signature_help()<CR>]], map_opts)
  map("n", "1gD", [[<cmd>lua vim.lsp.buf.type_definition()<CR>]], map_opts)
end

lspconfig.elixirls.setup({
  cmd = path_to_elixirls,
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    elixirLS = {
      dialyzerEnabled = false,
      fetchDeps = false
    }
  }
})

lspconfig.solargraph.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    solargraph = {
      diagnostics = true,
      formatting = true
    }
  }
})

-- lspconfig.efm.setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
--   filetypes = {
--     "elixir",
--     "javascript",
--     "lua",
--     "bash",
--     "zsh",
--     "on"
--   }
-- })
