local lspconfig = require("lspconfig")
local path_to_elixirls = vim.fn.expand("~/.elixir-ls/language_server.sh")
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

local on_attach = function(_, bufnr)
  print("Attached to language server")

  local function map(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local opts = {noremap = true, silent = true}

  map("n", "<Leader>lc", [[<cmd>lua vim.lsp.codelens.run()<CR>]], opts)
  map("n", "<Leader>ld", [[<cmd>lua vim.lsp.buf.definition()<CR>]], opts)
  map("n", "<Leader>lD", [[<cmd>lua vim.lsp.buf.implementation()<CR>]], opts)
  map("n", "<Leader>lf", [[<cmd>lua vim.lsp.buf.format({ async = true })<CR>]], opts)
  map("n", "<Leader>lh", [[<cmd>lua vim.lsp.buf.hover()<CR>]], opts)
  map("n", "<Leader>lH", [[<cmd>lua vim.lsp.buf.signature_help()<CR>]], opts)
  map("n", "<Leader>ll", [[<cmd>lua vim.diagnostic.open_float()<CR>]], opts)
  map("n", "<Leader>lL", [[<cmd>LspLog<CR>]], opts)
  map("n", "<Leader>lt", [[<cmd>lua vim.lsp.buf.type_definition()<CR>]], opts)

  require("cmp_nvim_lsp").default_capabilities(capabilities)
end

lspconfig.elixirls.setup({
  cmd = {path_to_elixirls},
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    elixirLS = {
      dialyzerEnabled = true,
      enableTestLenses = true,
      fetchDeps = false
    }
  }
})

lspconfig.solargraph.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  init_options = {
    formatting = true
  },
  settings = {
    solargraph = {
      diagnostics = true,
    }
  }
})

lspconfig.tsserver.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig.html.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "html", "eelixir", "heex", "eruby" }
})

lspconfig.efm.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = {
    "elixir",
    "javascript",
    "lua",
    "bash",
    "zsh",
    "html",
    "on"
  }
})
