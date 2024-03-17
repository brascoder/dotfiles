local lspconfig = require("lspconfig")
-- local path_to_elixirls = vim.fn.expand("~/.elixir-ls/language_server.sh")
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
  -- print("Attached to language server")

  local function map(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local opts = { noremap = true, silent = true }

  map("n", "<Leader>lc", [[<cmd>lua vim.lsp.codelens.run()<CR>]], opts)
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
  map("n", "<Leader>lef", ":ElixirFromPipe<cr>", opts)
  map("n", "<Leader>let", ":ElixirToPipe<cr>", opts)
  map("v", "<Leader>lem", ":ElixirExpandMacro<cr>", opts)

  require("cmp_nvim_lsp").default_capabilities(capabilities)
end

local elixir = require("elixir")
local elixirls = require("elixir.elixirls")

elixir.setup {
  elixirls = {
    on_attach = on_attach,
    tag = "v0.16.0",
    settings = elixirls.settings {
      dialyzerEnabled = true,
      fetchDeps = false,
      enableTestLenses = true,
      suggestSpecs = false
    }
  }
}

-- lspconfig.elixirls.setup({
--   cmd = {path_to_elixirls},
--   capabilities = capabilities,
--   on_attach = on_attach,
--   settings = {
--     elixirLS = {
--       dialyzerEnabled = true,
--       enableTestLenses = true
--     }
--   }
-- })

lspconfig.lua_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
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

lspconfig.tailwindcss.setup({
  capabilities = capabilities,
  on_attach = on_attach,
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

-- lspconfig.efm.setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
--   filetypes = {
--     "elixir",
--     "eelixir",
--     "heex",
--     "surface",
--     "javascript",
--     "lua",
--     "bash",
--     "zsh",
--     "html",
--     "on"
--   }
-- })
