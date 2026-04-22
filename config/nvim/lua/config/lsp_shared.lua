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
  local function map(mode, lhs, rhs, desc)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
  end

  map("n", "<Leader>ld", [[<cmd>lua vim.lsp.buf.definition()<CR>]],                                        "Go to definition")
  map("n", "<Leader>lD", [[<cmd>lua vim.lsp.buf.implementation()<CR>]],                                    "Go to implementation")
  map("n", "<Leader>lf", [[<cmd>lua require("conform").format({ async = true, lsp_fallback = true })<CR>]], "Format")
  map("n", "<Leader>lh", [[<cmd>lua vim.lsp.buf.hover()<CR>]],                                             "Hover docs")
  map("n", "<Leader>lH", [[<cmd>lua vim.lsp.buf.signature_help()<CR>]],                                    "Signature help")
  map("n", "<Leader>la", [[<cmd>lua vim.lsp.buf.code_action()<CR>]],                                       "Code action")
  map("v", "<Leader>la", [[<cmd>lua vim.lsp.buf.code_action()<CR>]],                                       "Code action")
  map("n", "<Leader>lr", [[<cmd>lua vim.lsp.buf.rename()<CR>]],                                            "Rename")
  map("n", "<Leader>lR", [[<cmd>lua vim.lsp.buf.references()<CR>]],                                        "References")
  map("n", "<Leader>ls", [[<cmd>Telescope lsp_document_symbols<CR>]],                                      "Document symbols")
  map("n", "<Leader>lS", [[<cmd>Telescope lsp_workspace_symbols<CR>]],                                     "Workspace symbols")
  map("n", "<Leader>li", [[<cmd>lua vim.lsp.buf.incoming_calls()<CR>]],                                    "Incoming calls")
  map("n", "<Leader>lw", [[<cmd>Telescope diagnostics<CR>]],                                               "Workspace diagnostics")
  map("n", "<Leader>lt", [[<cmd>lua vim.lsp.buf.type_definition()<CR>]],                                   "Type definition")
  map("n", "<Leader>lL", [[<cmd>LspLog<CR>]],                                                              "LSP log")
  map("n", "<Leader>dd", [[<cmd>lua vim.diagnostic.open_float()<CR>]],                                     "Show diagnostic")
  map("n", "<Leader>dn", [[<cmd>lua vim.diagnostic.goto_next()<CR>]],                                      "Next diagnostic")
  map("n", "<Leader>dp", [[<cmd>lua vim.diagnostic.goto_prev()<CR>]],                                      "Previous diagnostic")
end

return M
