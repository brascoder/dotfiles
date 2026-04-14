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
  map("n", "<Leader>lef", ":ElixirFromPipe<cr>", opts)
  map("n", "<Leader>let", ":ElixirToPipe<cr>", opts)
  map("v", "<Leader>lem", ":ElixirExpandMacro<cr>", opts)

  require("cmp_nvim_lsp").default_capabilities(capabilities)
end

local elixir = require("elixir")
local elixirls = require("elixir.elixirls")

elixir.setup {
  nextls = {
    enable = false,
    on_attach = on_attach,
    spitfire = true,
    init_options = {
      experimental = {
        completions = {
          enable = true,
        },
      },
    },
  },
  elixirls = {
    on_attach = on_attach,
    cmd = { path_to_elixirls },
    settings = elixirls.settings {
      dialyzerEnabled = true,
      fetchDeps = false,
      enableTestLenses = false,
      suggestSpecs = false
    }
  },
  projectionist = {enable = true},
}

vim.lsp.config('*', {
  capabilities = capabilities,
  on_attach = on_attach,
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

vim.lsp.enable({ 'lua_ls', 'solargraph', 'ts_ls', 'tailwindcss' })
