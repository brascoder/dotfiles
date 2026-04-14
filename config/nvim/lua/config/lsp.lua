local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if ok then
  capabilities = vim.tbl_deep_extend("force", capabilities, cmp_lsp.default_capabilities())
end

local on_attach = function(_, bufnr)
  local function map(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local opts = { noremap = true, silent = true }

  map("n", "<Leader>ld", [[<cmd>lua vim.lsp.buf.definition()<CR>]], opts)
  map("n", "<Leader>lD", [[<cmd>lua vim.lsp.buf.implementation()<CR>]], opts)
  map("n", "<Leader>lf", [[<cmd>lua vim.lsp.buf.format({ async = true })<CR>]], opts)
  map("n", "<Leader>lh", [[<cmd>lua vim.lsp.buf.hover()<CR>]], opts)
  map("n", "<Leader>lH", [[<cmd>lua vim.lsp.buf.signature_help()<CR>]], opts)
  map("n", "<Leader>dd", [[<cmd>lua vim.diagnostic.open_float()<CR>]], opts)
  map("n", "<Leader>dn", [[<cmd>lua vim.diagnostic.goto_next()<CR>]], opts)
  map("n", "<Leader>dp", [[<cmd>lua vim.diagnostic.goto_prev()<CR>]], opts)
  map("n", "<Leader>lL", [[<cmd>LspLog<CR>]], opts)
  map("n", "<Leader>lt", [[<cmd>lua vim.lsp.buf.type_definition()<CR>]], opts)
end

vim.lsp.config('*', {
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.lsp.config('expert', {
  cmd = { 'expert', '--stdio' },
  filetypes = { 'elixir', 'eelixir', 'heex' },
  root_dir = function(fname)
    return vim.fs.dirname(vim.fs.find({ 'mix.exs' }, { upward = true, path = fname })[1])
  end,
})

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      }
    }
  }
})

vim.lsp.config('solargraph', {
  init_options = {
    formatting = true
  },
  settings = {
    solargraph = {
      diagnostics = true,
    }
  }
})

vim.lsp.config('ts_ls', {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx"
  },
})

vim.lsp.config('tailwindcss', {
  filetypes = {
    "eelixir",
    "elixir",
    "eruby",
    "heex",
    "html",
    "html-eex"
  },
  init_options = {
    userLanguages = {
      elixir = "phoenix-heex",
      heex = "phoenix-heex",
    },
  }
})

vim.lsp.enable({ 'expert', 'lua_ls', 'solargraph', 'ts_ls', 'tailwindcss' })
