local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}
local ok, blink = pcall(require, "blink.cmp")
if ok then
  M.capabilities = vim.tbl_deep_extend("force", M.capabilities, blink.get_lsp_capabilities())
end

M.on_attach = function(_, bufnr)
  local function map(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap = true, silent = true }

  map("n", "<Leader>ld", [[<cmd>lua vim.lsp.buf.definition()<CR>]], opts)
  map("n", "<Leader>lD", [[<cmd>lua vim.lsp.buf.implementation()<CR>]], opts)
  map("n", "<Leader>lf", [[<cmd>lua require("conform").format({ async = true, lsp_fallback = true })<CR>]], opts)
  map("n", "<Leader>lh", [[<cmd>lua vim.lsp.buf.hover()<CR>]], opts)
  map("n", "<Leader>lH", [[<cmd>lua vim.lsp.buf.signature_help()<CR>]], opts)
  map("n", "<Leader>la", [[<cmd>lua vim.lsp.buf.code_action()<CR>]], opts)
  map("v", "<Leader>la", [[<cmd>lua vim.lsp.buf.code_action()<CR>]], opts)
  map("n", "<Leader>lr", [[<cmd>lua vim.lsp.buf.rename()<CR>]], opts)
  map("n", "<Leader>lR", [[<cmd>lua vim.lsp.buf.references()<CR>]], opts)
  map("n", "<Leader>ls", [[<cmd>Telescope lsp_document_symbols<CR>]], opts)
  map("n", "<Leader>lS", [[<cmd>Telescope lsp_workspace_symbols<CR>]], opts)
  map("n", "<Leader>li", [[<cmd>lua vim.lsp.buf.incoming_calls()<CR>]], opts)
  map("n", "<Leader>lw", [[<cmd>Telescope diagnostics<CR>]], opts)
  map("n", "<Leader>lt", [[<cmd>lua vim.lsp.buf.type_definition()<CR>]], opts)
  map("n", "<Leader>lL", [[<cmd>LspLog<CR>]], opts)
  map("n", "<Leader>dd", [[<cmd>lua vim.diagnostic.open_float()<CR>]], opts)
  map("n", "<Leader>dn", [[<cmd>lua vim.diagnostic.goto_next()<CR>]], opts)
  map("n", "<Leader>dp", [[<cmd>lua vim.diagnostic.goto_prev()<CR>]], opts)
end

return M
